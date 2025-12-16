within OpalRT.NonElectrical.Math.Auxiliary;
function findFirstNonZeroValue
  input Real a[:];
  input Integer na;
  input Boolean show_err;
  output Integer i;
algorithm
  i := 1;
  while a[i] == 0 and i < na loop
    i := i + 1;
  end while;
  if show_err == true then
    assert(i <> na or a[i] <> 0.0, "Denuminator can not be a zero array.", level = AssertionLevel.error);
  end if;
  annotation(Documentation(info = "<html>
<p>This function returns the index of the first non-zero element of the input vector.</p>
</html>"));
end findFirstNonZeroValue;
