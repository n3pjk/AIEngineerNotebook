# Setting Up Python<!-- omit in toc -->

[[Home](../../README.md) | [Back](README.md#language-selection)]

## Contents<!-- omit in toc -->

- [Python Version](#python-version)
- [Package Management](#package-management)
  - [Installing `uv`](#installing-uv)
  - [Initialize Project](#initialize-project)
  - [Create Virtual Environment](#create-virtual-environment)
    - [Activate Virtual Environment](#activate-virtual-environment)
    - [Deactivate Virtual Environment](#deactivate-virtual-environment)
- [Jupyter Notebooks](#jupyter-notebooks)
- [VS Code Extensions](#vs-code-extensions)

## Python Version

[[Top](#setting-up-python) | [Back](README.md#language-selection) | [Home](../../README.md)]

One should not use the latest version as it typically undergoing its shakedown, may exhibit inconsistencies, and will not be supported across all packages, as is the next most recent version. Therefore, it is recommended to run two versions behind the latest release. As of this writing, version 3.13 is the recommended, with 3.15 being the latest.

## Package Management

[[Top](#setting-up-python) | [Back](README.md#language-selection) | [Home](../../README.md)]

`pip` has been the gold standard for Python package management, but `uv` surpasses `pip` in performance and functionality. It can even manage Python versions. Written in Rust, it is many times faster than `pip`.

### Installing `uv`

Both macOS and Linux install `uv` in the same manner. Run

```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
```

### Initialize Project

To initialize a new Python project, use

```bash
uv init --python 3.13
```

This creates the [`pyproject.toml`](https://pydevtools.com/handbook/reference/pyproject.toml/) file, introduced by PEP 518 in 2016, and extended in by PEP 621 in 2020, is the standard Python project configuration file, capturing project metadata, build-system requirements, and third-party tool configuration. Note that you can specify what version of Python is recommended for your project.

### Create Virtual Environment

To create a virtual environment for your project, run

```bash
uv venv --python 3.13 .venv
```

This creates a virtual environment, stored in `.venv`.

#### Activate Virtual Environment

To start using your virtual environment, assuming it is in `.venv` and your are currently in the root directory of your project, run

```bash
source ./.venv/bin/activate
```

This activates your virtual environment. Any Python packages added from this point forward will be added to your virtual environment, not your base system. This allows you to maintain a specific set of package versions for your project, and avoids conflict with other project's requirements.

#### Deactivate Virtual Environment

Simply run `deactivate` to stop using the virtual environment.

## Jupyter Notebooks

[[Top](#setting-up-python) | [Back](README.md#language-selection) | [Home](../../README.md)]

Jupyter notebooks are very useful fo
## VS Code Extensions

[[Top](#setting-up-python) | [Back](README.md#language-selection) | [Home](../../README.md)]

- [Jupyter](https://marketplace.visualstudio.com/items?itemName=ms-toolsai.jupyter) by Microsoft - Jupyter notebook support
- [JupyterHub](https://marketplace.visualstudio.com/items?itemName=ms-toolsai.jupyter-hub) by Microsoft - Support for connecting to Jupyter Hub
- [Jupyter Keymap](https://marketplace.visualstudio.com/items?itemName=ms-toolsai.jupyter-keymap) by Microsoft - Jupyter keymaps for notebooks
- [Jupyter Notebook Renderers](https://marketplace.visualstudio.com/items?itemName=ms-toolsai.jupyter-renderers) by Microsoft - Renderers for Jupyter Notebooks (like gif, png, svg, jpeg, etc.)
- [Jupyter Cell Tags](https://marketplace.visualstudio.com/items?itemName=ms-toolsai.vscode-jupyter-cell-tags) by Microsoft - VS Code support for Jupyter Cell Tags
- [Jupyter PowerToys](https://marketplace.visualstudio.com/items?itemName=ms-toolsai.vscode-jupyter-powertoys) by Microsoft - Experimental feature for Jupyter notebooks
- [Jupyter Slide Show](https://marketplace.visualstudio.com/items?itemName=ms-toolsai.vscode-jupyter-slideshow) by Microsoft - VS Code support for Jupyter Slide Show
- [Pylance](https://marketplace.visualstudio.com/items?itemName=ms-python.vscode-pylance) by Microsoft - A performant, feature-rich language server for Python
- [Python](https://marketplace.visualstudio.com/items?itemName=ms-python.python) by Microsoft - Python language support
- [Python Debugger](https://marketplace.visualstudio.com/items?itemName=ms-python.debugpy) by Microsoft - Python Debugger extension using debugpy
- [Python Environments](https://marketplace.visualstudio.com/items?itemName=ms-python.vscode-python-envs) by Microsoft - Provides a unified python environment experience
- [Ruff](https://marketplace.visualstudio.com/items?itemName=charliermarsh.ruff) by Astral Software - Supports the Ruff linter and formatter for Python

[[Top](#setting-up-python) | [Back](README.md#language-selection) | [Home](../../README.md)]