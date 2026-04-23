within OpalRT.ePHASORSIM.Wrappers;
partial model SingleStabilizerFMU "Base for single-controller power system stabilizer FMU wrappers"
  final parameter Integer ephasorsim_minimum_major_version = 12 annotation(Evaluate=true, Dialog(enable=false));
  final parameter Integer ephasorsim_minimum_minor_version = 0 annotation(Evaluate=true, Dialog(enable=false));
  Modelica.Blocks.Interfaces.RealInput ECOMP "Compensated terminal voltage (from exciter coupling)";
end SingleStabilizerFMU;
