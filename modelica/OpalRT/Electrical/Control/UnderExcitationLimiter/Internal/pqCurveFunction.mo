within OpalRT.Electrical.Control.UnderExcitationLimiter.Internal;
function pqCurveFunction "Piece-wise linear PQ curve"
  input Real u;
  input Real[11] P_vector;
  input Real[11] Q_vector;
  input Real M2 " 0: MVAR curve interpreted as mirror image around MVAR axis; 1: MVAR is found by linear extrapolation";
  input Real P_z;
  output Real Q;
protected
  Real P;
algorithm
  P := if M2 == 0 then abs(u) else u;
  if P >= P_z then
    Q := 0;
  else
    if P < P_vector[2] then
      Q := (Q_vector[2] - Q_vector[1]) / (P_vector[2] - P_vector[1]) * (P - P_vector[1]) + Q_vector[1];
    elseif P_vector[2] <= P and P < P_vector[3] then
      Q := (Q_vector[3] - Q_vector[2]) / (P_vector[3] - P_vector[2]) * (P - P_vector[2]) + Q_vector[2];
    elseif P_vector[3] <= P and P < P_vector[4] then
      Q := (Q_vector[4] - Q_vector[3]) / (P_vector[4] - P_vector[3]) * (P - P_vector[3]) + Q_vector[3];
    elseif P_vector[4] <= P and P < P_vector[5] then
      Q := (Q_vector[5] - Q_vector[4]) / (P_vector[5] - P_vector[4]) * (P - P_vector[4]) + Q_vector[4];
    elseif P_vector[5] <= P and P < P_vector[6] then
      Q := (Q_vector[6] - Q_vector[5]) / (P_vector[6] - P_vector[5]) * (P - P_vector[5]) + Q_vector[5];
    elseif P_vector[6] <= P and P < P_vector[7] then
      Q := (Q_vector[7] - Q_vector[6]) / (P_vector[7] - P_vector[6]) * (P - P_vector[6]) + Q_vector[6];
    elseif P_vector[7] <= P and P < P_vector[8] then
      Q := (Q_vector[8] - Q_vector[7]) / (P_vector[8] - P_vector[7]) * (P - P_vector[7]) + Q_vector[7];
    elseif P_vector[8] <= P and P < P_vector[9] then
      Q := (Q_vector[9] - Q_vector[8]) / (P_vector[9] - P_vector[8]) * (P - P_vector[8]) + Q_vector[8];
    elseif P_vector[9] <= P and P < P_vector[10] then
      Q := (Q_vector[10] - Q_vector[9]) / (P_vector[10] - P_vector[9]) * (P - P_vector[9]) + Q_vector[9];
    elseif P_vector[10] <= P and P < P_vector[11] then
      Q := (Q_vector[11] - Q_vector[10]) / (P_vector[11] - P_vector[10]) * (P - P_vector[10]) + Q_vector[10];
    end if;
  end if;
end pqCurveFunction;
