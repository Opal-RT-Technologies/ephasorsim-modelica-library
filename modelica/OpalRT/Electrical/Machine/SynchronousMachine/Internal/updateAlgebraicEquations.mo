within OpalRT.Electrical.Machine.SynchronousMachine.Internal;
function updateAlgebraicEquations
  //inputs
  input Real sq1;
  input Real sq2;
  input Real sd1;
  input Real sfd;
  input Real delta;
  input Real vr;
  input Real vi;
  //parameters
  input Real Laq_sec;
  input Real Lad_sec;
  input Real Lq1;
  input Real Lq2;
  input Real Lfd;
  input Real Ld1;
  input Real u1;
  input Real u2;
  input Real u3;
  //output
  output Real ir;
  output Real ii;
  output Real Te;
  output Real ifd;
  output Real id1;
  output Real iq1;
  output Real iq2;
  //local
protected
  Real Ed_sec;
  Real Eq_sec;
  Real u5;
  Real u6;
  Real det;
  Real i_d;
  Real i_q;
  Real saai_ad;
  Real saai_aq;
algorithm
  Ed_sec := Laq_sec * (sq1 / Lq1 + sq2 / Lq2);
  Eq_sec := Lad_sec * (sfd / Lfd + sd1 / Ld1);
  u5 := (-cos(delta) * Ed_sec) - sin(delta) * Eq_sec "convert internal voltage in rotor ref to network ref";
  u6 := cos(delta) * Eq_sec - sin(delta) * Ed_sec "convert internal voltage in rotor ref to network ref";
  det := u2 * u3 - u1 ^ 2;
  ir := 1 / det * (u3 * ((-u5) - vi) - u1 * ((-u6) + vr));
  ii := 1 / det * (u1 * ((-u5) - vi) - u2 * ((-u6) + vr));
  i_d := sin(delta) * ir - cos(delta) * ii;
  i_q := cos(delta) * ir + sin(delta) * ii;
  saai_ad := Lad_sec * ((-i_d) + sfd / Lfd + sd1 / Ld1);
  saai_aq := Laq_sec * ((-i_q) + sq1 / Lq1 + sq2 / Lq2);
  ifd := (sfd - saai_ad) / Lfd;
  id1 := (sd1 - saai_ad) / Ld1;
  iq1 := (sq1 - saai_aq) / Lq1;
  iq2 := (sq2 - saai_aq) / Lq2;
  Te := -(saai_ad * i_q - saai_aq * i_d);
end updateAlgebraicEquations;
