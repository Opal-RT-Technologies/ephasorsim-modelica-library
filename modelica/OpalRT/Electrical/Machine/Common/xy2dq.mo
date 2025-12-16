within OpalRT.Electrical.Machine.Common;
function xy2dq "converts xy coordinate to dq coordinate"
  import Modelica.ComplexMath.exp;
  import Modelica.ComplexMath.j;
  import Modelica.Constants.pi;
  input Complex u;
  input Real angle;
  output Complex y;
algorithm
  y := u * exp(j * ((-angle) + pi / 2));
end xy2dq;
