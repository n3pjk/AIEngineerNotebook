# Setting Up Julia<!-- omit in toc -->

[[Home](../../README.md) | [Back](README.md#language-selection)]

## Contents<!-- omit in toc -->

- [Installing Julia](#installing-julia)
- [Starting Julia](#starting-julia)
- [Configuring Julia](#configuring-julia)
- [Pluto Notebooks](#pluto-notebooks)
  - [Install](#install)
  - [Start Pluto](#start-pluto)
- [VS Code Extensions](#vs-code-extensions)

## Installing Julia

[Julia](https://julialang.org) is installed on both MacOS and Linux the same way. Run the following command in your terminal.

```bash
curl -fsSL https://install.julialang.org | sh
```

This will install the latest stable version of Julia, as well as the `juliaup` tool. If you prefer to manually install using a GUI-based installer, see the [Manual Downloads](https://julialang.org/downloads/manual-downloads/) page.

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

* Julia by julialang - Julia Language Support
* Markdown Julia by colinfang - Markdown fenced code block syntax highlighting for Julia
* Julia Formatter by 0h7z - A formatter for the Julia language
* Embedded Python in Julia by haberdashPI - Syntax highlighting for Python code embedded via PyCall.jl
* Embedded MATLAB in Julia by haberdashPI - Syntax highlighting for MATLAB code embedded via MATLAB.jl
* Julia2MATLAB by SamuelSmthSmth - Convert between Julia and MATLAB code
* Advanced Pluto Notebook for VSCode by Παναγιώτης Γεωργακόπουλος - VSCode extension for Julia Pluto notebook

[[Top](#setting-up-julia) | [Back](README.md#language-selection) | [Home](../../README.md)]