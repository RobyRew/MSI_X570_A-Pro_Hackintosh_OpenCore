# OPENCORE Config.plist

## ACPI
### Add
1. `SSDT-EC-USBX.aml` (Fix the embedded controller and USB power)
2. `SSDT-PLUG.aml` (Allows for native CPU power management)
3. `SSDT-PNLF-CFL.aml` (Backlight support for Coffee Lake machines)
4. `SSDT-PMC` (Enable Native NVRAM for HM370 MotherBoard)
5. `SSDT-XOSI.aml` (This is for Trackpad ELAN HID)
5. `SSDT-dGPU-Off.aml` (PowerOff GTX 1050Ti)

### Delete
Not needed

### Patch
1. `Rename _OSI to XOSI`

### Quirks
**Enabled:**
1. `ResetLogoStatus` (Recomended)

## Booter
### Quirks
**Enabled:**
1. `AvoidRuntimeDefrag`
2. `EnableSafeModeSlide`
3. `ProvideCustomSlide`
4. `RebuildAppleMemoryMap`
5. `SetupVirtualMap`
6. `SyncRuntimePermissions`


## DeviceProperties
### Add
| PciRoot(0x0)/Pci(0x2,0x0) | Dictionary | Keys / Values |
|:--- |:---:|:--- |
| AAPL,ig-platform-id  | DATA | 00009B3E |
| device-id | DATA | 9B3E0000 |
| AAPL,slot-name | String | Internal@0,2,0 |
| enable-hdmi20 | DATA | 01000000 |
| framebuffer-unifiedmem | DATA | 000080BE |
| framebuffer-con1-busid | DATA | 01000000 |
| framebuffer-con1-enable | DATA | 01000000 |
| framebuffer-con1-flags | DATA | 87010000 |
| framebuffer-con1-has-lspcon | DATA | 01000000 |
| framebuffer-con1-index | DATA | 01000000 |
| framebuffer-con1-pipe | DATA | 12000000 |
| framebuffer-con1-preferred-lspcon-mode | DATA | 01000000 |
| framebuffer-con1-type | DATA | 00080000 |
| framebuffer-patch-enable | DATA | 01000000 |
| model | String | Intel UHD 630 |

| PciRoot(0x0)/Pci(0x1f,0x3) | Dictionary | Keys / Values |
|:--- |:---:|:--- |
| layout-id  | DATA | 01000000 |

**What does each thing:**
- `AAPL,ig-platform-id` (iGPU Real id)
- `device-id` (Fake id)
- `AAPL,slot-name` (Internal iGPU Indentifier)
- `enable-hdmi20` (Enable 4K monitors and HDR content)
- `framebuffer-unifiedmem` (Increase VRAM from 1536 MB to 3048 MB)
- `framebuffer-patch-enable` (Enable framebuffer patches)
- `model` (Name Showed in *About This Mac*)
- `layout-id` (Sets the audio port to 3)

### Delete
Not needed

## Kernel
### Add
**ORDER MATTER!** Think about which kexts should load before which.
1. [Lilu](https://github.com/acidanthera/lilu/releases) (First)
2. [VirtualSMC](https://github.com/acidanthera/VirtualSMC/releases) (Second)
   - SMCProcessor
   - SMCSuperIO
   - SMCBatteryManager
3. [WhateverGreen](https://github.com/acidanthera/WhateverGreen/releases) (Graphics)
4. [VoodooPS2Controller](https://github.com/acidanthera/VoodooPS2/releases) (PS/2 keyboard)
5. [RealtekRTL8111](https://github.com/Mieze/RTL8111_driver_for_OS_X/releases) (LAN internet)
6. [AppleALC](https://github.com/acidanthera/AppleALC/releases) (Audio)
7. [VoodooI2C](https://github.com/VoodooI2C/VoodooI2C/releases) (Trackpad Support)
   - VoodooI2CHID

### Block
Ignore

### Emulate
Ignore

### Force
We need to force `IO80211Family.kext` from `System/Library/Extensions` to have complete support of Airportitlwm.kext for WiFi.

### Patch
Ignore

### Quirks
**Enabled:**
1. `AppleXcpmCfgLock` (We don't have options to unlock de CFG-Lock on the BIOS)
2. `DisableIoMapper` (If you have VT-d enabled on the BIOS (Prefered))
3. `DisableLinkeditJettison`
4. `PanicNoKextDump`
5. `PowerTimeoutKernelPanic`
6. `XhciPortLimit` (Needed for USBs type XHCI)

### Scheme
Ignore, leave that by default.

## Misc
### Boot
Leave Default

### Debug
Leave Default if you dont want debug information.

### Entries
Ignore

### Security
**Enabled:**
1. `AllowNvramReset` (For RESET the NVRAM on picker selector)
2. `AllowSetDefault` (Default disk for multiboot)
3. `BlacklistAppleUpdate` (Stop reciving updates for Macs BIOS)
- `ScanPolicy` 0
- `SecureBootModel` Default
- `Vault` Optional

### Tools
Remove from `EFI/OC/Tools` everything


## NVRAM
### Add
| 7C436110-AB2A-4BBB-A880-FE41995C9F82 | Dictionary | Keys / Values |
|:--- |:---:|:--- |
| boot-args  | String | -v keepsyms=1 debug=0x100 alcid=3 -wegnoegpu  -igfxnohdmi -igfxblr agdpmod=vit9696 |
| run-efi-updater | String | No |
| csr-active-config | DATA | 00000000 |
| prev-lang:kbd | String | en-US:0 |   

**What does each thing:**
- `boot-args` (Boot Arguments)
   - `-v keepsyms=1 debug=0x100` (Debuging)
   - `alcid=3` (Sets de audio to port 3)
   - `-wegnoegpu` (Disable dGPU GTX 1050 Ti)
   - `-igfxnohdmi` ()
   - `-igfxblr` (Fix Backlight issue on Coffe Lake laptops)
   - `agdpmod=vit9696` (Disable board-id checker **ESSENTIAL FOR HDMI OUTPUT**)
- `run-efi-updater` (Disable macOS updates to EFI)
- `csr-active-config` (SIP configuration (Enabled), For more: [Disabling SIP](https://dortania.github.io/OpenCore-Install-Guide/troubleshooting/extended/post-issues.html#disabling-sip))
- `prev-lang:kbd` (Sets custom language, For more: [AppleKeyboardLayouts.txt(opens new window)](https://github.com/acidanthera/OpenCorePkg/blob/master/Utilities/AppleKeyboardLayouts/AppleKeyboardLayouts.txt)

### Delete
Ignore

### LegacySchema
Ignore, we have native NVRAM

### WriteFlash `Enable`


## PlatformInfo
### Automatic `enabled`

### Generic
Download [GenSMBIOS (opens new window)](https://github.com/corpnewt/GenSMBIOS), and open the *GenSMBIOS.command* with *Right-Click > Open*, follow the intructions on the Terminal Window.

| Generic | Dictionary | Keys / Values |
|:--- |:---:|:--- |
| AdviseWindows  | Boolean | False |
| SystemMemoryStatus | String | Auto |
| MLB | String | *Generate your own with [GenSMBIOS](https://github.com/corpnewt/GenSMBIOS)* |
| ProcessorType | Number | 0 |
| ROM | DATA | *[Your own MAC Address](https://dortania.github.io/OpenCore-Post-Install/universal/iservices.html#derive-the-corresponding-rom-value)* |
| SpoofVendor | Boolean | True |
| SystemProductName | String | MacBookPro15,3 |
| SystemSerialNumber | String | *Generate your own with [GenSMBIOS](https://github.com/corpnewt/GenSMBIOS)* |
| SystemUUID | String | *Generate your own with [GenSMBIOS](https://github.com/corpnewt/GenSMBIOS)* |

**These values are masked from the provided config file, make sure you enter your own before testing!**

**UpdateDataHub `Boolean` `Enable`**

**UpdateNVRAM `Boolean` `Enable`**

**UpdateSMBIOS `Boolean` `Enable`**

**UpdateSMBIOSMode `String` `Create`**

**UseRawUuidEncoding** `Boolean` `False`**

## UEFI
### ConnectDrivers `Boolean` `enabled`

### APFS
Leave everything default

### Audio
For now leave everything default

### Drivers (must-have)
1. `OpenRuntime.efi`
2. `HFsPlus.efi`
3. `OpenCanopy.efi`

### Input
Ignore

### Output
Ignore

### ProtocolsOverride
Ignore

### Quirks
**Enabled:**
1. `DeduplicateBootOrder`
2. `ReleaseUsbOwnership` (Mainly for USB fixes)
3. `RequestBootVarRouting` (Redirects some Variables for macOS)
