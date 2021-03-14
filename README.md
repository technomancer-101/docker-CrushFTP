# CrushFTP 10
Ubuntu 20.04 based docker container which runs CrushFTP 10.

This container is distributed under the [MIT Licence](LICENSE).

# Volumes, Paths, Ports, and Envrionmental Variables
## Volumes
| Volume | Required | Function | Example |
|----------|----------|----------|----------|
| `/var/opt/CrushFTP10` | Yes | Persistent storage for CrushFTP config | `/your/config/path/:/var/opt/CrushFTP10`|

## Ports
The OpenSSH server runs by default on port 22. You can forward the container's port 22 to the any host port.

| Port | Proto | Required | Function | Example |
|----------|----------|----------|----------|----------|
| `21` | TCP | Yes | FTP Port | `21:21`|
| `443` | TCP | Yes | HTTPS Port | `443:443`|
| `2222` | TCP | Yes | SFTP Port | `2222:2222`|
| `8080` | TCP | Yes | HTTP Port | `8080:8080`|
| `9090` | TCP | Yes | HTTP Alt Port | `9090:9090`|

## Environment Variables

| Variable               | Description               | Default      |
|:-----------------------|:--------------------------|:-------------|
| `CRUSH_ADMIN_USER`     | Admin user of CrushFTP    | `crushadmin` |
| `CRUSH_ADMIN_PASSWORD` | Password for admin user   | `crushadmin` |

## Installation
Run this container and mount the containers `/var/opt/CrushFTP10` volume to the host to keep CrushFTP's configuration persistent. Open a browser and go to http://[IP]:8080. Note that the default username and password are both `crushadmin` unless the default environment variables are changed.

This command will create a new container and expose all ports. Remember to change the `<volume>` to a location on your host machine.

```
docker run -p 21:21 -p 443:443 -p 2222:2222 -p 8080:8080 -p 9090:9090 -v <volume>:/var/opt/CrushFTP10 markusmcnugen/crushftp:latest
```
