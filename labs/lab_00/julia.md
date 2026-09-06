# Setting Up Julia<!-- omit in toc -->

[[Home](../../README.md) | [Back](README.md#language-selection)]

## Contents<!-- omit in toc -->

- [Installing Julia](#installing-julia)
  - [Installing Packages](#installing-packages)
- [Starting Julia](#starting-julia)
- [Configuring Julia](#configuring-julia)
- [Pluto Notebooks](#pluto-notebooks)
  - [Install](#install)
  - [Start Pluto](#start-pluto)
- [VS Code Extensions](#vs-code-extensions)

## Installing Julia

[Julia](https://julialang.org) is installed on both macOS and Linux the same way. Run the following command in your terminal.

```bash
curl -fsSL https://install.julialang.org | sh
```

This will install the latest stable version of Julia, as well as the `juliaup` tool. If you prefer to manually install using a GUI-based installer, see the [Manual Downloads](https://julialang.org/downloads/manual-downloads/) page.

### Installing Packages

The easiest way to install Julia packages is to switch to package mode in the REPL. To do this, simply enter the right square bracket, '`]`'. The prompt should change from standard mode prompt (`julia>`), to the package mode prompt (`pkg>`). Add a package by entering the command, `add [package_name]`, at the prompt.

Useful packages to add:

- IJulia - Downloads the Julia Kernel for Jupyter notebooks
- Pluto - Installs a more advanced notebook infrastructure specifically for Julia

## Starting Julia

You can run Julia in REPL mode (Read-Eval-Print Loop) by simply entering `julia` in your terminal. If you want to run a script non-interactively, use

```bash
julia [script.jl]
```

## Configuring Julia

This is done with `juliaup`. See `juliaup --help` for how to configure installed versions.

## Pluto Notebooks

[[Top](#setting-up-julia) | [Back](README.md#language-selection) | [Home](../../README.md)]

### Install

[Pluto Notebook](https://pluto.org) does for Julia, what Jupyter Notebook does for Python. Install Pluto Notebook by starting the Julia terminal then run

```julia
import Pkg; Pkg.add("Pluto")
```

### Start Pluto

In the Julia terminal, run

```julia
import Pluto; Pluto.run()
```

## VS Code Extensions

* [Julia](https://marketplace.visualstudio.com/items?itemName=julialang.language-julia) by julialang - Julia Language Support
* [Julia Formatter](https://marketplace.visualstudio.com/items?itemName=0h7z.vscode-julia-format) by 0h7z - A formatter for the Julia language
* [JuliaHub Authentication](https://marketplace.visualstudio.com/items?itemName=JuliaComputing.juliahub-vscode-auth) by JuliaHub Inc - Helper extension for authentication against JuliaHub servers
* [Markdown Julia](https://marketplace.visualstudio.com/items?itemName=colinfang.markdown-julia) by colinfang - Markdown fenced code block syntax highlighting for Julia
* [Embedded MATLAB in Julia](https://marketplace.visualstudio.com/items?itemName=haberdashPI.matlab-in-julia) by haberdashPI - Syntax highlighting for MATLAB code embedded via MATLAB.jl
* [Embedded Python in Julia](https://marketplace.visualstudio.com/items?itemName=haberdashPI.python-in-julia) by haberdashPI - Syntax highlighting for Python code embedded via PyCall.jl
* [Advanced Pluto Notebook for VSCode](https://marketplace.visualstudio.com/items?itemName=juliapluto-pankgeorg.advanced-vscode-extension) by Παναγιώτης Γεωργακόπουλος - VSCode extension for Julia Pluto notebook

[[Top](#setting-up-julia) | [Back](README.md#language-selection) | [Home](../../README.md)]