FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        build-essential \
        make \
        gcc-mips-linux-gnu \
        binutils-mips-linux-gnu \
        gdb-multiarch \
        qemu-system-mips \
        qemu-system-common \
        ipxe-qemu \
        seabios \
        vgabios \
        screen \
        python3 \
        util-linux \
        ca-certificates \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /work

ENV QEMU_ROM_PATH=/usr/share/qemu:/usr/lib/ipxe/qemu:/usr/share/seabios:/usr/share/vgabios

CMD ["/bin/bash"]
