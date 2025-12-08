within OpalRT.ModelSets.Data.Governors.PIDGOV;
record PIDGOV_001
  extends OpalRT.ModelSets.Data.Governors.PIDGOV.DataPIDGOV(
    Rperm_tg=0.05,
    Treg_tg=0.03,
    Kp_tg=6,
    Ki_tg=30,
    Kd_tg=0.01,
    Ta_tg=0.04,
    Tb_tg=0.5,
    Dturb_tg=0.01,
    G0_tg=0.3,
    G1_tg=0.5,
    P1_tg=0.6,
    G2_tg=0.7,
    P2_tg=0.8,
    P3_tg=1,
    Gmax_tg=0.95,
    Gmin_tg=0,
    Atw_tg=1.1,
    Tw_tg=0.4,
    Velmax_tg=0.2,
    Velmin_tg=-0.2,
    M_tg=0);
end PIDGOV_001;
