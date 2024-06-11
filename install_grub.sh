#!/bin/bash

DIR="$(dirname "$0")"

EFI_PATH="/efi"
BOOTLOADER_ID="gentoo"
BOOTLOADER_PATH="${EFI_PATH}/EFI/${BOOTLOADER_ID}"
GRUB_EFI_PATH="${BOOTLOADER_PATH}/grubx64.efi"
GRUB_CFG_PATH="${BOOTLOADER_PATH}/grub.cfg"
SBAT_PATH="${DIR}/sbat.csv"

LOCALES="zh_CN"
FONTS="unicode"
GRUB_MODULES="part_gpt part_msdos"

set -x

sudo grub-mkstandalone \
    -O x86_64-efi \
    --modules="$GRUB_MODULES" \
    --locales="$LOCALES" \
    --fonts="$FONTS" \
    --sbat="$SBAT_PATH" \
    -o "$GRUB_EFI_PATH" \
    "boot/grub/grub.cfg=${DIR}/grub.cfg"

sudo sbsign \
    --key "${DIR}/MOK.key" \
    --cert "${DIR}/MOK.crt" \
    --output "$GRUB_EFI_PATH" \
    "$GRUB_EFI_PATH"

sudo grub-mkconfig -o "${GRUB_CFG_PATH}"
