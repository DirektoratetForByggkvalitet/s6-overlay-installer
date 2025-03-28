# S6-overlay installer

Simple script to install the S6-overlay into a docker image.

The script will determine the platform and install the correct binaries from the [s6-overlay repository on Github](https://github.com/just-containers/s6-overlay). You will need to add the rc.d configuration needed yourself.

## Usage

Use the following code in your Dockerfile in order to install S6-overlay:

```
ENV S6_OVERLAY_VERSION="3.2.0.2" # Change when you need to update S6-overlay, or omit to use the default version
ADD https://github.com/DirektoratetForByggkvalitet/s6-overlay-installer.git /s6-overlay-installer
RUN /s6-overlay-installer/s6_install.sh && rm -rf /s6-overlay-installer
```

## Requirements

The script requires bash, zsh or ksh in order to run. Some images might require a shell to be installed. This can be accomplished in Alpine Linux by the following line in the Dockerfile:
```
RUN apk add --no-cache zsh
```

The environment variable S6_OVERLAY_VERSION will be needed in order to install versions of S6-overlay beyond the version set as default in the script (currently 3.2.0.2).

## License

The code published here is licensed with the [MIT License](LICENSE).