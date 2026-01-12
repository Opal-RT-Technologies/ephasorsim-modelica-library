within OpalRT.Electrical.Branch.HVDC.HVDC_LCC.Auxiliary;
function initialize
  input Real RDC "The DC line resistance in ohms";
  input Real DELTI "Margin entred in per unit of desired power or current";
  input Real NBR "Number of bridges in series";
  input Real RCR "Commutating transformer resistance per bridge in ohms";
  input Real XCR "Commutating transformer reactance per bridge in ohms";
  input Real EBASR "Primary base ac voltage in kV";
  input Real TRR "Transformer ratio";
  input Real TAPR "Tap setting";
  input Real NBI "Number of bridges in series";
  input Real RCI "Commutating transformer resistance per bridge in ohms";
  input Real XCI "Commutating transformer reactance per bridge in ohms";
  input Real EBASI "Primary base ac voltage in kV";
  input Real TRI "Transformer ratio";
  input Real TAPI "Tap setting";
  input Real ALFDY "Minimum alpha for dynamics (degrees)";
  input Real GAMDY "Minimum gamma for dynamics (degrees)";
  input Real GAMMX "Nominal maximum firing angle in degrees";
  input Real GAMMN "Nominal minimum firing angle in degrees";
  input Real Vmag_rec "rectifier side voltage magnitude";
  input Real Vmag_inv "inverter side voltage magnitude";
  input Real SETVL;
  input Real MDC;
  input Real RCOMP;
  input Real VSCHED;
  input Real C0;
  output Real vdci_init;
  output Real vdcr_init;
  output Real idc_init;
protected
  constant Real pi = Modelica.Constants.pi;
  Real gamma_init;
  Real alpha_init;
  Real EacI_init;
  Real EacR_init;
  Real Alphamin;
  Real v_c;
  Real Ipset_init;
  Real Vpset_init;
  Real residual;
  Boolean converged;
  Integer i;
  Real Maxiter;
  Real Tol;
algorithm
  Alphamin := ALFDY * pi / 180;
  EacI_init := Vmag_inv * EBASI * 1e3 * TRI / TAPI;
  EacR_init := Vmag_rec * EBASR * 1e3 * TRR / TAPR;
  if abs(GAMMX - GAMMN) < Modelica.Constants.eps then
    gamma_init := GAMMX / 180 * pi;
    if abs(MDC - 2) <= Modelica.Constants.eps then
      idc_init := SETVL;
    end if;
    vdci_init := NBI * (3 * sqrt(2) * EacI_init * cos(gamma_init) / pi - 3 * XCI * idc_init / pi + 2 * RCI * idc_init);
    vdcr_init := vdci_init + idc_init * RDC;
  else
    if abs(MDC - 2) <= Modelica.Constants.eps then
      idc_init := SETVL;
      vdci_init := VSCHED * 1e3 - idc_init * RCOMP;
      vdcr_init := vdci_init + idc_init * RDC;
      alpha_init := acos((vdcr_init / NBR + 3 * XCR * idc_init / pi + 2 * RCR * idc_init) / (3 * sqrt(2) * EacR_init / pi));
      if alpha_init <= Alphamin then
        idc_init := (1 - DELTI) * idc_init;
        alpha_init := Alphamin;
        if idc_init <= C0 then
          idc_init := C0;
        end if;
        vdcr_init := NBR * (3 * sqrt(2) * EacR_init / pi * cos(alpha_init) - 3 * XCI * idc_init / pi - 2 * RCR * idc_init);
        vdci_init := vdcr_init - idc_init * RDC;
      end if;
    else
      if abs(RCOMP - RDC) <= Modelica.Constants.eps or abs(RCOMP) <= Modelica.Constants.eps then
        idc_init := abs(SETVL) * 1e3 / VSCHED;
      else
        if SETVL > 0 then
          idc_init := ((-VSCHED * 1e3) + sqrt((VSCHED * 1e3) ^ 2 + 4 * SETVL * 1e6 * (RDC - RCOMP))) / 2 / (RDC - RCOMP);
        else
          idc_init := (VSCHED * 1e3 - sqrt((VSCHED * 1e3) ^ 2 + 4 * SETVL * 1e6 * RCOMP)) / 2 / RCOMP;
        end if;
      end if;
      vdci_init := VSCHED * 1e3 - idc_init * RCOMP;
      converged := false;
      i := 1;
      Maxiter := 10;
      Tol := 1e-3;
      while not converged and i < Maxiter + 1 loop
        if SETVL < 0 then
          v_c := vdci_init;
        else
          v_c := vdci_init + RDC * idc_init;
        end if;
        Ipset_init := abs(SETVL) * 1e6 / v_c;
        Vpset_init := VSCHED * 1e3 - Ipset_init * RCOMP;
        idc_init := Ipset_init;
        vdci_init := Vpset_init;
        vdcr_init := vdci_init + idc_init * RDC;
        alpha_init := acos((vdcr_init / NBR + 3 * XCR * idc_init / pi + 2 * RCR * idc_init) / (3 * sqrt(2) * EacR_init / pi));
        if alpha_init <= Alphamin then
          idc_init := (1 - DELTI) * idc_init;
          alpha_init := Alphamin;
          if idc_init <= C0 then
            idc_init := C0;
          end if;
          vdcr_init := NBR * (3 * sqrt(2) * EacR_init / pi * cos(alpha_init) - 3 * XCI * idc_init / pi - 2 * RCR * idc_init);
          vdci_init := vdcr_init - idc_init * RDC;
        end if;
        if SETVL > 0 then
          residual := abs(vdcr_init * idc_init - SETVL);
        else
          residual := abs(vdci_init * idc_init + SETVL);
        end if;
        if residual < Tol then
          converged := true;
        end if;
        i := i + 1;
      end while;
    end if;
  end if;
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
end initialize;
