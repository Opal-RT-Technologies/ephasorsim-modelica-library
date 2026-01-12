within OpalRT.NonElectrical.Math.Nonlinear;
block PieceWiseLinear10
  Modelica.Blocks.Interfaces.RealInput u annotation(Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Real y1;
  parameter Real y2;
  parameter Real y3;
  parameter Real y4;
  parameter Real y5;
  parameter Real y6;
  parameter Real y7;
  parameter Real y8;
  parameter Real y9;
  parameter Real y10;
  parameter Real u1;
  parameter Real u2;
  parameter Real u3;
  parameter Real u4;
  parameter Real u5;
  parameter Real u6;
  parameter Real u7;
  parameter Real u8;
  parameter Real u9;
  parameter Real u10;
  //avoids hardcoding issues:
protected
  parameter Real ut1(fixed = false);
  parameter Real ut2(fixed = false);
  parameter Real ut3(fixed = false);
  parameter Real ut4(fixed = false);
  parameter Real ut5(fixed = false);
  parameter Real ut6(fixed = false);
  parameter Real ut7(fixed = false);
  parameter Real ut8(fixed = false);
  parameter Real ut9(fixed = false);
  parameter Real ut10(fixed = false);
initial equation
  ut1 = u1;
  ut2 = u2;
  ut3 = u3;
  ut4 = u4;
  ut5 = u5;
  ut6 = u6;
  ut7 = u7;
  ut8 = u8;
  ut9 = u9;
  ut10 = u10;
equation
  if u <= ut1 then
    y = y1;
  elseif u <= ut2 then
    y = y1 + (y2 - y1) * (u - ut1) / (ut2 - ut1);
  elseif u <= ut3 then
    y = y2 + (y3 - y2) * (u - ut2) / (ut3 - ut2);
  elseif u <= ut4 then
    y = y3 + (y4 - y3) * (u - ut3) / (ut4 - ut3);
  elseif u <= ut5 then
    y = y4 + (y5 - y4) * (u - ut4) / (ut5 - ut4);
  elseif u <= ut6 then
    y = y5 + (y6 - y5) * (u - ut5) / (ut6 - ut5);
  elseif u <= ut7 then
    y = y6 + (y7 - y6) * (u - ut6) / (ut7 - ut6);
  elseif u <= ut8 then
    y = y7 + (y8 - y7) * (u - ut7) / (ut8 - ut7);
  elseif u <= ut9 then
    y = y8 + (y9 - y8) * (u - ut8) / (ut9 - ut8);
  elseif u <= ut10 then
    y = y9 + (y10 - y9) * (u - ut9) / (ut10 - ut9);
  else
    y = y10;
  end if;
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Rectangle(origin = {0.135318, -0.135318}, extent = {{-99.7294, 100}, {99.7294, -100}}), Text(origin = {-52.9462, -67.4202}, extent = {{-16.24, 12.04}, {9.47, 1.22}}, textString = "(u1,y1)"), Text(origin = {-53.0135, -42.6809}, extent = {{-16.24, 12.04}, {9.47, 1.22}}, textString = "(u2,y2)"), Text(origin = {-46.632, -16.8706}, extent = {{-16.24, 12.04}, {9.47, 1.22}}, textString = "(u3,y3)"), Text(origin = {-32.0162, 7.02642}, extent = {{-19.9959, 12.5095}, {6.6531, 3.09793}}, textString = "(u4,y4)"), Text(origin = {98.4327, -71.3601}, extent = {{-16.24, 12.04}, {2.88951, -9.59081}}, textString = "u"), Text(origin = {-73.5221, 88.1986}, extent = {{-16.24, 12.04}, {2.65063, -8.64576}}, textString = "y"), Text(origin = {-20.8913, 28.9187}, extent = {{-16.24, 12.04}, {9.47, 1.22}}, textString = "(u5,y5)"), Line(origin = {2.31978, 0.966602}, points = {{-82.6015, 76.0287}, {-82.6015, -74.6755}, {81.2483, -74.6755}, {82.1873, -75.6145}}), Line(origin = {15.0235, -11.0329}, points = {{-95.3052, -48.1221}, {-85.9155, -48.1221}, {-85.446, -25.1174}, {-78.8732, 3.99061}, {-68.0751, 29.8122}, {-52.5822, 51.4085}, {-31.9249, 70.1878}, {-6.10329, 80.9859}, {18.7793, 86.1502}, {46.0094, 87.5587}, {70.4225, 87.5587}, {86.385, 87.5587}, {86.385, 88.0282}}), Text(origin = {-7.74695, 52.1112}, extent = {{-12.44, 5.63}, {12.44, -5.63}}, textString = "(u6,y6)"), Text(origin = {11.9712, 66.4346}, extent = {{-8.69, 8.69}, {14.7933, -14.3238}}, textString = "(u7,y7)"), Text(origin = {45.3095, 66.9049}, extent = {{-19.01, 7.28}, {7.27291, -1.17671}}, textString = "(u8,y8)"), Text(origin = {71.8358, 65.9662}, extent = {{-17.84, 9.62}, {6.10291, 0.239155}}, textString = "(u9,y9)"), Text(origin = {81.6913, 81.6889}, extent = {{-15.49, 5.16}, {12.6731, -4.69052}}, textString = "(u10,y10)")}));
end PieceWiseLinear10;
