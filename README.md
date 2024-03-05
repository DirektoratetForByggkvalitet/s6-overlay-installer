# S6-overlay installer

Simple script to install the S6-overlay into a docker image.

The script will determine the platform and install the correct binaries from the [s6-overlay repository on Github](https://github.com/just-containers/s6-overlay). You will need to add the rc.d configuration needed yourself.

## Usage

Use the following code in your Dockerfile in order to install S6-overlay:

```
ADD https://bitbucket.org/dibk/s6-overlay-installer.git /s6-overlay-installer
RUN /s6-overlay-installer/s6_install.sh && rm -rf /s6-overlay-installer
```

## Requirements

The script requires bash in order to run. Some images might require bash to be installed. This can be accomplished in Alpine Linux by the following line in the Dockerfile:
```
RUN apk add --no-cache bash
```