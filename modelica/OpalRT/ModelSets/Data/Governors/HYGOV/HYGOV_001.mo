within OpalRT.ModelSets.Data.Governors.HYGOV;
record HYGOV_001
  extends DataHYGOV(
    R_tg = 0.06,
    r_tg = 0.4,
    Tr_tg = 8,
    Tf_tg = 0.05,
    Tg_tg = 0.2,
    VELM_tg = 0.01,
    GMAX_tg = 0.601,
    GMIN_tg = 0,
    TW_tg = 1.2,
    At_tg = 2.5,
    Dturb_tg = 0,
    qNL_tg = 0.5);
end HYGOV_001;
