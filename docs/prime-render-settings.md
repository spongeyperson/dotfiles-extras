# <p align=center>(WIP) PRIME Render Offload Settings:
###### <p align=center> The following page is currently <i>semi</i> biased towards <u>my current hardware</u>. This page is being used as Internal notes to write the proper Prime Offload settings page for general purpose systems. In the meantime, this page, and the newly rewritten [ROG G15 Advantage](docs/Hardware&#32;Specific&#32;Fixes&#32;&#32;Settings/ROG-G15-Settings.md) page will not be visible on the main [README.md](https://github.com/spongeyperson/arch-dotfiles/blob/master/README.md) due to this.

## <img src="https://user-images.githubusercontent.com/28176188/192112809-e2564eee-f9a6-4504-8d13-a56d58b268f3.svg" width="20" height="20"> Current Testing Hardware:
<p align=center><img src="https://user-images.githubusercontent.com/28176188/192112487-b5c15ca1-9600-4fba-b113-fb439ba4de87.png"></p>

## <img src="https://user-images.githubusercontent.com/28176188/142365376-270d160f-33c3-4012-a3d9-541ab65bfdb6.png" width="20" height="20"> **AMD**:

- Enable Prime Render Offload in OpenGL / OpenCL Applications:
  - ```sh
    DRI_PRIME=<dev-id>
    ```

- ### Vulkan Specific:
  - Steam Device Chooser:
    - ```sh
      ENABLE_DEVICE_CHOOSER_LAYER=<dev-id> VULKAN_DEVICE_INDEX=<dev-id> %command%
      ```
  - Requirements:
    - [VKDEVICECHOOSER](https://github.com/aejsmith/vkdevicechooser)<sup><sup>[aur](https://aur.archlinux.org/packages/vkdevicechooser)</sup></sup>

## <img src="https://user-images.githubusercontent.com/28176188/142362826-8090a147-94ee-4f67-a3ed-f87058a6797d.png" width="20" height="20"> Nvidia:
  - **Work In Progress**
  - ```sh
    __NV_PRIME_RENDER_OFFLOAD=1
    ```

---

- References:
    - https://github.com/aejsmith/vkdevicechooser
    - https://wiki.archlinux.org/title/Vulkan#Selecting_via_environment_variable
    - https://wiki.archlinux.org/title/PRIME#PRIME_GPU_offloading
    - https://wiki.archlinux.org/title/PRIME#Configure_applications_to_render_using_GPU
