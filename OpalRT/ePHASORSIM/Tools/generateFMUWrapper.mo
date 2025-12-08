within OpalRT.ePHASORSIM.Tools;
function generateFMUWrapper
  import Modelica.Utilities.Strings;
  import Modelica.Utilities.Streams;
  import Modelica.Utilities.Files;

  // Inputs
  input String genType "Single letter (A..L) for GenUnit type";
  input String modelName "Concrete GenUnit class short name (e.g., GENROU_EXPIC1_UEL2)";
  input String targetPkg = "OpalRT.ePHASORSIM.WrappedModels" "Used in 'within ...;'";
  input Boolean writeToFile = true "Write .mo to 'targetDir' and update package.order";
  input String targetDir = "" "Absolute folder for .mo and package.order (required if writeToFile=true)";
  input Boolean overwrite = true "Overwrite existing .mo file if present";
  input Boolean useRelativeNames = true
    "Emit Wrappers.FMUTemplate<type> and GenUnits.Type<type>.<modelName>";
  input Boolean sortAlphabetically = true "Sort entries in package.order after update";

  // Outputs
  output String wrapperQualifiedName "targetPkg + '.' + wrapperName";
  output String wrapperFilePath "Full path to written .mo (empty if writeToFile=false)";
  output String wrapperCode "The generated Modelica code";

  // Code fragments
  // Wrapper code fragments
protected
  String wrapperName;
  String tmplQName;
  String genUnitQName;
  String codeHeader;
  String codeBody;

  // Paths
  String moPath;
  String pkgOrderPath;

  // package.order data
  String lines[:]     "Raw lines read from package.order";
  String cleaned[:]   "Trimmed CR, non-empty lines";
  String uniques[:]   "De-duplicated lines";
  String joined       "Final file content";
  String line;

  // Helpers
  Boolean listed;
  Boolean seen;
  Integer i, j, k, n;

algorithm
  // Validation
  assert(Strings.length(genType) == 1, "genType must be a single letter in A..L.");
  if writeToFile then
    assert(Strings.length(targetDir) > 0, "When writeToFile=true you must provide an absolute targetDir.");
  end if;

  // Names & code
  wrapperName := modelName;
  if useRelativeNames then
    tmplQName    := "Wrappers.FMUTemplate" + genType;
    genUnitQName := "GenUnits.Type" + genType + "." + modelName;
  else
    tmplQName    := "OpalRT.Wrappers.FMUTemplate" + genType;
    genUnitQName := "OpalRT.GenUnits.Type" + genType + "." + modelName;
  end if;

  codeHeader := "within " + targetPkg + ";\n";
  codeBody :=
    "block " + wrapperName + "\n" +
    "  extends " + tmplQName + "(\n" +
    "    redeclare " + genUnitQName + " genUnit);\n" +
    "end " + wrapperName + ";\n";
  wrapperCode := codeHeader + codeBody;
  wrapperQualifiedName := targetPkg + "." + wrapperName;
  wrapperFilePath := "";

  if writeToFile then
    // Ensure folder exists and resolve canonical paths
    Files.createDirectory(Files.fullPathName(targetDir));
    moPath       := Files.fullPathName(targetDir) + "/" + wrapperName + ".mo";
    pkgOrderPath := Files.fullPathName(targetDir) + "/package.order";

    // Write/overwrite .mo
    if (Files.exist(moPath) and not overwrite) then
      assert(false, "Wrapper file already exists and overwrite=false: " + moPath);
    end if;
    Streams.print(wrapperCode, moPath);
    wrapperFilePath := moPath;

    // ---- package.order maintenance (vector-of-lines) ----------------
    if Files.exist(pkgOrderPath) then
      lines := Streams.readFile(pkgOrderPath); // your env: returns vector
    else
      lines := fill("", 0);
    end if;

    // Trim whitespace, drop empties (use fully-qualified strip)
    cleaned := fill("", 0);
    for i in 1:size(lines,1) loop
      line := lines[i];
      n := Strings.length(line);
      if (n >= 1) and (Strings.substring(line, n, n) == "\r") then
        line := Strings.substring(line, 1, n - 1); // remove trailing CR only
        n := n - 1;
      end if;
      if n > 0 then
        cleaned := cat(1, cleaned, {line});
      end if;
    end for;

    // Exact-line membership
    listed := false;
    for i in 1:size(cleaned,1) loop
      if cleaned[i] == wrapperName then
        listed := true;
        break;
      end if;
    end for;

    // Append if missing
    if not listed then
      cleaned := cat(1, cleaned, {wrapperName});
    end if;

    // ---- De-duplicate while preserving order -----------------------
    uniques := fill("", 0);
    for i in 1:size(cleaned,1) loop
      // check if cleaned[i] is already in uniques
      seen := false;
      for k in 1:size(uniques,1) loop
        if uniques[k] == cleaned[i] then
          seen := true; break;
        end if;
      end for;
      if not seen then
        uniques := cat(1, uniques, {cleaned[i]});
      end if;
    end for;

    // ---- Overwrite package.order (not append) -----------------------
    joined := "";
    for i in 1:size(uniques,1) loop
      joined := joined + uniques[i] + "\n";
    end for;

    // Portable overwrite: remove then print
    if Files.exist(pkgOrderPath) then
      Files.removeFile(pkgOrderPath);
    end if;
    Streams.print(joined, pkgOrderPath);
    // If your MSL supports it, you may use instead:
    // Streams.writeFile(pkgOrderPath, joined);

  end if;
end generateFMUWrapper;
