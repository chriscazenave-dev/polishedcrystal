# Pokémon Polished Crystal web player

This directory is a static site for playing the built Game Boy Color ROM with
[EmulatorJS](https://emulatorjs.org/). It is intended to be deployed directly
from `web/` to Vercel.

## Prepare the ROM

From the repository root, build the ROM and copy it into the static site:

```sh
make
web/prepare.sh
```

`prepare.sh` runs `make` automatically if the root ROM is missing. The copied
`.gbc` file is ignored by Git because the repository's root `.gitignore`
ignores compiled ROMs.

## Deploy

Run Vercel from this directory:

```sh
cd web
vercel deploy
```

The site has no framework or bundler; Vercel serves the files as static assets.
