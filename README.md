# My Python project

<!--
TODO Update the main title and add a description that align with
     your project.
-->

## Getting started

### Once tasks

- Install [poetry](#): `sudo dnf install python3-poetry`
- Install [direnv](#): `sudo dnf install direnv`

### Frequent tasks

- Install dependencies: `make deps`
- Code at `hello_world`
- Unit test at `test`
- Apply format, run linter, and run unit tests by: `make all`
- Get help by: `make help`

**If you are using [toolbox.sh](https://github.com/little-engineer-2025/toolbox-sh)**

- Create file `.envrc` with something like:

```raw
# TODO Update the name for your toolbox
export TOOLBOX="my-project-dev"
```

- Create symlink to `.envrc`: `ln -svf .envrc .env`
- Allow file for direnv: `direnv allow`

> .env and .envrc files are ignored (repo and container).

## Acknowledgements

