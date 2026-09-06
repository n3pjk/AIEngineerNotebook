# Setting Up MATLAB/Octave<!-- omit in toc -->

[[Home](../../README.md) | [Back](README.md#language-selection)]

## Contents <!-- omit in toc -->

- [Setting Up MATLAB](#setting-up-matlab)
- [Installing Octave](#installing-octave)
  - [Linux](#linux)
  - [macOS](#macos)
- [Startup](#startup)
- [Octave Packages](#octave-packages)
- [VS Code Extensions](#vs-code-extensions)


## Setting Up MATLAB

**MATLAB** is a high-level programming language and interactive software environment used by engineers and scientists for numerical computation, data analysis, and algorithm development. The name MATLAB stands for **Matrix Laboratory**, because its core data element is an array or matrix rather than a single number. Developed by **MathWorks**, it is a proprietary environment that lets users write concise code to handle linear algebra, plot graphs, and create custom applications.

## Installing Octave

[[Home](../../README.md) | [Back](README.md#language-selection)]

**GNU Octave** is a free, open-source, high-level programming language whose syntax is mostly compatible with [MATLAB](#setting-up-matlab), making it a popular alternative. With built in 2- and 3-D graphics for data visualization, it runs on Windows, macOS, Linux, and BSD systems, offering both command line (CLI) and graphical (GUI) interfaces. It will be the environment we focus upon.

### Linux

You should update, and, possibly, upgrade, if necessary, they use your distribution-appropriate package manager to install Octave. The following is the installation command for Debian, Ubuntu and Linux Mint.

```bash
sudo apt update
sudo apt upgrade #if necessary
sudo apt install octave
```

### macOS

```bash
brew update
brew upgrade #if necessary
brew install octave
```

## Startup

After installation, you can start Octave with `octave --gui` or `octave -g`

All of the options and parameters for Octave can be seen using `octave --help`

## Octave Packages

No additional Octave packages are needed to work with the labs in this repo. You can get a list of packages available from the Octave Forge using `octave --eval "pkg list -forge"` from the command line, or by using `pkg list -forge` from within Octave.

## VS Code Extensions

The following VS Code Extensions are useful when working with MATLAB/Octave files:

* [Octave](https://marketplace.visualstudio.com/items?itemName=toasty-technologies.octave) by Toasty Technologies
* [Octave Debugger](https://marketplace.visualstudio.com/items?itemName=paulosilva.vsc-octave-debugger) by Paulo Silva - Debugging Octave and MATLAB code
* [Octave Execution](https://marketplace.visualstudio.com/items?itemName=LucasFA.octaveexecution) by LucasFA - Octave language execution and keybinding support
* [Octave Formatter](https://marketplace.visualstudio.com/items?itemName=tusindfryd.octave-formatter) by tusindfryd - Format Octave code

[[Top](#setting-up-matlaboctave) | [Back](README.md#language-selection) | [Home](../../README.md)]