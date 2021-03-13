# CrushFTP for Docker

[![Docker Automated build](https://img.shields.io/docker/automated/shokinn/crushftp.svg)](https://hub.docker.com/r/shokinn/crushftp/)
[![Docker Build Status](https://img.shields.io/docker/build/shokinn/crushftp.svg)](https://hub.docker.com/r/shokinn/crushftp/)
[![Docker image version](https://images.microbadger.com/badges/version/shokinn/crushftp.svg)](https://microbadger.com/images/shokinn/crushftp)
[![Docker image size](https://images.microbadger.com/badges/image/shokinn/crushftp.svg)](https://microbadger.com/images/shokinn/crushftp)

# CrushFTP10
Alpine docker container which runs CrushFTP 10.

This container is distributed under the [MIT Licence](LICENSE).

# Volumes, Paths, Ports, and Envrionmental Variables
## Volumes
| Volume | Required | Function | Example |
|----------|----------|----------|----------|
| `config` | Yes | Persistent storage for CrushFTP config | `/your/config/path/:/config`|

## Paths
| Path | Required | Function |
|----------|----------|----------|
| `/config/fCrushFTP10` | Yes | CrushFTP 10 configuration files |

## Ports
The OpenSSH server runs by default on port 22. You can forward the container's port 22 to the any host port.

| Port | Proto | Required | Function | Example |
|----------|----------|----------|----------|----------|
| `21` | TCP | Yes | FTP Port | `21:21`|
| `443` | TCP | Yes | HTTPS Port | `443:443`|
| `2222` | TCP | Yes | SFTP Port | `2222:2222`|
| `8080` | TCP | Yes | HTTP Port | `8080:8080`|
| `9090` | TCP | Yes | HTTP Port | `9090:9090`|

## Environment Variables

| Variable               | Description               | Default      |
|:-----------------------|:--------------------------|:-------------|
| `CRUSH_ADMIN_USER`     | Admin user of CrushFTP    | `crushadmin` |
| `CRUSH_ADMIN_PASSWORD` | Password for admin user   | `crushadmin` |
| `CRUSH_ADMIN_PROTOCOL` | Protocol for health cecks | `http`       |
| `CRUSH_ADMIN_PORT`     | Port for health cecks     | `8080`       |

## Installation
Run this container and share the containers `/config` directory, which persists CrushFTP's configuration, to an appropriate location on the host. Open a browser and go to http://localhost:8080. Note that the default username and password are both `crushadmin`.

This command will create a new container and expose all ports. Remember to change the `<volume>` to a location on your host machine.

```
docker run -p 21:21 -p 443:443 -p 2222:2222 -p 8080:8080 -p 9090:9090 -v <volume>:/config markusmcnugen/crushftp:latest
```
