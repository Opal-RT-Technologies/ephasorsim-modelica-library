within OpalRT.ModelSets.Data.Exciters.SCRX;
record SCRX_003
  extends OpalRT.ModelSets.Data.Exciters.SCRX.DataSCRX(
    TA_TB_ex=0.1,
    TB_ex=10,
    K_ex=150,
    TE_ex=0.05,
    EMIN_ex=0,
    EMAX_ex=3.62,
    CSWITCH_ex=1,
    rc_rfd_ex=10);
end SCRX_003;
