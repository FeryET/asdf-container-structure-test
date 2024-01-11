<div align="center">

# asdf-container-structure-test [![Build](https://github.com/FeryET/asdf-container-structure-test/actions/workflows/build.yml/badge.svg)](https://github.com/FeryET/asdf-container-structure-test/actions/workflows/build.yml) [![Lint](https://github.com/FeryET/asdf-container-structure-test/actions/workflows/lint.yml/badge.svg)](https://github.com/FeryET/asdf-container-structure-test/actions/workflows/lint.yml)

[container-structure-test](https://github.com/GoogleContainerTools/container-structure-test) plugin for the [asdf version manager](https://asdf-vm.com).

</div>

# Contents

- [Dependencies](#dependencies)
- [Install](#install)
- [Contributing](#contributing)
- [License](#license)

# Dependencies

**TODO: adapt this section**

- `bash`, `curl`, `tar`, and [POSIX utilities](https://pubs.opengroup.org/onlinepubs/9699919799/idx/utilities.html).
- `SOME_ENV_VAR`: set this environment variable in your shell config to load the correct version of tool x.

# Install

Plugin:

```shell
asdf plugin add container-structure-test
# or
asdf plugin add container-structure-test https://github.com/FeryET/asdf-container-structure-test.git
```

container-structure-test:

```shell
# Show all installable versions
asdf list-all container-structure-test

# Install specific version
asdf install container-structure-test latest

# Set a version globally (on your ~/.tool-versions file)
asdf global container-structure-test latest

# Now container-structure-test commands are available
container-structure-test --help
```

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to
install & manage versions.

# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/FeryET/asdf-container-structure-test/graphs/contributors)!

# License

See [LICENSE](LICENSE) © [Farhood Etaati](https://github.com/FeryET/)
