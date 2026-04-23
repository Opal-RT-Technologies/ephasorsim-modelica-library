within OpalRT.ePHASORSIM.Wrappers;
partial model SingleGovernorFMU "Base for single-controller turbine governor FMU wrappers"
  final parameter Integer ephasorsim_minimum_major_version = 12 annotation(Evaluate=true, Dialog(enable=false));
  final parameter Integer ephasorsim_minimum_minor_version = 0 annotation(Evaluate=true, Dialog(enable=false));
end SingleGovernorFMU;
