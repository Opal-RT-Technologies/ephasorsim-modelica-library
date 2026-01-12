within OpalRT.Electrical.Machine.Common;
function dq2xy "converts dq coordinate to xy coordinate"
  import Modelica.ComplexMath.exp;
  import Modelica.ComplexMath.j;
  import Modelica.Constants.pi;
  input Complex u;
  input Real angle;
  output Complex y;
algorithm
  y := u * exp(j * (angle - pi / 2));
end dq2xy;
