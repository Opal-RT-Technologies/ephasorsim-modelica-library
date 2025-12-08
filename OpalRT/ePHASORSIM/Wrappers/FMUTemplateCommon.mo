within OpalRT.ePHASORSIM.Wrappers;
partial block FMUTemplateCommon
  final parameter Integer ephasorsim_minimum_major_version = 12 annotation(Evaluate=true, Dialog(enable=false));
  final parameter Integer ephasorsim_minimum_minor_version = 0 annotation(Evaluate=true, Dialog(enable=false));

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end FMUTemplateCommon;
