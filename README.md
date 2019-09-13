# Leightweight Docker images for trbnettools

<https://github.com/pklaus/trbnettools_docker/>

This is a collection of leightweight Dockerfiles / images that incorporate the trbnettools.
The aim is to have the TrbNet Daemon trbnetd available withtin a docker container.

You can start your container like this:

```
docker run -it --rm pklaus/trbnettools:ubuntu1904 /bin/bash
```

### Running trbnetd in the Container

First, start rpcbind as a daemon:

```
rpcbind
```

You can make sure, that rpcbind is listening on a local UNIX socket as well as on port 111 udp/tcp via:

```
rpcinfo
```


To start the trbnetd:

```
# /trbnettools/trbnetd/server/trbnetd -h
Usage: trbnetd [-h] [-f] [-i progId]
Options:
  -h    give this help
  -i    set an individual RPC-ProgId (0-255), default 0
  -f    execute as foreground process
  -V    version number

Signals:
  USR1  lock daemon
  USR2  unlock daemon
```

Important: The trbnetd needs the environment variable
`TRB3_SERVER` to be set to the IP it should talk to.

```
# export TRB3_SERVER=192.168.111.222
# /trbnettools/trbnetd/server/trbnetd 
```

Now you may try to run trbcmd locally.
Be sure, to set the DAQOPSERVER environment variable beforehand.

```
# export DAQOPSERVER=localhost
# /trbnettools/trbnetd/trbcmd i 0xffff
```
