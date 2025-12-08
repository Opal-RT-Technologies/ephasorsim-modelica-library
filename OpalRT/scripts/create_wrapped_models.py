import os

# Define the base directories
library_dir = "c:/git/EPFMU/OpalRT"
base_source_dir = os.path.join(library_dir, "GenUnits")
target_dir = os.path.join(library_dir, "ePHASORSIM/WrappedModels")
package_order_path = os.path.join(target_dir, "package.order")
model_name_suffix = ""

# Generating unit types A through L
gen_unit_types = [chr(c) for c in range(ord("A"), ord("L") + 1)]

# Special template overrides
template_overrides = {
    ("C", "GENROU_TGOV3"): "FMUTemplateC2",
    ("F", "GENROU_EXAC1_IEEEST_TGOV3"): "FMUTemplateF2",
}

os.makedirs(target_dir, exist_ok=True)
order_entries = []

for gen_type in gen_unit_types:
    source_dir = os.path.join(base_source_dir, f"Type{gen_type}")

    if not os.path.isdir(source_dir):
        continue

    # Skip 'GenUnitType*' and 'package.mo'
    models = [
        f[:-3]
        for f in os.listdir(source_dir)
        if f.endswith(".mo") and not f.startswith("GenUnitType") and f != "package.mo"
    ]

    for model in models:
        # Determine template name
        template_name = template_overrides.get(
            (gen_type, model), f"FMUTemplate{gen_type}"
        )

        wrapper_code = f"""within OpalRT.ePHASORSIM.WrappedModels;
block {model}{model_name_suffix}
  extends Wrappers.{template_name}(
    redeclare GenUnits.Type{gen_type}.{model} genUnit);
end {model}{model_name_suffix};
"""
        wrapper_path = os.path.join(target_dir, f"{model}{model_name_suffix}.mo")
        with open(wrapper_path, "w") as f:
            f.write(wrapper_code)
        order_entries.append(f"{model}{model_name_suffix}")

# Update package.order, skipping any 'package' entry
existing = []
if os.path.exists(package_order_path):
    with open(package_order_path, "r") as f:
        existing = [
            line.strip() for line in f if line.strip() and line.strip() != "package"
        ]

# Merge and deduplicate
for entry in order_entries:
    if entry not in existing:
        existing.append(entry)

with open(package_order_path, "w") as f:
    for entry in existing:
        f.write(entry + "\n")
