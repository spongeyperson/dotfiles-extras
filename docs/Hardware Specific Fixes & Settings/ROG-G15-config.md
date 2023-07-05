#### <p align=center> <a href="https://github.com/spongeyperson/spongeyperson/docs/global-index.md" title="Return to Spongey's Global Index. This Index links you back to all *active* repositories i'm working on.">🡐 /spongeyperson/spongeyperson/global-index.md</a>

# <p align=center>(WIP) ASUS ROG G15 "Advantage Edition" on Linux:
###### <p align=center> ROG G15 G513QY


## <img src="https://user-images.githubusercontent.com/28176188/192112809-e2564eee-f9a6-4504-8d13-a56d58b268f3.svg" width="20" height="20"> Neofetch:
<p align=center><img src="https://user-images.githubusercontent.com/28176188/192112487-b5c15ca1-9600-4fba-b113-fb439ba4de87.png"></p>

<!--
### WIP SECTION

## Annoyances:

- ### General Annoyances:

  WIP SECTION
  There's only a few. One of the biggest annoyances is the Laptop does not allow the useage of more than 512MB of Video Memory on the iGPU


- ### Linux Specific:
-->

## <img src="https://user-images.githubusercontent.com/28176188/142365376-270d160f-33c3-4012-a3d9-541ab65bfdb6.png" width="20" height="20"> **AMD PRIME Render Offload**:

 This Laptop has 2 Graphics Processors. 1x AMD (Cyzanne) RENOIR Based APU, and 1x NAVI 21 Based RX 6800M with a Software-based Hybrid GPU setup, similar to Nvidia Optimus, but without a MUX Chip. AMD Graphics (mostly) work out of the box with this Laptop, however, dedicated GPU video out ports (USB-C DP Out) does not work out of the box. 
 
 PRIME Render Offload is needed for the RX 6800M to be used, and luckily, by default, it does just that. But for more granilar control, the following below can be used:


- #### Prime Render Offload Standard Environment Variable:
  
  ```sh
  DRI_PRIME=<dev-id>
  ```
  - This Environment Variable allows you to toggle the use of PRIME. However, some applications may ignore this value (Particularly Vulkan Applications), but for sanity sake, i usually toggle it anyway.
    - By Default, the Following Device-IDs should be binded in this fashion:
      - <u>Device 0</u> = AMD RENOIR (VEGA 8) APU
      - <u>Device 1</u> = RX 6800M
    - If your device id's vary from this, run the following in the terminal, it should give device info for the ids given.
      ```sh
      DRI_PRIME=<dev-id> glxinfo | grep "OpenGL renderer"
      ```
      <img src=https://user-images.githubusercontent.com/28176188/193439375-f8cebf6e-53e6-408b-b601-d25423d6c47c.png width="600">
      

- #### Vulkan Specific:
  - For Vulkan Specific applications, Vulkan **will ignore** your options set in the Prime Render Offload Environment Variable as Vulkan has it's own device management. In order to overcome this, there's a nice third-party tool we can use to manipulate Vulkan to our whims. [`VKDEVICECHOOSER`](https://github.com/aejsmith/vkdevicechooser)<sup><sup>[aur](https://aur.archlinux.org/packages/vkdevicechooser)</sup></sup> lets us do exactly this.
    - **Vulkan Default Device Binding**:
      - <u>Device 0</u> = RX 6800M
      - <u>Device 1</u> = AMD RENOIR (VEGA 8) APU
    - If your device id's vary from this, run the following in the terminal, it should give device info for the ids given.
      ```sh
      ENABLE_DEVICE_CHOOSER_LAYER=1 VULKAN_DEVICE_INDEX=<dev-id> vulkaninfo | grep "GPU id"
      ```
      <img src="https://user-images.githubusercontent.com/28176188/193439555-aa84f5b6-33c0-4c3a-8096-514658cd1fbf.png" width="600">

  - **Terminal Launch Options:**
    ```sh
    ENABLE_DEVICE_CHOOSER_LAYER=1 VULKAN_DEVICE_INDEX=<dev-id>
    ```

  - <img src="https://user-images.githubusercontent.com/28176188/142364090-9c9b1eaf-8e94-4402-b943-0d46895032f2.png" width="15" height="15"> **Steam Launch Options**:
    ```sh
    ENABLE_DEVICE_CHOOSER_LAYER=1 VULKAN_DEVICE_INDEX=<dev-id> %command%
    ```
    - Replace `<dev-id>` with the desired device in the `Vulkan Default Device Binding` listing above.  



## <img src="https://user-images.githubusercontent.com/28176188/193438035-0f795697-0e92-4597-9104-672b00dc46ce.svg" width="20" height="20"> **Hardware Control**:

  - **ROG Control Center** (`rog-control-center`<sup><sup>[aur](https://aur.archlinux.org/packages/rog-control-center)</sup></sup>)
    - Opensource ROG Control Center used for Controlling Keyboard & Lightbar RGB, Fan Curves, Profiles and so much more. Uses `asusctl` in the background to set these settings.
      - <u>**Installation Instructions**</u>:
        1. Install `rustup`<sup><sup>community</sup></sup> package (overwrite rust dependancy if needed)
        2. run `rustup install stable`
        3. run `rustup default stable`
        4. Install `rog-control-center`<sup><sup>[aur](https://aur.archlinux.org/packages/rog-control-center)</sup></sup>
        5. Enable & Start `asusd` service (`sudo systemctl enable --now asusd`)
        6. Start Program

---
- References:
    - https://github.com/aejsmith/vkdevicechooser
    - https://wiki.archlinux.org/title/Vulkan#Selecting_via_environment_variable
    - https://wiki.archlinux.org/title/PRIME#PRIME_GPU_offloading
    - https://wiki.archlinux.org/title/PRIME#Configure_applications_to_render_using_GPU

