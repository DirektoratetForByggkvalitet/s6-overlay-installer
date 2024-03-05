# S6-overlay installer

Simple script to install the S6-overlay into a docker image.

It will determine the platform and install the correct binaries.

## Required components

The image needs to have bash installed.

## Usage

Use the following code in your Dockerfile in order to install S6-overlay:

```
ADD https://bitbucket.org/dibk/s6-overlay-installer.git /s6-overlay-installer
RUN /s6-overlay-installer/s6_install.sh && rm -rf /s6-overlay-installer
```