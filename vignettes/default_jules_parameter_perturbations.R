# Default parameter perturbations for JULES

# 0.5 and 2 times
b_wl_io = list(
  'standard' = rep(1.667, 13),
  'min' = rep((0.6*1.667), 13), # make sure b_wl > 1
  'max' = rep((2*1.667), 13),
  'namelist' = 'jules_pftparm'
)

# 0.5 and 2 times
sigl_io = list(
  'standard' = c(0.0375, 0.0375, 0.0375, 0.1, 0.1, 0.025, 0.025, 0.025, 0.05, 0.05, 0.05, 0.05, 0.05),
  'min' = 0.5 * c(0.0375, 0.0375, 0.0375, 0.1, 0.1, 0.025, 0.025, 0.025, 0.05, 0.05, 0.05, 0.05, 0.05),
  'max' = 2 * c(0.0375, 0.0375, 0.0375, 0.1, 0.1, 0.025, 0.025, 0.025, 0.05, 0.05, 0.05, 0.05, 0.05),
  'namelist' = 'jules_pftparm'
)

# 0.5 and custom
lai_max_io = list(
  'standard' = c(7,9,7,5,7,3,3,3,3,3,3,4,4),
  'min' = 0.5 * c(7,9,7,5,7,3,3,3,3,3,3,4,4),
  'max' = c(10,10,10,10,10,6,6,6,6,6,6,7,7),
  'namelist' = 'jules_triffid'
)

# 1/3 and 3 times
lai_min_io = list(
  'standard' = c(1,1,1,1,1,0.6,0.6,0.6,0.6,0.6,0.6,1,1),
  'min' = 0.33 * c(1,1,1,1,1,0.6,0.6,0.6,0.6,0.6,0.6,1,1),
  'max' = 3 * c(1,1,1,1,1,0.6,0.6,0.6,0.6,0.6,0.6,1,1),
  'namelist' = 'jules_triffid'
)

# fix the zeros to -1,1 so that we get some variation in range
tlow_io = list(
  'standard' = c(10,13,13,-10,0,10,10,10,13,13,13,10,0),
  'min' = 0.9 * c(10,13,13,-10,-1,10,10,10,13,13,13,10,-1),
  'max' = 1.1 * c(10,13,13,-10,1,10,10,10,13,13,13,10,1),
  'namelist' = 'jules_pftparm'
)

# 0.5 and 2 times
g_area_io = list(
  'standard' = c(0.011,0.007,0.014,0.01,0.025,0.125,0.125,0.125,0.06,0.06,0.06,0.06,0.1),
  'min' = 0.5 * c(0.011,0.007,0.014,0.01,0.025,0.125,0.125,0.125,0.06,0.06,0.06,0.06,0.1),
  'max' = 2 * c(0.011,0.007,0.014,0.01,0.025,0.125,0.125,0.125,0.06,0.06,0.06,0.06,0.1),
  'namelist' = 'jules_triffid'
)

# 0.5 and 2 times
dqcrit_io = list(
  'standard' = c(0.09,0.09,0.09,0.041,0.06,0.051,0.051,0.051,0.075,0.075,0.075,0.03,0.044),
  'min' = 0.5 * c(0.09,0.09,0.09,0.041,0.06,0.051,0.051,0.051,0.075,0.075,0.075,0.03,0.044) ,
  'max' = 2 * c(0.09,0.09,0.09,0.041,0.06,0.051,0.051,0.051,0.075,0.075,0.075,0.03,0.044),
  'namelist' = 'jules_pftparm'
)

# 0.5 and 2 times
r_grow_io = list(
  'standard' = rep(0.25,13),
  'min' = 0.5 * rep(0.25,13),
  'max' = 2 * rep(0.25,13) ,
  'namelist' = 'jules_pftparm'
)

nmass_io = list(
  'standard' = c(0.021 ,0.017, 0.0144, 0.0186, 0.0115, 0.024, 0.024, 0.024, 0.0113, 0.0113, 0.0113, 0.0218, 0.0136),
  'min' = 0.5 * c(0.021 ,0.017, 0.0144, 0.0186, 0.0115, 0.024, 0.024, 0.024, 0.0113, 0.0113, 0.0113, 0.0218, 0.0136),
  'max' = 2 * c(0.021 ,0.017, 0.0144, 0.0186, 0.0115, 0.024, 0.024, 0.024, 0.0113, 0.0113, 0.0113, 0.0218, 0.0136),
  'namelist' = 'jules_pftparm'
)

lma_io = list(
  'standard' = c(0.0823,0.1039, 0.1403,0.1006, 0.2263,0.0495, 0.0495, 0.0495, 0.137, 0.137, 0.137, 0.0709, 0.1515),
  'min' = 0.5 * c(0.0823,0.1039, 0.1403,0.1006, 0.2263,0.0495, 0.0495, 0.0495, 0.137, 0.137, 0.137, 0.0709, 0.1515),
  'max' = 2 * c(0.0823,0.1039, 0.1403,0.1006, 0.2263,0.0495, 0.0495, 0.0495, 0.137, 0.137, 0.137, 0.0709, 0.1515),
  'namelist' = 'jules_pftparm'
)

nr_io = list(
  'standard' = c(0.01726, 0.01726, 0.01726, 0.00784, 0.00784, 0.0162, 0.0162, 0.0162, 0.0084, 0.0084, 0.0084, 0.01726, 0.0172) ,
  'min' = 0.5 * c(0.01726, 0.01726, 0.01726, 0.00784, 0.00784, 0.0162, 0.0162, 0.0162, 0.0084, 0.0084, 0.0084, 0.01726, 0.0172),
  'max' = 2 * c(0.01726, 0.01726, 0.01726, 0.00784, 0.00784, 0.0162, 0.0162, 0.0162, 0.0084, 0.0084, 0.0084, 0.01726, 0.0172),
  'namelist' = 'jules_pftparm'
)


tleaf_of_io = list(
  'standard' = c(280, 278.15, 233.15, 278.15,233.15, 278.15, 278.15, 278.15, 278.15, 278.15, 278.15, 280, 233.15) ,
  'min' = 0.9 * c(280, 278.15, 233.15, 278.15,233.15, 278.15, 278.15, 278.15, 278.15, 278.15, 278.15, 280, 233.15),
  'max' = 1.1 * c(280, 278.15, 233.15, 278.15,233.15, 278.15, 278.15, 278.15, 278.15, 278.15, 278.15, 280, 233.15),
  'namelist' = 'jules_pftparm'
)

dcatch_dlai_io = list(
  'standard' = rep(0.05, 13) ,
  'min' = 0.5 * rep(0.05, 13) ,
  'max' = 2 * rep(0.05, 13) ,
  'namelist' = 'jules_pftparm'
)

alpha_io = list(
  'standard' = c(0.064, 0.064, 0.048, 0.08, 0.064, 0.048, 0.048, 0.048, 0.04, 0.04, 0.04, 0.064, 0.048),
  'min' = 0.5 * c(0.064, 0.064, 0.048, 0.08, 0.064, 0.048, 0.048, 0.048, 0.04, 0.04, 0.04, 0.064, 0.048),
  'max' = 2 * c(0.064, 0.064, 0.048, 0.08, 0.064, 0.048, 0.048, 0.048, 0.04, 0.04, 0.04, 0.064, 0.048),
  'namelist' = 'jules_pftparm'
)


# These parameters taken from GA7

dz0v_dh_io_frac = c(0, 0.16) / 0.05
dz0v_dh_io = list(
  'standard' = c(0.05, 0.05, 0.05, 0.05, 0.05, 0.1 , 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1),
  'min' = rep(0, 13),
  'max' =  dz0v_dh_io_frac[2] * c(0.05, 0.05, 0.05, 0.05, 0.05, 0.1 , 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1),
  'namelist' = 'jules_pftparm'
)

f0_io_frac = c(0.65, 0.972) / 0.875
f0_io = list(
  'standard' = c(0.875, 0.875, 0.892, 0.875, 0.875, 0.931, 0.931, 0.931, 0.8, 0.8, 0.8, 0.875, 0.875),
  'min' =  f0_io_frac[1] * c(0.875, 0.875, 0.892, 0.875, 0.875, 0.931, 0.931, 0.931, 0.8, 0.8, 0.8, 0.875, 0.875),
  'max' = f0_io_frac[2] * c(0.875, 0.875, 0.892, 0.875, 0.875, 0.931, 0.931, 0.931, 0.8, 0.8, 0.8, 0.875, 0.875),
  'namelist' = 'jules_pftparm'
)

rootd_ft_io_frac = c(0, 8) /3
rootd_ft_io = list(
  'standard' = c(2, 3, 2, 2, 1.8, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5),
  'min' = rep(0, 13),
  'max' = rootd_ft_io_frac[2] * c(2, 3, 2, 2, 1.8, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5),
  'namelist' = 'jules_pftparm'
)

tupp_io_frac = c(25,41) / 36
tupp_io = list(
  'standard' = c(43, 43, 43, 26, 32, 32, 32, 32, 45, 45, 45, 40, 36),
  'min' = tupp_io_frac[1] * c(43, 43, 43, 26, 32, 32, 32, 32, 45, 45, 45, 40, 36),
  'max' = tupp_io_frac[2] * c(43, 43, 43, 26, 32, 32, 32, 32, 45, 45, 45, 40, 36),
  'namelist' = 'jules_pftparm'
)


# Andy Wiltshire's JULES Parameter choices
# Doug McNeall dougmcneall@gmail.com


hw_sw_io = list(
  'standard' = rep(0.5, 13),
  'min' = rep(0, 13),
  'max' = rep(1,13),
  'namelist' = 'jules_pftparm'
)

knl_io = list(
  'standard' = rep(0.2, 13),
  'min' = rep(0.1, 13),
  'max' = rep(0.5,13),
  'namelist' = 'jules_pftparm'
)

a_wl_io = list(
  'standard' = c(0.78, 0.845, 0.78, 0.8, 0.65, 0.005, 0.005, 0.005, 0.005, 0.005, 0.005, 0.13, 0.13),
  'min' = 0.5 * c(0.78, 0.845, 0.78, 0.8, 0.65, 0.005, 0.005, 0.005, 0.005, 0.005, 0.005, 0.13, 0.13),
  'max' = 2* c(0.78, 0.845, 0.78, 0.8, 0.65, 0.005, 0.005, 0.005, 0.005, 0.005, 0.005, 0.13, 0.13),
  'namelist' = 'jules_pftparm'
)

fd_io = list(
  'standard' = c(0.01, 0.01, 0.01, 0.015, 0.015, 0.019, 0.019, 0.019, 0.019, 0.019, 0.019, 0.015, 0.015),
  'min' = 0.5 * c(0.01, 0.01, 0.01, 0.015, 0.015, 0.019, 0.019, 0.019, 0.019, 0.019, 0.019, 0.015, 0.015),
  'max' = 2 * c(0.01, 0.01, 0.01, 0.015, 0.015, 0.019, 0.019, 0.019, 0.019, 0.019, 0.019, 0.015, 0.015),
  'namelist' = 'jules_pftparm'
)

g_root_io = list(
  'standard' = c(0.15, 0.25, 0.25, 0.15, 0.15, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.15, 0.15),
  'min' = rep(0, 13),
  'max' = rep(0.5, 13),
  'namelist' = 'jules_triffid'
)

g_wood_io = list(
  'standard' = c(0.01, 0.01, 0.01, 0.01, 0.01, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.05, 0.05),
  'min' = rep(0,13),
  'max'      = c(0.05, 0.05, 0.05, 0.05, 0.05, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.1, 0.1),
  'namelist' = 'jules_triffid'
)

retran_l_io = list(
  'standard' = c(0.5, 0.5, 0.5, 0.77, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5),
  'min' = rep(0,13),
  'max' = rep(1,13),
  'namelist' = 'jules_triffid'
)

retran_r_io = list(
  'standard' = rep(0.2,13),
  'min' = rep(0,13),
  'max' = rep(1,13),
  'namelist' = 'jules_triffid'
)

kaps_roth = list(
  'standard' = c(2.15E-07, 6.43E-09, 1.41E-08, 4.29E-10),
  'min' = 0.5 * c(2.15E-07, 6.43E-09, 1.41E-08, 4.29E-10),
  'max' = 2 * c(2.15E-07, 6.43E-09, 1.41E-08, 4.29E-10),
  'namelist' = 'jules_soil_biogeochem'
)

n_inorg_turnover = list(
  'standard' = 1,
  'min' = 0,
  'max' = 10,
  'namelist' = 'jules_soil_biogeochem'
)

sorp = list(
  'standard' = 10,
  'min' = 0,
  'max' = 20,
  'namelist' = 'jules_soil_biogeochem'
)

bio_hum_cn = list(
  'standard' = 10,
  'min' = 5,
  'max' = 20,
  'namelist' = 'jules_soil_biogeochem'
)

l_vg_soil = list(
  'standard' = '.false.',
  'min' = '.false.',
  'max' = '.true.',
  'namelist' = 'jules_soil'
)

gs_nvg_io = list(
  'standard' = c(0.00000, 0.00000, 1.00000e-2, 1.00000e+6, 1.00000e+6, 1.00000e+6, 1.00000e+6, 1.00000e+6, 1.00000e+6, 1.00000e+6, 1.00000e+6, 1.00000e+6, 1.00000e+6, 1.00000e+6),
  'min' = 0.5 * c(0.00000, 0.00000, 1.00000e-2, 1.00000e+6, 1.00000e+6, 1.00000e+6, 1.00000e+6, 1.00000e+6, 1.00000e+6, 1.00000e+6, 1.00000e+6, 1.00000e+6, 1.00000e+6, 1.00000e+6),
  'max' = 2* c(0.00000, 0.00000, 1.00000e-2, 1.00000e+6, 1.00000e+6, 1.00000e+6, 1.00000e+6, 1.00000e+6, 1.00000e+6, 1.00000e+6, 1.00000e+6, 1.00000e+6, 1.00000e+6, 1.00000e+6),
  'namelist' = 'jules_nvegparm'
)


paramlist = list(
  'alpha_io' = alpha_io, # FMEC excluded, low sensitivity
  'a_wl_io' = a_wl_io,
  'bio_hum_cn' = bio_hum_cn,
  'b_wl_io' = b_wl_io,
  'dcatch_dlai_io' = dcatch_dlai_io,
  'dqcrit_io' = dqcrit_io,
  'dz0v_dh_io' = dz0v_dh_io,
  'f0_io' = f0_io,
  'fd_io' = fd_io,
  'g_area_io' = g_area_io,
  'g_root_io' = g_root_io, # FMEC excluded, constrained in literature
  'g_wood_io' = g_wood_io,
  'gs_nvg_io' = gs_nvg_io,
  'hw_sw_io' = hw_sw_io,
  'kaps_roth' = kaps_roth,
  'knl_io' = knl_io,
  'lai_max_io' = lai_max_io,
  'lai_min_io' = lai_min_io,
  'lma_io' = lma_io,
  'l_vg_soil' = l_vg_soil,
  'n_inorg_turnover' = n_inorg_turnover,
  'nmass_io' = nmass_io,
  'nr_io' = nr_io,
  'retran_l_io' = retran_l_io,
  'retran_r_io' = retran_r_io,
  'r_grow_io' = r_grow_io,
  'rootd_ft_io' = rootd_ft_io,
  'sigl_io' = sigl_io,
  'sorp' = sorp,
  'tleaf_of_io' = tleaf_of_io,
  'tlow_io' = tlow_io,
  'tupp_io' = tupp_io
)
