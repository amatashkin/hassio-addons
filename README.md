# hassio-addons
Alexey's Home Assistant Add-ons repository for the [Home Assistant](https://www.home-assistant.io/hassio/)

## Addons

* Snapcast - Multiroom client-server audio player.
* Librespot - Open source client library for Spotify, works as a Spotify Connect receiver.
* Shairport Sync - AirPlay audio player

More about the Add-ons can be found in their folders.

## Installation

To install those Add-ons add this repository in the Home Assistant Add-on store.

Use the following URL to add this repository:

```
https://github.com/amatashkin/hassio-addons
```

## Build

On Windows WSL build without mapping docker config volume to workaround docker cli login errors: [Upload fail on <X> and error in docker login](https://github.com/home-assistant/builder/issues/35#issuecomment-549574961)
```
docker run --rm --privileged -v \
  -v "$(pwd)":/data homeassistant/amd64-builder \
  --all -t /data --docker-user <user> --docker-password <token>
```