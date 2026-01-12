within OpalRT.Electrical.Control.UnderExcitationLimiter.Internal;
function calculateOperatingPoint
  input Real Vmag;
  input Real Vang;
  input Real Imag;
  input Real Iang;
  input Real KUC;
  output Real VUC_out;
protected
  Real VE_r;
  Real VE_i;
algorithm
  VE_r := KUC * Vmag * cos(Vang) + Imag * sin(Iang);
  VE_i := KUC * Vmag * sin(Vang) - Imag * cos(Iang);
  VUC_out := sqrt(VE_r ^ 2 + VE_i ^ 2);
  annotation(Documentation(info = "<html>

<p>
This function is used to calculate VUC, which is |KUC*VT(phasor)-j*IT(phasor)|.Phasor represents for (magnitude of the variable)?(angle of the variable).
</p>


</html>"),
         Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
end calculateOperatingPoint;
