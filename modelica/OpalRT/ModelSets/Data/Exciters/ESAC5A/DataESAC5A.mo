within OpalRT.ModelSets.Data.Exciters.ESAC5A;
partial record DataESAC5A
  extends OpalRT.ModelSets.Data.Exciters.ExciterData;
  parameter Real TR_ex "(sec)" annotation(Dialog(tab = "ESAC5A Parameters"));
  parameter Real KA_ex annotation(Dialog(tab = "ESAC5A Parameters"));
  parameter Real TA_ex "(sec)" annotation(Dialog(tab = "ESAC5A Parameters"));
  parameter Real VRMAX_ex "or zero" annotation(Dialog(tab = "ESAC5A Parameters"));
  parameter Real VRMIN_ex "V" annotation(Dialog(tab = "ESAC5A Parameters"));
  parameter Real KE_ex "or zero" annotation(Dialog(tab = "ESAC5A Parameters"));
  parameter Real TE_ex "(sec)" annotation(Dialog(tab = "ESAC5A Parameters"));
  parameter Real KF_ex annotation(Dialog(tab = "ESAC5A Parameters"));
  parameter Real TF1_ex "(>0) (sec)" annotation(Dialog(tab = "ESAC5A Parameters"));
  parameter Real TF2_ex "(>0) (sec)" annotation(Dialog(tab = "ESAC5A Parameters"));
  parameter Real TF3_ex "(>0) (sec)" annotation(Dialog(tab = "ESAC5A Parameters"));
  parameter Real E1_ex annotation(Dialog(tab = "ESAC5A Parameters"));
  parameter Real SE_E1_ex annotation(Dialog(tab = "ESAC5A Parameters"));
  parameter Real E2_ex annotation(Dialog(tab = "ESAC5A Parameters"));
  parameter Real SE_E2_ex annotation(Dialog(tab = "ESAC5A Parameters"));
end DataESAC5A;
