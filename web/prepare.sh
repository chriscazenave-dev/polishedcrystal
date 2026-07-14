#!/usr/bin/env bash

set -euo pipefail

web_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
repo_root="$(cd -- "${web_dir}/.." && pwd)"
rom_name="polishedcrystal-3.2.3.gbc"
source_rom="${repo_root}/${rom_name}"
destination_rom="${web_dir}/roms/${rom_name}"

if [[ ! -f "${source_rom}" ]]; then
  echo "ROM not found at ${source_rom}; building it first..."
  make -C "${repo_root}"
fi

if [[ ! -f "${source_rom}" ]]; then
  echo "Build completed without producing ${source_rom}" >&2
  exit 1
fi

mkdir -p "${web_dir}/roms"
cp "${source_rom}" "${destination_rom}"
printf 'Prepared %s (%s bytes)\n' "${destination_rom}" "$(stat -c '%s' "${destination_rom}")"
