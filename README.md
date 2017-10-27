ReasonMl vs code docker
==

This is a docker container running vs code for a ReasonML Workshop at reactive conf 2017

Usage
==
```
docker run --rm -it -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY -v $HOME/.Xauthority:/home/vscode/.Xauthority --net=host --device /dev/dri gidsi/vs-reasonml /bin/bash
```

I haven't stripped the command so far to what is really needed, so far it works for me.

For the workshop itself visit:
https://github.com/sgrove/reactiveconf-2017-reasonml-workshop
