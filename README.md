# ADE Homebrew

This thin volume will give you access to the power of Homebrew in a ade
environment. The key idea is that all the packages are being download into the
$HOME/.linuxbrew directory, which is located at the ADE_HOME root, and
therefore persistent between builds (unless you wipe out ADE_HOME of course)

### How to use

- In the `.aderc` file add, `ignaciovizzo/ade-brew:latest` to the list of `ADE_IMAGES`: e.g.

```sh
export ADE_IMAGES="
  <ADE_BASE_IMAGE>:latest
  ignaciovizzo/ade-brew:latest
"
```

Once you are having fun with your ade environment you can use brew as you would always do:

```sh
$ brew install neovim
```
