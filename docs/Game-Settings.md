<div id="user-content-toc">
  <ul>
    <summary align="center"><h1 style="display: inline-block; text-decoration: none;">Spongey's Personal Settings for Steam:</h1></summary>
  </ul>
</div>

###### <p align=center> A compiled list of games that run under Linux with no issues, but may need minor tweaks. </p>

# Table of Contents:
  - [Commonly Used Steam Launch Arguments](#commonly-used-steam-launch-arguments)
    - [My Launch Arguments](#my-launch-arguments)
    - [Wine Tweaks](#wine-tweaks)
    - [AMD Tweaks](#amd-tweaks)
    - [Nvidia Tweaks](#nvidia-tweaks)
  - [Valve Gamescope (steamcompmgr)](#valve-gamescope-formerly-steamcompmgr)
  - **Games**:
    - [Red Dead Redemption 2](#red-dead-redemption-2)
    - [Grand Theft Auto IV: The Complete Edition](#grand-theft-auto-iv-the-complete-edition)
    - [Farming Simulator 22](#farming-simulator-22)
    - [Spyro Reignited Trilogy](#spyro-reignited-trilogy)
    - [Ghostrunner](#ghostrunner)
    - [Satisfactory](#satisfactory)
    - [Sleeping Dogs: Definitive Edition](#sleeping-dogs-definitive-edition)
      - [Virtual Desktop & Multi-Monitor Fix](#how-to-fix-virtual-desktop--multi-mon-issues)
    - [Final Fantasy XV](#final-fantasy-xv-"windows"-edition)
    - [Bioshock Remastered](#bioshock-remastered)
    - [Ghost of a Tale](#ghost-of-a-tale)
    - [Deep Rock Galactic](#deep-rock-galactic)
    - [Tunic](#tunic)
    - [Assassins Creed Origins](#assassins-creed-origins)
    - [Sea of Thieves](#sea-of-thieves)
    - [Cult of the Lamb](#cult-of-the-lamb)
    - [Dinkum](#dinkum)

## Commonly Used Steam Launch Arguments:

- ### My Launch Arguments:
  - #### Main PC:
      ```
      RADV_PERFTEST=gpl,aco gamemoderun mangohud %command%
      ```
  - #### Steam Deck:
      ```
      RADV_PERFTEST=gpl,aco gamemoderun %command%
      ```

- ## <img src="https://user-images.githubusercontent.com/28176188/224575749-b843d685-2e1e-43bc-8267-ee337fde8206.svg" width="19" height="19"> Wine Tweaks
  - #### Enable Wine-Specific FSR (AMD Fidelity FX&trade; Super Resolution)
    > ❗ <b>Notice</b>: This <i>should</i> run under <u>any</u> GPU, including Nvidia GPUs as FSR is an open standard
    ```
    WINE_FULLSCREEN_FSR=1
    ```
  - ### Force Wine Rendering APIs:
    - #### DXVK (DirectX 9/10/11 &rarr; Vulkan)
      ```
      WINE_USE_DXVK=1
      ```
      - #### <u>Additional Options</u>:
        -  Show DXVK Shader Compilation using DXVK HUD
            ```
            DXVK_HUD=compile
            ```
    - #### VKD3D (DirectX 12 &rarr; Vulkan)
      ```
      WINE_USE_VKD3D=1
      ```
    - #### D9VK (DirectX 9 &rarr; Vulkan)
      > <p align=center style="margin-bottom: 0;"><b><u> :exclamation: Deprecated :exclamation: </u></b></p>
      > <p align=center><a href=https://github.com/doitsujin/dxvk/pull/1275>This seems to have been deprecated as this has been merged into DXVK</a></p>


      > This option is listed here for legacy reasons, so if you need to use an older implementation of DirectX 9 &rarr; Vulkan, it is here for future reference. Do not use this if using newer DXVK Versions than [v1.5](https://github.com/doitsujin/dxvk/releases/tag/v1.5)
      ```
      WINE_USE_D9VK=1
      ```

- ## <img src="https://user-images.githubusercontent.com/28176188/142365376-270d160f-33c3-4012-a3d9-541ab65bfdb6.png" width="17" height="17"> AMD Tweaks:

- ### Force a specific Vulkan Driver (ICD):
  This is usually helpful when you either have multiple GPUs, a game is expecting only a 32-Bit library to exist, and fails to initialize because it only sees the default 64-Bit library, or when you want to specify a specific driver for a specific game (e.g. A game performs better on a specific driver) 
  - #### Mesa RADV:
    - 32-Bit:
      ```
      VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/radeon_icd.i686.json
      ```
    - 64-Bit:
      ```
      VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/radeon_icd.x86_64.json
      ```
  - #### AMD AMDVLK:
    >❗ Usually Slower
    - 32-Bit:
      ```
      VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/amd_icd64.json
      ```
    - 64-Bit:
      ```
      VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/amd_icd64.json
      ```
- ### RADV Performance Test Features:
> 📝 <b><u>Note</u></b>: You can combine both of these into one command as follows:
  ```
  RADV_PERFTEST=gpl,aco
  ```
  - #### Enable Valve's AMD ACO Recompiler (Requires RADV):
    > <p align=center> ⚠️ <u><b>More information may be needed on this Topic</u></b> ⚠️ </p>

    >A dynamic shader recompiler with the goal to replace standard LLVM shader compilation. <u>This can speed up shader compilation and reduce stuttering in most titles</u>, but (in my own testing) seems to help DXVK (or DirectX 11) titles more as DirectX 11 is not an Asynchronous aware API, and translating to Vulkan can add shader stuttering as result. This helps mitigate this.
    ```
    RADV_PERFTEST=aco
    ```
  - #### Vulkan GraphicsPipelineLibrary (<a href="https://github.com/GloriousEggroll/proton-ge-custom">`Proton-GE`</a> Only)
    > As of <a href=https://github.com/GloriousEggroll/proton-ge-custom/releases/tag/GE-Proton7-45>`GE-Proton7-45`</a>, `dxvk_async` was deprecated in favor of Graphics Pipeline Library (GPL) standard. It's job is to replace the functionality of `dxvk_async` and provide a Vulkan Extension to take it's place. This *should* be more cross platform with AMD, Nvidia, Intel, etc; but as of right now, more testing will be needed.
    ```
    RADV_PERFTEST=gpl
    ```

- ## <img src="https://user-images.githubusercontent.com/28176188/142362826-8090a147-94ee-4f67-a3ed-f87058a6797d.png" width="17" height="17"> Nvidia Tweaks:

  - ### Force a specific Vulkan Driver (ICD):
    This is usually helpful when you either have multiple GPUs, a game is expecting only a 32-Bit library to exist, and fails to initialize because it only sees the default 64-Bit library, or when you want to specify a specific driver for a specific game (e.g. A game performs better on a specific driver) 

      > ##### :exclamation: <u>Required Package(s)</u>: [`nvidia-utils`](https://archlinux.org/packages/extra/x86_64/nvidia-utils/) & [`lib32-nvidia-utils`](https://archlinux.org/packages/multilib/x86_64/lib32-nvidia-utils/) 
      - 64-Bit Nvidia ICD:
        ```
        VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/nvidia_icd.json
        ```

- ## Valve GAMESCOPE (Formerly <a href=https://github.com/Plagman/gamescope>`steamcompmgr`</a>)
  > ❗ <b><u>Notice</b></u>: This is for the Gamescope Compositor, not Desktop Environment
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
  # <p align=center>Games:</p>
  -->


<div id="user-content-toc">
  <ul>
    <summary align="center"><h1 style="display: inline-block; text-decoration: none;">Games:</h1></summary>
  </ul>
</div>

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

## Grand Theft Auto IV: The Complete Edition:
- #### Wine / Proton Info:
  - Last Known Working: `Proton-6.21-GE-2`
  
- **Steam Launch Arguments**:
  ```bash
  DXVK_HUD=compile gamemoderun mangohud %command%
  ```

## Farming Simulator 22:
- #### Wine / Proton Info:
  - Last Known Working: `Proton 6.3-8`

- **Steam Launch Arguments**:
  ```bash
  VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/radeon_icd.x86_64.json RADV_PERFTEST=aco gamemoderun mangohud %command%
  ```
- **Notes**: 
    - This game uses standard RADV ICD + ACO Recompiler, Gamemode Run, and Mangohud

## Spyro Reignited Trilogy:
- #### Wine / Proton Info:
  - Last Known Working: `Proton-7.0rc2-GE-1`

- **Steam Launch Arguments**:
  ```bash
  VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/radeon_icd.x86_64.json RADV_PERFTEST=aco gamemoderun mangohud %command% -nohmd -DX11
  ```
- **Notes**: 
    - This game uses standard RADV ICD + ACO Recompiler, Gamemode Run, and Mangohud
    - Without `-nohmd` and `-DX11` flags, this game will either crash at random intervals, or instantly crash without any warning before the game launches.

## Ghostrunner:
- #### Wine / Proton Info:
  - Last Known Working: `Proton-7.0rc6-GE-1`

- **Steam Launch Arguments**:
  ```bash
  VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/radeon_icd.x86_64.json RADV_PERFTEST=aco gamemoderun mangohud %command%
  ```

## Satisfactory:
- #### Wine / Proton Info:
  - Last Known Working: `GE-Proton7-10`

- **Steam Launch Arguments**:
```
MESA_GL_VERSION_OVERRIDE=4.4COMPAT __GL_SHADER_DISK_CACHE=1 VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/radeon_icd.x86_64.json RADV_PERFTEST=aco gamemoderun mangohud %command% -opengl -SkipBuildPatchPrereq
```

## Assassins Creed Origins:
- #### Wine / Proton Info:
  - Last Known Working: `GE-Proton7-9`
- **Steam Launch Arguments:**
  ```bash
  DXVK_LOG_LEVEL=none PROTON_USE_D9VK=1 %command%
  ```

## Sleeping Dogs: Definitive Edition:
- #### Wine / Proton Info:
  - Last Known Working: `Proton 6.3-8`

- **Dependancies:**
    - `gamescope-git`<sup>[aur](https://aur.archlinux.org/packages/gamescope-git)</sup>
      - Required due to [Sleeping Dogs White Screen issue](https://github.com/ValveSoftware/Proton/issues/872#issuecomment-468116035). Default Proton Fix includes using a Virtual Desktop, however, the gamescope approach works nicer with Multi-Mon Setups.
- **Steam Launch Arguments:**
  ```bash
  VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/radeon_icd.x86_64.json RADV_PERFTEST=aco gamemoderun gamescope -w 2560 -h 1440 -W 2560 -H 1440 -b -- mangohud %command%
  ```
- ### Fixes:
  - #### How to fix Virtual Desktop / Multi-Mon Issues:
    1. Install Dependancies
    2. In the commandline, run `protontricks 307690 --gui`
    3. When Protontricks opens, Click `Select the default wineprefix` and Click `ok`.
    4. Click `Run winecfg`
    5. In the "`Graphics`" tab of winecfg, uncheck: `Emulate a virtual desktop`
    6. add Steam Launch Arguments, and replace both instances of Width and Height (`-w` & `-h`) to your Monitor's Resolution.

## Final Fantasy XV: "Windows" Edition:
- #### Wine / Proton Info:
  - Initial Test Version: `GE-Proton7-18`<sup>[Regression](https://github.com/ValveSoftware/Proton/issues/74#event-5256563749)</sup>
    -  **Regression Info**:
       -  Every version past `Proton 7.0-2` is known to have a regression where a message pops up containing: ["Unable to create interface ISteamUser" error](https://user-images.githubusercontent.com/3923810/44459007-53c26c80-a608-11e8-9a79-734b6050b927.png), or the game starts with a Black Screen; along with various other issues with the game past this specific Proton version. Use with Caution.
  - Last Known Working: `Proton 7.0-2`
- **Steam Launch Arguments:**
  ```bash
  VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/radeon_icd.x86_64.json RADV_PERFTEST=aco gamemoderun mangohud %command%
  ```

## Bioshock Remastered:
- #### Wine / Proton Info:
  - Working Status: `Working, occasional crashing. Unsure if caused by Proton.`
  - Initial Test Version: `Proton Experimental`
  - Last Known Working: `GE-Proton7-18` <sup>*Possibly* also causing crashing, further testing / research needed.</sup>
- Issues:
  - Game is known to crash upon saving, loading the map (m key), or loading a new world. These issues are sporadic and random, ~~and no discernable cause has been placed yet.~~ It's possible crashes are caused by DXVK trying to inject 64bit libraries into a 32bit game, as forcing Vulkan ICD as the `i686` variant seems to stop or limit crashing. More testing is needed.
- **Steam Launch Arguments:**
  ```bash
  VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/radeon_icd.i686.json RADV_PERFTEST=aco mangohud %command% -nointro
  ```

## Ghost of a Tale:
- #### Wine / Proton Info:
  - Working Status: `Seems to be Fully Working, More Testing Needed`
  - Initial Test Version: `GE-Proton7-20` <sup>*Possibly* Also Broken, further testing needed.</sup>
  - Last Known Working: `Proton 6.3-8`
- **Steam Launch Arguments:**
  ```bash
  VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/radeon_icd.i686.json RADV_PERFTEST=aco gamemoderun mangohud %command%
  ```

## Deep Rock Galactic:
- #### Wine / Proton Info:
  - Working Status: `Working`
  - Initial Test Version: `GE-Proton7-17`
  - Last Known Working: `GE-Proton7-17`
- **Steam Launch Arguments:**
  ```bash
  VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/radeon_icd.x86_64.json RADV_PERFTEST=aco gamemoderun mangohud %command%
  ```

## Tunic:
- #### Wine / Proton Info:
  - Working Status: `Working`
  - Initial Test Version: `GE-Proton7-17`
  - Last Known Working: `GE-Proton7-18`
- **Steam Launch Arguments:**
  ```bash
  VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/radeon_icd.x86_64.json RADV_PERFTEST=aco gamemoderun mangohud %command%
  ```

## Assassins Creed Origins:
- #### Wine / Proton Info:
  - Working Status: `Working`
  - Initial Test Version: `GE-Proton7-17`
  - Last Known Working: `GE-Proton7-35`
- #### Steam Launch Arguments:
  - `GE-Proton7-25` and Above (currently untested):
    ```bash
    DXVK_ASYNC=1 %command%
    ```
  - Previous Launch Arguments
    ```bash
    DXVK_LOG_LEVEL=none PROTON_USE_D9VK=1 %command%
    ```

## Sea of Thieves:
- #### Wine / Proton Info:
  - Working Status: `Working`
  - Initial Test Version: `GE-Proton7-17`
  - Last Known Working: `GE-Proton7-17`
- **Steam Launch Arguments:**
  ```bash
  VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/radeon_icd.x86_64.json RADV_PERFTEST=aco gamemoderun mangohud %command%
  ```

## Cult of the Lamb:
- #### Wine / Proton Info:
  - Working Status: `Working`
  - Initial Test Version: `Proton-7.0rc6-GE-1`
  - Last Known Working: `GE-Proton7-38`
- **Steam Launch Arguments:**
  ```bash
  VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/radeon_icd.x86_64.json RADV_PERFTEST=aco gamemoderun mangohud %command%
  ```
- ### Fixes:
  - #### [Stuttering / Frame-Pacing Issues](https://www.reddit.com/r/SteamDeck/comments/x4cau0/cult_of_the_lamb_micro_stutter_fix/):
     - Add the Following Lines to: `<installdir>/Cult of the Lamb/Cult Of The Lamb_Data/boot.config`
      ```
      gfx-enable-gfx-jobs=1
      gfx-enable-native-gfx-jobs=1
      gc-max-time-slice=1
      ```

## Dinkum:
- #### Wine / Proton Info:
  - Working Status: `Working`
  - Initial Test Version: `GE-Proton7-27`
  - Last Known Working: `GE-Proton7-38`
- **Steam Launch Arguments:**
  ```bash
  VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/radeon_icd.x86_64.json RADV_PERFTEST=aco gamemoderun mangohud %command%
  ```
- ### Fixes:
  - #### Stuttering / Frame-Pacing Issues:
     - Add the Following Lines to: `<installdir>/Dinkum/Dinkum_Data/boot.config`
      ```
      gfx-enable-gfx-jobs=1
      gfx-enable-native-gfx-jobs=1
      gc-max-time-slice=1
      ```