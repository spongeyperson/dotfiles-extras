#### <p align=center> <a href="https://github.com/spongeyperson/spongeyperson/blob/main/docs/global-index.md" title="Return to Spongey's Global Index. This Index links you back to all *active* repositories i'm working on.">🡐 /spongeyperson/spongeyperson/global-index.md</a>

# <p align=center>General Wine Game Troubleshooting: </p>
###### <p align=center> A Generalized list of common issues and troubleshooting steps to do with Wine gaming under Linux.<br>(A Guide for the Linux Noobie)</br></p>
<br></br>
> Note: This list is, and always will be, in a constant state of work in progress. This is because as I solve issues on my own systems, I document them here on this github repository, not only for public use, but for my own sanity when re-producing issues elsewhere for bug reports, or to remind me of hacks needed to get games running smoothly.

# Table of Contents:
  - **Issues**:
    - **For Games Under Steam**:
      - [Getting Started](#getting-started-troubleshooting-good-practices)
      - [Game Cannot Find D3D / OGL / Vulkan Device due to 64-Bit Libraries](#game-insists-it-cannot-find-d3d--ogl--vulkan-device)
        - Related:
          1. Game Unexpectedly throws a DXVK Error then Terminates itself upon launch <sup><sup>Example: [1](https://user-images.githubusercontent.com/28176188/175793469-a26f8d34-3502-4edb-85c7-ddfd93bab39c.png)</sup></sup>
          2. Game runs for awhile then randomly Segfaults
    - **Games Under Lutris**:
      - *Work in Progress* 

# <img src="https://user-images.githubusercontent.com/28176188/142364090-9c9b1eaf-8e94-4402-b943-0d46895032f2.png" width="25" height="25"> Games Under Steam:
## Getting Started; Troubleshooting & Good Practices:
  1. To start troubleshooting most games, it's best to start by closing your current instance of Steam, and re-launch it under the Commandline by just typing `steam` in the commandline. If you have another display, it'll help putting this commandline on that display, somewhere you can see it best during gameplay.
  
<p align=center>

| ![About this Mac](https://user-images.githubusercontent.com/28176188/175799719-430d0abb-8e31-4423-8782-70fb246268b9.gif) |
| :--: |
| <sub> Steam Launching under Commandline </sub> |

</p>

## Game insists it cannot find D3D / OGL / Vulkan Device.

**<p align=center>Common Symptoms:</p>**
<p align=center>

| ![Ex1](https://user-images.githubusercontent.com/28176188/175793008-673d6ab8-1e5c-4a92-bceb-ce429606386f.png) | ![Ex2](https://user-images.githubusercontent.com/28176188/175793469-a26f8d34-3502-4edb-85c7-ddfd93bab39c.png) |
| :--: | :--: |
| <sub>Unable to find D3D Device because game is looking for 32-Bit Graphics Drivers that don't exist from the Game's POV.</sub> | <sub>Game unexpectedly throws a DXVK Error and then terminates itself.</sub> |
</p>

- ##### Chances are this issue is caused by DXVK trying to inject 64-Bit Libraries / Hooks into a game expecting a 32-Bit Graphics Driver.
<!--
- ##### This can also be caused 
-->
 ### Troubleshooting: 
 - #### Verification Steps:
    1. To verify if this specific game does indeed need 32-Bit libraries, run it under `WineD3D` with `Mangohud` ([use this Mangohud Config if you cannot see Architecture](https://github.com/spongeyperson/arch-dotfiles/blob/master/home/tyler/.config/MangoHud/MangoHud.conf)); then use the following Steam launch arguments:
         ```bash
          PROTON_USE_WINED3D=1 mangohud %command%
          ```
          - >**Notice:** Performance ***will*** almost certainly be worse with `WineD3D` instead of `DXVK` / `VKD3D`. These flags should only be used if the game won't run otherwise, performance is *ok* enough to deal with `WineD3D` being the default renderer (some game engines and 2D games), or the game crashes constantly without it.

    2. If you see the following on Mangohud, and your game crashes on it's own after a certain amount of time; or on it's own without `PROTON_USE_WINED3D=1`, than it's a prime candidate to be a game that is **ONLY** looking for 32-Bit libraries in some capacity, and either Sigfaults due to buffer overflows trying to address 64-Bit drivers in a 32-Bit address space, or the game refuses to launch because it's unable to find the graphics driver as the game will only see 32-Bit drivers.
    
    ![](https://user-images.githubusercontent.com/28176188/175798430-12fb8922-98ab-4fb1-af20-a1a2b1df3ec3.png)
    
  ### Possible Solution(s):
1. Force the game to use 32-Bit Vulkan ICDs
   - Add the following to your steam launch options:
     - #### <img src="https://user-images.githubusercontent.com/28176188/142365376-270d160f-33c3-4012-a3d9-541ab65bfdb6.png" width="16" height="16"> AMD / Radeon Specific:
        ```bash
        VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/radeon_icd.i686.json
        ```
     - #### <img src="https://user-images.githubusercontent.com/28176188/142362826-8090a147-94ee-4f67-a3ed-f87058a6797d.png" width="16" height="16"> Nvidia Specific: <sup><sup>(Untested)</sup></sup>
        ```bash
        VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/nvidia_icd.i686.json
        ```
# <img src="https://user-images.githubusercontent.com/28176188/142367009-ea2326c6-16ca-494a-9a4f-2591f90e2cae.png" width="25" height="25"> Games Under Lutris:
### <p align=center>Work in Progress</p>