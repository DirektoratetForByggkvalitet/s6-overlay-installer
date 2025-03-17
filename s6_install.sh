#!/bin/sh

if [ "$1" != "--doit" ]; then
  if type zsh > /dev/null; then 
    exec zsh -- "$0" --doit
  elif type bash > /dev/null; then
    exec bash -- "$0" --doit
  elif type ksh > /dev/null; then
    exec ksh -- "$0" --doit
  else
    echo "Bash, ksh or zsh required"
    exit 127
  fi
fi

: "${S6_OVERLAY_VERSION:=3.2.0.2}"
: "${TARGETARCH:=amd64}"
echo "Installing S6-overlay, v${S6_OVERLAY_VERSION}, for ${TARGETARCH}"
# Endrer på filnavnet etter arkitektur.
if [ "$TARGETARCH" = "arm64" ]; then
  code="aarch64"
elif [ "$TARGETARCH" = "amd64" ]; then
  code="x86_64"
else
  code=${TARGETARCH}
fi

declare -a files=("s6-overlay-${code}.tar.xz" "s6-overlay-noarch.tar.xz" "s6-overlay-symlinks-noarch.tar.xz" "s6-overlay-symlinks-arch.tar.xz")
for file in "${files[@]}"
do
    echo "Processing '${file}'"
    curl -Lso /tmp/${file} https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/${file}
    tar -C / -Jxpf /tmp/${file}
    rm /tmp/${file}
done

echo "S6-overlay installed"
exit 0
