## ---- include = FALSE----------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup---------------------------------------------------------------
library(julesR)
library(MASS)
library(emtools)

## ------------------------------------------------------------------------
source('default_jules_parameter_perturbations.R')

# Easiest way to generate a design of the right size is to have a "fac" which takes
# the names from the parameter list, and then multiplies everything by 0.5 or 2

tf <- 'l_vg_soil'
# we don't want anything that is TRUE/FALSE to be in fac
fac.init <- names(paramlist)
not_tf.ix <- which(names(paramlist)!=tf)
paramlist.trunc <-paramlist[not_tf.ix]

fac <- names(paramlist.trunc)

maxfac <-lapply(paramlist.trunc,function(x) x$max[which.max(x$max)] / x$standard[which.max(x$max)])
minfac <- lapply(paramlist.trunc,function(x) x$min[which.max(x$max)] / x$standard[which.max(x$max)])


## ------------------------------------------------------------------------
# create a directory for the configuration files
confdir <- 'conf_files_example'

dir.create(confdir)

# This is the function that writes the configuration files.
write_jules_design(paramlist, n = 100,
                    fac = fac, minfac = minfac, maxfac = maxfac,
                    tf = tf,
                    fnprefix = paste0(confdir,'/param-perturb-P'),
                    lhsfn = paste0(confdir,'/lhs_example.txt'),
                    stanfn = paste0(confdir,'/stanparms_example.txt'),
                    allstanfn = paste0(confdir,'/allstanparms_example.txt'),
                    rn = 12,
                    startnum = 0)

## ------------------------------------------------------------------------
print(cbind(minfac, maxfac))

## ------------------------------------------------------------------------
# Checking section
lapply(paramlist, function(x) length(x$standard))
lapply(paramlist, function(x) length(x$standard)==length(x$min) & length(x$standard)==length(x$max))


