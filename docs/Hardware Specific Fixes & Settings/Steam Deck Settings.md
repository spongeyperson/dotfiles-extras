# <p align=center>(WIP) Valve Steam Deck - Game Settings
###### <p align=center> 

<!--
## <img src="https://user-images.githubusercontent.com/28176188/192112809-e2564eee-f9a6-4504-8d13-a56d58b268f3.svg" width="20" height="20"> Neofetch:
<p align=center><img src="https://user-images.githubusercontent.com/28176188/192112487-b5c15ca1-9600-4fba-b113-fb439ba4de87.png"></p>
-->

## Deck Fullscreen UI


# Table of Contents:
  - **Games**:
    - [Commonly Used Steam Launch Arguments](#commonly-used-steam-launch-arguments)
    - [Red Dead Redemption 2](#red-dead-redemption-2)
    - [Grand Theft Auto - Vice City](#grand-theft-auto---vice-city)

## Commonly Used Steam Launch Arguments:
- ### Wine Specific
  - Enable Wine-Specific FSR (AMD Fidelity FX Super Resolution)
    - `WINE_FULLSCREEN_FSR=1`
- ### AMD Specific
  - Enable AMD ACO Recompiler:
    - `VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/radeon_icd.x86_64.json RADV_PERFTEST=aco`
- ### DXVK HUD
  - Show DXVK Shader Compilation using DXVK HUD
    - `DXVK_HUD=compile`
- ### [Valve GAMESCOPE (Formerly steamcompmgr)](https://github.com/Plagman/gamescope)
  ```bash
  # Upscale a 720p game to 1440p with integer scaling
  gamescope -h 720 -H 1440 -n -- %command%

  # Limit a vsynced game to 30 FPS
  gamescope -r 30 -- %command%

  # Run the game at 1080p, but scale output to a fullscreen 3440×1440 pillarboxed ultrawide window
  gamescope -w 1920 -h 1080 -W 3440 -H 1440 -b -- %command%
  ```
  ### Options:

  See `gamescope --help` for a full list of options.

  * `-W`, `-H`: set the resolution used by gamescope. Resizing the gamescope window will update these settings. Ignored in embedded mode. If `-H` is specified but `-W` isn't, a 16:9 aspect ratio is assumed. Defaults to 1280×720.
  * `-w`, `-h`: set the resolution used by the game. If `-h` is specified but `-w` isn't, a 16:9 aspect ratio is assumed. Defaults to the values specified in `-W` and `-H`.
  * `-r`: set a frame-rate limit for the game. Specified in frames per second. Defaults to unlimited.
  * `-o`: set a frame-rate limit for the game when unfocused. Specified in frames per second. Defaults to unlimited.
  * `-U`: use AMD FidelityFX™ Super Resolution 1.0 for upscaling 
  * `-n`: use integer scaling.
  * `-b`: create a border-less window.
  * `-f`: create a full-screen window.

<!--
## Red Dead Redemption 2:

- #### Wine / Proton Info:
  - Initial Test Version: `Proton-7.0rc3-GE-1`
  - Last Known Working: `GE-Proton7-10`

- **Steam Launch Arguments**:
  ```bash
  VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/radeon_icd.x86_64.json RADV_PERFTEST=aco gamemoderun mangohud %command% -vulkan -ignorepipelinecache
  ```
- **Notes**: 
    - This game uses standard RADV ICD + ACO Recompiler, Gamemode Run, and Mangohud
    - `-ignorepipelinecache`: Use this flag for performance reasons.
    - `-vulkan`: is required to get the game to display 
    - **Notice**: **Proton-7.0rc2-GE-1** has issues starting RGSC Launcher and will cause the game to never launch. Use **Standard Valve Proton** or **Proton-7.0rc3-GE-1** or newer. 
-->

## Grand Theft Auto - Vice City:

- #### Wine / Proton Info:
  - Initial Test Version: `GE-Proton7-35`
  - Last Known Working: `GE-Proton7-35`

- **Steam Launch Arguments**:
  ```bash
    WINEDLLOVERRIDES="d3d8=n,b" %command%
  ```

- **Required Patches:
  - This game requires GTA: Vice City Definitive Edition (not the Game, the Mod) Patches in order to launch.