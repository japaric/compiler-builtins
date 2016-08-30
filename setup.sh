set -ex

install_deps() {
    apt-get update

    apt-get install -y --no-install-recommends \
            `# gist gem` ruby \
            `# rustup` ca-certificates curl file \
            `# xargo` libcurl4-openssl-dev libssh2-1 \
            `# aarch64-unknown-linux-gnu` gcc-aarch64-linux-gnu libc6-dev-arm64-cross \
            `# arm*-unknown-linux-gnueabi` gcc-arm-linux-gnueabi libc6-dev-armel-cross \
            `# arm*-unknown-linux-gnueabihf` gcc-arm-linux-gnueabihf libc6-dev-armhf-cross \
            `# i*86-unknown-linux-gnu` libc6-dev-i386 lib32gcc-5-dev \
            `# mips-unknown-linux-gnu` gcc-mips-linux-gnu libc6-dev libc6-dev-mips-cross \
            `# mipsel-unknown-linux-gnu` gcc-mipsel-linux-gnu libc6-dev libc6-dev-mipsel-cross \
            `# powerpc-unknown-linux-gnu` gcc-powerpc-linux-gnu libc6-dev-powerpc-cross \
            `# powerpc64-unknown-linux-gnu` gcc-powerpc64-linux-gnu libc6-dev libc6-dev-ppc64-cross \
            `# powerpc64le-unknown-linux-gnu` gcc-powerpc64le-linux-gnu libc6-dev libc6-dev-ppc64el-cross \
            `# thumbv*-none-eabi` gcc-arm-none-eabi \
            `# x86_64-unknown-linux-gnu` gcc libc6-dev
}

install_gist() {
    gem install gist -v 4.5.0
}

install_rust_stuff() {
    curl https://sh.rustup.rs -sSf | sh -s -- -y
    source ~/.cargo/env
    curl -sf \
         "https://raw.githubusercontent.com/japaric/rust-everywhere/master/install.sh" | \
        bash -s -- --from japaric/xargo --at /root/.cargo/bin --tag 0.1.5
    rustup toolchain remove stable
}

cleanup() {
    rm /setup.sh
}

main() {
    install_deps
    install_gist
    install_rust_stuff
    cleanup
}

main
