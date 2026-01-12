within OpalRT.ModelSets.Data.Governors.GAST;
record GAST_001
  extends DataGAST(
    R_tg = 0.047,
    T1_tg = 0.4,
    T2_tg = 0.1,
    T3_tg = 3,
    AT_tg = 1.5,
    KT_tg = 2,
    VMAX_tg = 1.5,
    VMIN_tg = 0,
    DTURB_tg = 0);
end GAST_001;
