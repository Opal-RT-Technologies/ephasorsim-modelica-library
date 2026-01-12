within OpalRT.ModelSets.Data.Governors.GAST;
record GAST_002
  extends DataGAST(
    R_tg = 0.01,
    T1_tg = 0.01,
    T2_tg = 0.01,
    T3_tg = 0.3,
    AT_tg = 0.12,
    KT_tg = 0.2,
    VMAX_tg = 0.12,
    VMIN_tg = 0.01,
    DTURB_tg = 0.01);
end GAST_002;
