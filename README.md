# sth404_OS

> An independent Linux-based operating system built the hard way.  
> Not a remix. Not a theme. Not a weekend project.

---

## What is this?

**sth404_OS** is a custom Linux-based OS built from scratch with intent, mistakes, rebuilds, and persistence.

This project exists because:
- “Just install Ubuntu” was **not** the goal
- Understanding *how* an OS boots matters more than how it looks
- Breaking things is the fastest way to actually learn

This is not a distro-hop.
This is a **from-the-ground-up OS journey**.

---

## What’s actually done (so far)

### Kernel
- Custom-built Linux kernel
- Fully branded (`sth404_OS`)
- Menuconfig-tuned, rebuilt, broken, fixed again
- Initramfs-aware
- Tested under QEMU and real hardware

### Root filesystem
- BusyBox-based rootfs
- Single source-of-truth rootfs used for:
  - live environment
  - installed system
- Custom `init`
- Manual mounts
- Clean teardown and handoff to real root

### Boot & ISO
- Bootable **live ISO**
- ISOLINUX legacy boot
- Initramfs packed by hand
- QEMU boot-tested repeatedly
- Real hardware tested (yes, the scary part)

### Installer
- Custom installer script
- Extracts compressed rootfs to disk
- No distro installer magic
- You see *every* step happen

---

## Things learned the painful way

- `init` is not optional
- `/dev` lies if you don’t mount it correctly
- `set -e` can save you or ruin your day
- `pivot_root` and `switch_root` are not the same thing
- If `/bin/sh` doesn’t exist, nothing exists
- Kernel boots ≠ OS boots
- One wrong symlink = unbootable system
- BusyBox is small but **not simple**
- “Works in QEMU” means **nothing** until real hardware agrees

---

## What this is NOT

- ❌ Not a fork of Ubuntu/Mint with wallpapers
- ❌ Not an Arch install guide
- ❌ Not a “Linux from Scratch” copy-paste
- ❌ Not polished (yet)

---

## Why this exists

Because understanding:
- bootloaders
- kernels
- initramfs
- rootfs
- userspace

is more valuable than memorizing commands.

This OS exists to answer:
> “What *actually* happens when I press the power button?”

---

## Current status

- Boots
- Live environment works
- Installer works
- CLI-only (for now)
- GUI planned (Wayland/X11 later)

This repo will evolve.
Expect rewrites.
Expect breakage.
Expect commits that say “fix boot (again)”.

---

## Future plans

- Proper userspace
- Package management decisions
- GUI stack
- Hardware detection improvements
- Performance tuning
- Fewer mistakes (maybe)

---

## Warning

If you’re here looking for:
- a daily driver
- a stable distro
- something polished

This is not it.

If you’re here to learn how operating systems *actually work* — welcome.

---

## Author

Built by **Riddhimaan Singh**  
Fueled by curiosity, frustration, and way too many reboots.
