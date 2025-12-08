within OpalRT.ModelSets.Data.Exciters.SCRX;
record SCRX_001
  extends OpalRT.ModelSets.Data.Exciters.SCRX.DataSCRX(
    TA_TB_ex=4,
    TB_ex=1,
    K_ex=100,
    TE_ex=0.5,
    EMIN_ex=-1.2,
    EMAX_ex=2,
    CSWITCH_ex=1,
    rc_rfd_ex=3);
end SCRX_001;
