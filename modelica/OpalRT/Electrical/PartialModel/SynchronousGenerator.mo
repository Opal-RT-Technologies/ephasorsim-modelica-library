within OpalRT.Electrical.PartialModel;
partial model SynchronousGenerator
  parameter Real partType = 2;
  import Modelica.ComplexMath.j;
  import Modelica.ComplexMath.conj;
  Complex v, i;
  Real PELEC "The generator electrical active power, p.u.";
  Real QELEC "The generator electrical reactive power, p.u.";
  parameter Boolean enablePQ = true "Enable PQ Calculation: true or false";
  Modelica.Blocks.Interfaces.RealInput PMECH annotation(Placement(visible = true, transformation(origin = {-100, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(extent = {{-110, -70}, {-90, -50}})));
  OpalRT.NonElectrical.Connector.PwPin p annotation(Placement(visible = true, transformation(origin = {2, -100}, extent = {{-10, -10}, {10, 10}}, rotation = -90), iconTransformation(origin = {0, -100}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealOutput SLIP annotation(Placement(visible = true, transformation(origin = {100, -26}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput PMECH0 annotation(Placement(visible = true, transformation(origin = {-100, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 180), iconTransformation(origin = {-100, -80}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput EFD0 annotation(Placement(visible = true, transformation(origin = {-102, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 180), iconTransformation(origin = {-102, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput EFD annotation(Placement(visible = true, transformation(origin = {-100, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput TRIP annotation(Placement(visible = true, transformation(origin = {0, 100}, extent = {{-10, -10}, {10, 10}}, rotation = -90), iconTransformation(origin = {0, 100}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealOutput AccPower annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 0, origin = {100, -50}), iconTransformation(extent = {{-10, -10}, {10, 10}}, rotation = 0, origin = {100, -26})));
  Modelica.Blocks.Interfaces.RealOutput XADIFD annotation(Placement(visible = true, transformation(origin = {100, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput ETERM0 annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 180, origin = {-100, 78}), iconTransformation(extent = {{10, -10}, {-10, 10}}, rotation = 0, origin = {-102, 50})));
  Modelica.Blocks.Interfaces.RealOutput EX_AUX[4] annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {60, -100}), iconTransformation(extent = {{10, -10}, {-10, 10}}, rotation = 0, origin = {-102, 80})));
  Modelica.Blocks.Interfaces.RealOutput MBASE annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {-40, -100}), iconTransformation(extent = {{-10, -10}, {10, 10}}, rotation = 0, origin = {100, -54})));
  Modelica.Blocks.Interfaces.RealOutput VI[4] annotation(Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  if enablePQ then
      PELEC + j * QELEC = v * conj(i);
  else
      PELEC = 0;
      QELEC = 0;
  end if;
  annotation(Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Text(origin = {11.2577, 43.6011}, extent = {{-47.2577, -17.6011}, {35.4119, -58.5663}}, textString = "%name", lineColor = {28, 108, 200}), Text(origin = {-58.9723, 47.2158}, extent = {{-35.0277, -11.2158}, {0.580674, -25.6084}}, textString = "EFD"), Text(origin = {-61.0104, 24.2574}, extent = {{-26.9896, -10.2574}, {4.54566, -25.0974}}, textString = "EFD0"), Text(origin = {-58.446, -42.1592}, extent = {{-31.9386, -11.7347}, {14.446, -23.8408}}, textString = "PMECH"), Text(origin = {-62.402, -63.8796}, extent = {{-26.7503, -10.7551}, {20.402, -22.1204}}, textString = "PMECH0"), Text(origin = {79.3116, -60.311}, extent = {{-17.3116, -13.689}, {7.83156, -27.8105}}, textString = "SLIP", lineColor = {0, 0, 0}), Text(origin = {-7.84189, -56.853}, extent = {{1.84189, -15.147}, {16.7619, -30.7724}}, textString = "P"), Rectangle(origin = {-0.123457, -0.123457}, extent = {{-100.123, 99.8765}, {100.123, -99.8765}}), Text(origin = {13.5759, 100.79}, extent = {{-25.5759, -12.7901}, {0.423987, -29.2029}}, textString = "TRIP"), Text(origin = {68.6832, 4.04041}, extent = {{-34.428, -19.3861}, {15.572, -39.3861}}, textString = "AccPower"), Text(origin = {73.1551, 80.7254}, extent = {{-27.1551, -20.7254}, {12.2849, -42.1054}}, lineColor = {0, 0, 0}, textString = "XADIFD"), Text(origin = {-54.9491, 67.57}, extent = {{-33.0509, -13.5696}, {14.9491, -27.5689}}, lineColor = {0, 0, 0}, textString = "ETERM0"), Text(origin = {-55.703, 109.386}, extent = {{-30.2967, -19.3861}, {13.7033, -39.3861}}, lineColor = {0, 0, 0}, textString = "EX_AUX"), Text(origin = {75.4112, -36.3684}, extent = {{-23.4112, -11.6316}, {10.5888, -23.6316}}, lineColor = {0, 0, 0}, textString = "MBASE", rotation = 360), Text(origin = {73.8542, 28.8426}, extent = {{-1.06032, -21.1348}, {15.1338, -36.5547}}, textString = "VI")}));
end SynchronousGenerator;
