within OpalRT.ePHASORSIM.Wrappers;
partial model SingleExciterFMU "Base for single-controller exciter FMU wrappers"
  final parameter Integer ephasorsim_minimum_major_version = 12 annotation(Evaluate=true, Dialog(enable=false));
  final parameter Integer ephasorsim_minimum_minor_version = 0 annotation(Evaluate=true, Dialog(enable=false));
  Modelica.Blocks.Interfaces.RealOutput ECOMP "Compensated terminal voltage";
end SingleExciterFMU;
