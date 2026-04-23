# OpenVPN IP Panel Script

Displays your OpenVPN IP in a panel using a Generic Monitor.

---

## Setup (XFCE Panel)

1. Add **Generic Monitor** to your panel

   * Right-click panel → **Panel Preferences** → **Items** → **+** → **Generic Monitor**

2. Set the script path

   * Select the Generic Monitor → **Properties**
   * Set **Command** to your script path, e.g.:

     ```sh
     /path/to/vpn-ip.sh
     ```

3. Make the script executable

   ```sh
   chmod +x /path/to/vpn-ip.sh
   ```

4. Done — the VPN IP should now appear in the panel when connected

---

## Notes

* Script auto-detects OpenVPN interfaces (`tun0`, etc.)

* If it doesn’t work, try specifying manually:

  ```sh
  /path/to/vpn-ip.sh tun0
  ```

* Optional (for click-to-copy):

  ```sh
  sudo apt install xclip
  ```

---

## Output Example

```xml
<icon>network-vpn-symbolic</icon>
<txt>10.8.0.2</txt>
```
