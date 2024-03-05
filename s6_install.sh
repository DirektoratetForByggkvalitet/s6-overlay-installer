#!/bin/bash

: "${S6_OVERLAY_VERSION:=3.1.6.2}"

arch=$(uname -m)
echo "Installerer S6-overlay, v${S6_OVERLAY_VERSION}, for ${arch}"

# Endrer på filnavnet etter arkitektur.
if [ "$arch" = "arm64" ]; then
  code="aarch64"
elif [ "$arch" = "amd64" ]; then
  code="x86_64"
else
  code=${arch}
fi

declare -a files=("s6-overlay-${code}.tar.xz" "s6-overlay-noarch.tar.xz" "s6-overlay-symlinks-noarch.tar.xz" "s6-overlay-symlinks-arch.tar.xz")
for file in "${files[@]}"
do
    echo "Behandler '${file}'"
    curl -Lso /tmp/${file} https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/${file}
    tar -C / -Jxpf /tmp/${file}
done

echo "S6-overlay installert"
