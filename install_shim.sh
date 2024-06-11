#!/bin/bash

DIR="$(dirname "$0")"

EFI_PATH="/efi"
BOOTLOADER_ID="gentoo"
BOOTLOADER_PATH="${EFI_PATH}/EFI/${BOOTLOADER_ID}"
SHIM_PATH="/usr/share/shim"

cp -v "${SHIM_PATH}"/BOOTX64.EFI "${BOOTLOADER_PATH}"/shimx64.efi
cp -v "${SHIM_PATH}"/mmx64.efi "${BOOTLOADER_PATH}"/mmx64.efi
cp -v "${DIR}"/MOK.cer "${BOOTLOADER_PATH}"/MOK.cer
