within OpalRT.ModelSets.Data.Exciters.ESAC8B;
partial record DataESAC8B
  extends OpalRT.ModelSets.Data.Exciters.ExciterData;
  parameter Real TR_ex "(sec)" annotation(Dialog(tab = "ESAC8B"));
  parameter Real KP_ex annotation(Dialog(tab = "ESAC8B"));
  parameter Real KI_ex annotation(Dialog(tab = "ESAC8B"));
  parameter Real KD_ex annotation(Dialog(tab = "ESAC8B"));
  parameter Real TD_ex "(sec)" annotation(Dialog(tab = "ESAC8B"));
  parameter Real KA_ex annotation(Dialog(tab = "ESAC8B"));
  parameter Real TA_ex "(sec)" annotation(Dialog(tab = "ESAC8B"));
  parameter Real VRMAX_ex "or zero" annotation(Dialog(tab = "ESAC8B"));
  parameter Real VRMIN_ex annotation(Dialog(tab = "ESAC8B"));
  parameter Real TE_ex "(>0)(sec)" annotation(Dialog(tab = "ESAC8B"));
  parameter Real KE_ex "or zero" annotation(Dialog(tab = "ESAC8B"));
  parameter Real E1_ex annotation(Dialog(tab = "ESAC8B"));
  parameter Real SE_E1_ex annotation(Dialog(tab = "ESAC8B"));
  parameter Real E2_ex annotation(Dialog(tab = "ESAC8B"));
  parameter Real SE_E2_ex annotation(Dialog(tab = "ESAC8B"));
end DataESAC8B;
