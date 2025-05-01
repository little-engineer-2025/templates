FROM docker.io/fedora:42 as builder
RUN dnf install -y cargo
WORKDIR /workspace
COPY . .
RUN cargo build --release
RUN find target

FROM docker.io/fedora:42
# TODO Update this according to the output generated
COPY --from=builder /workspace/target/release/rust-application-dev /usr/local/bin/rust-application-dev
