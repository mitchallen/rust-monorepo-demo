rust-monorepo-demo
==

## Related article

* [Rust Monorepo Setup (Cargo Workspaces, Mac)](https://scriptable.com/rust/rust-monorepo-cargo-workspaces-setup)

## Usage

### Build everything

```sh
make
```

### Run the first package

```sh
 make run PROJECT=alpha_app
```

## Run the second package

```sh
 make run PROJECT=beta_app
```

## Rebuild

```sh
make clean
make
```


