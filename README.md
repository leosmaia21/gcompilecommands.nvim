# Compile Commands Generator for Neovim

This is a simple plugin to generate the `compile_commands.json` file.

## Overview

The main purpose of this plugin is to facilitate the generation of the `compile_commands.json` file in Neovim projects, when you don't have access to other tools like [bear](https://github.com/rizsotto/Bear). The `compile_commands.json` file is used by various development tools for static code analysis, auto-completion, and more.

## How to Use

To use this plugin, follow these simple steps:

1. Install this plugin in your Neovim environment using your preferred method (e.g., using a plugin manager like [lazy](https://github.com/folke/lazy.nvim)).

2. In your project file, open Neovim and run the `:Gcompilecommands` command. This will execute the `make` command in dry-run mode to generate the `compile_commands.json` file. Note that it will also run `make fclean` before generating the file.

3. After successful execution, the `compile_commands.json` file will be available for use by external tools.

## Contributions

Contributions are welcome! If you encounter issues, have improvements, or have ideas to make this plugin even more useful, feel free to open an [issue](https://github.com/leosmaia21/gcompilecommands.nvim/issues) or submit a [pull request](https://github.com/leosmaia21/gcompilecommands.nvim/pulls).

We hope this plugin makes generating the `compile_commands.json` file a straightforward and efficient task in your Neovim projects. Enjoy!
