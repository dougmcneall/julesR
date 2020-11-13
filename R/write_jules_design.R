#' Create an ensemble design for jules
#'
#' This code writes a design taking either a 'factor', min and max by which to multiply all pfts,
#' or perturbing each pft individually according to their maximum and minimum in the parameter list.
#'
#' @param paramlist character vector of chosen parameters
#' @param n number of ensemble members
#' @param fac  character vector of names of variables that you would like to alter by a factor. Everything else gets variaed by PFT
#' @param minfac must correspond to fac - i.e. one value per parameter,
#' @param maxfac must correspond to fac - i.e. one value per parameter,
#' @param tf character vector containing the logical parameters
#' @param fnprefix filename prefix
#' @param lhsfn latin hypercube filename
#' @param stanfn standard parameter filename
#' @param allstanfn allstanparams filename
#' @param rn rounding number
#' @param startnum ensemble indexing start number
#'
#' @return none
#' @export
#'
#'
#' @import emtools lhs
#' @examples
write_jules_design <- function(paramlist, n, fac, minfac, maxfac, tf, fnprefix = 'param-perturb-test',
                               lhsfn = 'lhs.txt',stanfn = 'stanparms.txt', allstanfn = 'allstanparms.txt', rn = 5, startnum=0){
  # This code writes a design taking either a 'factor', min and max by which
  # to multiply all pfts, or perturbing each pft individually according to
  # their maximum and minimum in the parameter list.
  # fac is a character vector of names of variables that you would like to alter
  # by a factor. Everything else gets variaed by PFT
  # minfac and maxfac must correspond to fac - i.e. one value per parameter, in the
  # correct order.
  # tf is a character vector containing the logical parameters

  stopifnot(
    all(
      length(fac) == length(minfac),
      length(fac) == length(maxfac)
    )
  )

  paramvec = names(paramlist)
  nmlvec = unlist(lapply(paramlist, FUN = function(x) x$namelist))

  # which parameters do we want as a parameter list?
  fac.ix = which(names(paramlist) %in% fac)
  tf.ix = which(names(paramlist) %in% tf)

  paramfac = paramlist[fac.ix]
  paramtf = paramlist[tf.ix]
  parampft = paramlist[-c(fac.ix, tf.ix)]
  pftvec = names(parampft)

  parampft_nml = unlist(lapply(parampft, FUN = function(x) x$namelist))
  paramfac_nml = unlist(lapply(paramfac, FUN = function(x) x$namelist))
  paramtf_nml = unlist(lapply(paramtf, FUN = function(x) x$namelist))

  parampft_standard = unlist(lapply(parampft, FUN = function(x) x$standard))
  parampft_mins = unlist(lapply(parampft, FUN = function(x) x$min))
  parampft_maxes = unlist(lapply(parampft, FUN = function(x) x$max))

  paramfac_standard = unlist(lapply(paramfac, FUN = function(x) x$standard))
  paramtf_standard = unlist(lapply(paramtf, FUN = function(x) x$standard))

  all_names = c(names(parampft_standard), fac, tf)
  k = length(all_names)

  # This writes out the 'standard' parameters, but sets the "factors"
  # used to multiply them to "1". It should produce the same
  # number of columns as the output design.
  #
  standard_matrix = matrix( c(parampft_standard, rep(1, length(fac)), paramtf_standard), nrow = 1)
  colnames(standard_matrix) = all_names
  write.matrix(standard_matrix, file = stanfn)

  standard_matrix_all = matrix( c(parampft_standard, paramfac_standard, paramtf_standard), nrow = 1)

  # Writes standard values for all pfts, even if they aren't used.
  colnames(standard_matrix_all) = c(names(parampft_standard),
                                    names(paramfac_standard),
                                    names(paramtf_standard))

  write.matrix(standard_matrix_all, file = allstanfn)

  # Do the pfts and then the factors and then the logical
  lhs = unnormalize(
    maximinLHS(n = n, k = k, dup = 1),
    un.mins = c(parampft_mins , minfac, rep(0, length(tf)), recursive = TRUE),
    un.maxes = c(parampft_maxes, maxfac, rep(1, length(tf)), recursive = TRUE)
  )
  colnames(lhs) = all_names

  for(i in 1:nrow(lhs)){
    fn = paste0(fnprefix,sprintf("%04d",(startnum+i)-1),'.conf')

    for(el in unique(nmlvec)){
      write(paste0('[namelist:',el,']'), file = fn, append = TRUE)

      # grab the parts of the list that match
      pft_elms = parampft[parampft_nml==el] # & statement
      pft_elms_vec = names(pft_elms)
      fac_elms = paramfac[paramfac_nml==el]
      fac_elms_vec = names(fac_elms)
      tf_elms = paramtf[paramtf_nml==el]
      tf_elms_vec = names(tf_elms)

      if(length(pft_elms_vec) > 0){
        for(j in 1:length(pft_elms_vec)){
          param = pft_elms_vec[j]
          colix = grep(param, colnames(lhs))
          values.out = lhs[i, colix]
          write(paste0(param,'=',(paste0(round(values.out,rn), collapse = ',')), collapse = ''),
                file = fn, append = TRUE)
        }
      }

      if(length(fac_elms_vec) > 0){
        for(k in 1: length(fac_elms_vec)){
          param = fac_elms_vec[k]
          colix = grep(param, colnames(lhs))
          lhs.factor = lhs[i, colix]
          values.out = lhs.factor * get(param, paramlist)$standard
          write(paste0(param,'=',(paste0(round(values.out,rn), collapse = ',')), collapse = ''),
                file = fn, append = TRUE)
        }
      }

      if(length(tf_elms_vec) > 0){
        for(l in 1: length(tf_elms_vec)){
          param = tf_elms_vec[l]
          colix = grep(param, colnames(lhs))
          lhs.factor = lhs[i, colix]
          logical.out = NA
          if (lhs.factor>=0.5){logical.out = '.true.'}
          else {logical.out = '.false.'}
          write(paste0(param,'=',logical.out, collapse = ''), file = fn, append = TRUE)
        }
      }
      write('\n', file = fn, append = TRUE)
    }
  }

  write.matrix(lhs, file = lhsfn)
}
