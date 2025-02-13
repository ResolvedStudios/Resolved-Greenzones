# Resolved-Greenzones
### Resolved-Greenzones is an easy-to-use and configurable script for managing green zones in FiveM servers. It allows you to quickly define safe areas where players cannot engage in hostile actions like melee combat, shooting, or aiming, ensuring a more controlled and peaceful environment in designated zones.

## Features:
- Pre-configured Zones: Includes pre-set safe zones like MRPD (Mission Row Police Department), Sandy Shores PD, and others.
- Player Notifications: Players will be notified when they enter or leave a green zone.
## Restricted Actions:
- No Melee: Players can't use melee weapons within the zone.
- No Shooting/Aiming: Players cannot shoot or aim weapons in green zones.
- Invincible: Players within green zones are invincible and cannot die.
### With Resolved-Greenzones, you can easily control the behavior of players within safe areas and create a more immersive and regulated environment for your server.
---
# Install Resolved-Greenzones
### Step 1
- Download the main file
- Donload [Resolved-Notify](https://github.com/ResolvedStudios/Resolved-Notify) (MUST DOWNLOAD THIS FOR NOTIFACTIONS TO WORK)
### Step 2
- Drag and drop "Resolved-Greenzone" into your resource folder
- Drag and drop "Resolved-Notify" into your resource folder

### Step 3
- Go into your server.cfg
- Pleases put this line into your CFG - "ensure Resolved-Greenzone"
- Pleases put this line into your CFG - "ensure Resolved-Notify"

### Step 4
- Configure/Add green zones (optional)



---
# Add a green zone
### Format:
- {coords = vector3(X, Y, Z), radius = 50.0, name = "Zone Name"},

### Example:
- {coords = vector3(100.0, 100.0, 30.0), radius = 50.0, name = "Custom Green Zone"}

## Explanation:
- coords: These are the X, Y, and Z coordinates for the center of the green zone.
- radius: This defines how large the green zone will be (in meters).
- name: A label for the zone to identify it.


## [Resolved Notify](https://github.com/ResolvedStudios/Resolved-Notify)
Resolved Notify is used in this code! Press on that link to get more information. If the link does not 
work here is the direct link: https://github.com/ResolvedStudios/Resolved-Notify
