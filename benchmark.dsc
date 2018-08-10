#!/usr/bin/env dsc

%include modules/presimulate
%include modules/simulate
%include modules/susie_analyze
%include modules/prediction
%include modules/score

DSC:
  define:
    presimulate: compute_beta_sigma 
    susie_smallEffect_gaussian_analyze: susie_gaussian, susieL0_gaussian
    susie_largeEffect_gaussian_analyze: susie_gaussian_largeEffect, susieL0_gaussian_largeEffect
    susie_smallEffect_binary_analyze: susie_binary, susieL0_binary
    susie_largeEffect_binary_analyze: susie_binary_largeEffect, susieL0_binary_largeEffect
    score: compute_hit
    
  run: 
    susie_smallEffect_gaussian: presimulate * sim_gaussian_y * susie_smallEffect_gaussian_analyze * compute_pred_err_gaussian_smallEffect * score
    susie_largeEffect_gaussian: presimulate * sim_gaussian_largeEffect_y * susie_largeEffect_gaussian_analyze * compute_pred_err_guassian_largeEffect * score
    susie_smallEffect_binary: presimulate * sim_binary_y * susie_smallEffect_binary_analyze * compute_pred_err_binary_smallEffect * score
    susie_largeEfeect_gaussian: presimulate * sim_binary_largeEffect_y * susie_largeEffect_binary_analyze * compute_pred_err_binary_largeEffect * score

  exec_path: modules, code
  R_libs: MASS, glmnet, susieR@stephenslab/susieR
  global:
    pathX: "data/wbbr_test_X.rds"
    pathy: "data/wbbr_test_y.rds"
    
    
    
    
    
    
    
    