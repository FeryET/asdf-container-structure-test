<div align="center">

# asdf-container-structure-test [![Build](https://github.com/FeryET/asdf-container-structure-test/actions/workflows/build.yml/badge.svg)](https://github.com/FeryET/asdf-container-structure-test/actions/workflows/build.yml) [![Lint](https://github.com/FeryET/asdf-container-structure-test/actions/workflows/lint.yml/badge.svg)](https://github.com/FeryET/asdf-container-structure-test/actions/workflows/lint.yml)

[container-structure-test](https://github.com/GoogleContainerTools/container-structure-test) plugin for the [asdf version manager](https://asdf-vm.com).

</div>

# Contents

- [asdf-container-structure-test  ](#asdf-container-structure-test--)
- [Contents](#contents)
- [Dependencies](#dependencies)
- [Installation](#installation)
    - [Plugin](#plugin)
    - [Container Structure Test Package](#container-structure-test-package)
- [Contributing](#contributing)
- [License](#license)

# Dependencies

- `bash`, `curl`, `tar`, and [POSIX utilities](https://pubs.opengroup.org/onlinepubs/9699919799/idx/utilities.html).

# Installation

### Plugin

In order to install the plugin you should execute the following commands:

```shell
asdf plugin add container-structure-test
# or
asdf plugin add container-structure-test https://github.com/FeryET/asdf-container-structure-test.git
```

### Container Structure Test Package

After installing the plugin, you can use `asdf` to either install the package locally or globally via explicit version pinning.

```shell
# Show all installable versions
asdf list-all container-structure-test

# Install latest version
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
