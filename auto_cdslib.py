#!/usr/bin/env python3
from pathlib import Path

FIXED_LINES = [
    'SOFTINCLUDE /tools/cadence/IC618/tools.lnx86/dfII/etc/cdsDotLibs/artist/cds.lib',
    'DEFINE basic /tools/cadence/IC618/tools.lnx86/dfII/etc/cdslib/basic',
    'DEFINE gpdk180 /tools/cadence/FOUNDRY/analog/180nm/libs.oa22/gpdk180',
]

def build_cdslib():
    base_dir = Path.cwd()
    lines = [l + "\n" for l in FIXED_LINES]
    seen = {l.split()[1] for l in FIXED_LINES if l.startswith("DEFINE")}
    count = 0
    for tag_file in sorted(base_dir.rglob("cdsinfo.tag")):
        lib_path = tag_file.parent
        name = lib_path.name
        if name in seen:
            print("Skipping duplicate library name:", name, "at", lib_path)
            continue
        seen.add(name)
        lines.append(f'DEFINE {name} "./{lib_path.relative_to(base_dir)}"\n')
        count += 1
    (base_dir / "cds.lib").write_text("".join(lines), encoding="utf-8")
    print(f"Generated cds.lib with {count} local libraries.")

if __name__ == "__main__":
    build_cdslib()

