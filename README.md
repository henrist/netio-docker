# netio-docker

Docker image to run [NETIO Network Benchmark](https://web.ars.de/netio/)
using Docker.

## Example use

The simplest way of using this is to create a shell alias, so that
the binary can be used "directly". Put this in `.bashrc` or
just write it in your terminal for one-shot use:

```bash
alias netio="docker run --rm -it --network host henrist/netio"
```

Now `netio` can be used as if it is installed locally.

Show help:

```bash
netio
```

Run server:

```bash
netio -s
```

Run client against server (using TCP):

```bash
netio -t host-or-ip-of-server
```
