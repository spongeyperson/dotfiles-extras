# Chromium Common Issues on Linux:

- ### Graphical Glitches after Upgrading System (Wayland)
    - A common issue on Chromium Based browsers under Wayland, using the Native Wayland Ozone Platform; after upgrading, can sometimes cause graphical corruption after upgrading system. 

    - ### <b>The Fix</b>:
        - Delete the following folder:
            - <u>Brave Browser</u>:
            ```bash
            rm -rv ~/.config/BraveSoftware/Brave-Browser/Default/GPUCache
            ```
            - <u>Google Chrome</u>:
            ```bash
            rm -rv ~/.config/google-chrome/Default/GPUCache
            ```