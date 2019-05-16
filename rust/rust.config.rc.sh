# from Building instructions for ripgrep https://github.com/BurntSushi/ripgrep
RUSTFLAGS="-C target-cpu=native"
alias cargo-build="cargo build --release --features 'simd-accel'"
