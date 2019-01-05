# CrushFTP for Docker
Docker image for CrushFTP server. Installs dependencies, including Java with unlimited JCE.

**Note:** This repository does not directly include any of the aforementioned copyrighted products, rather, it downloads them from the servers of their respective developers at buildtime. By using this container, you agree to any licence terms they may have.

This container, itself, is distributed under the [MIT Licence](https://github.com/Dalstroem/Docker-CrushFTP/blob/master/LICENSE).

# Installation
Run this container and share the containers `/var/opt/CrushFTP9_PC` directory, which persists CrushFTP's configuration, to an appropriate location on the host. Open a browser and go to http://localhost:8080. Note that the default username and password are both `crushadmin`.

This command will create a new container and expose all ports. Remember to change the `<volume>` to a location on your host machine.

```
docker run -p 21:21 -p 443:443 -p 2222:2222 -p 8080:8080 -p 9090:9090 -v <volume>:/var/opt/CrushFTP9_PC dalstroem/crushftp:latest
```
