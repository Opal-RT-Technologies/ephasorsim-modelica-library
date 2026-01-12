within OpalRT.Electrical.Control.UnderExcitationLimiter.Internal;
function Pz_calc
  "This function calculates the value P_z which belongs to P_vector for which if P>P_z, then Q = 0."
  input Real[11] P_vector;
  input Real[11] Q_vector;
  output Real P_z;
protected
  Integer nonzero_idx;
algorithm
  nonzero_idx := 0;
  for i in 1:11 loop
    if P_vector[i] <> 0 or Q_vector[i] <> 0 then
      nonzero_idx := i;
      break;
    end if;
  end for;
  if nonzero_idx == 11 then
    P_z := P_vector[11];
  elseif nonzero_idx == 0 then
    P_z := 0;
  else
    for i in nonzero_idx + 1:11 loop
      if P_vector[i] == 0 and Q_vector[i] == 0 then
        P_z := P_vector[i - 1];
        break;
      end if;
    end for;
  end if;
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
end Pz_calc;
