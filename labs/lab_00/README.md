# Lab 0 - Tooling Setup

[[Home](../../README.md)]

## Contents

- [Lab 0 - Tooling Setup](#lab-0---tooling-setup)
  - [Contents](#contents)
  - [Operating Systems](#operating-systems)
    - [Linux](#linux)
      - [Package Managers](#package-managers)
    - [MacOS](#macos)
      - [Installing Homebrew](#installing-homebrew)
      - [Formulae, Taps and Casks](#formulae-taps-and-casks)
    - [Windows](#windows)
  - [GitHub](#github)
    - [Extensions](#extensions)
  - [VS Code](#vs-code)
    - [Extensions](#extensions-1)
  - [Language Selection](#language-selection)

## Operating Systems

### Linux

[[Top](#lab-0---tooling-setup) | [Home](../../README.md)]

Linux is the dominant platform in AI and machine learning for good reason. Nearly every major AI framework, like PyTorch, TensorFlow, JAX, is developed and tested on Linux first, which means you get the best driver support, the fewest compatibility quirks, and the fastest access to new features. NVIDIA's CUDA ecosystem is most mature here: drivers, cuDNN, NCCL, and container runtimes, like nvidia-docker, all work cleanest on Linux. If you're training large models on bare metal or in the cloud, you're almost certainly on Linux.

Package management is also a genuine advantage. Whether it is language-dependent manager like conda or pip, or distribution-specific ones like apt or dnf, system-level dependency resolution are well-understood on Linux, and tooling like Docker and Kubernetes was built with Linux as the primary target. Reproducibility, which is critical in research, is much easier to achieve.

High Performance Computing (HPC) and cloud environments matter too. Amazon Web Services (AWS), Google Cloud Platform (GCP), and Azure GPU instances all run Linux. When your development environment matches your production environment, debugging and deployment friction drops dramatically.

The setup cost is real, especially for newcomers. Driver conflicts, particularly CUDA versions, desktop environment overhead, and the need to configure things manually can eat hours. There's no polished integrated experience out of the box. You must assemble one. To that end, Linux's package managers vary depending on the distribution you are using.

#### Package Managers

The major package managers and associated distributions are:

* `apt` (Debian, Ubuntu, Linux Mint):

  ```bash
  sudo apt update
  sudo apt install [package-name]
  ```

  or as a single command:

  ```bash
  sudo apt update -y && sudo apt install [package-name]
  ```

* `dnf` or `yum` (Fedora, RHEL):

  ```bash
  sudo dnf install [package-name]
  ```

* `pacman` (Arch):

  ```bash
  sudo pacman -S [package-name]
  ```

* Universal

  Sandboxed packages incorporate the application and dependencies, greatly
  reduces the need and complexity of managing related packages and makes it
  easier to try different versions side by side. Popular managers include

  * Flatpak: `flatpak install [app]`
  * Snap: `snap install [app]`

### MacOS

[[Top](#lab-0---tooling-setup) | [Home](../../README.md)]

Apple Silicon (M1/M2/M3/M4) changed the calculus significantly. The unified memory architecture means the GPU and CPU share a large, fast memory pool. An M3 Max with 128GB of unified memory can run inference on genuinely large models that would require a dedicated GPU to match. MLX, which is Apple's machine learning framework, is optimized specifically for this architecture and is surprisingly capable for fine-tuning and local inference. Unfortunately, maxing out Apple Silicon memory is expensive. You hit the ceiling faster than with a purpose-built GPU workstation.

macOS is a first-class Unix environment, built on top of Darwin, the open-source layer surrounding the Mach kernel from BSD Unix. The shell, Python tooling, [Homebrew](https://brew.sh), and developer ergonomics are all strong. For practitioners who want a polished OS that doesn't fight them, it's a comfortable daily driver.

Unlike Linux, CUDA doesn't exist on macOS. That's a hard wall. If your workflow depends on CUDA, and a lot of production machine learning does, you'll be running in the cloud, or hitting a compatibility layer that doesn't cover everything. Metal Performance Shaders (Metal/MPS) is the GPU compute layer on Apple Silicon. PyTorch support for it has improved, but it lags CUDA in both coverage and maturity.

#### Installing Homebrew

To install packages in MacOS, you will first need to install [Homebrew](https://brew.sh), which, as of this writing, requires you to simply run

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

#### Formulae, Taps and Casks

Homebrew packages are **formulae** and **casks**. Formulae are package definitions that build command-line tools, libraries and services from upstream source code. Other package repositories are called **taps**. They let anyone maintain their own formulae and casks outside the officially supported repositories. Read how [tap trust](https://docs.brew.sh/Tap-Trust) works before using non-official taps. **Casks** are package definitions that install upstream pre-built binaries such as applications, fonts and plugins. Some casks auto-update outside Homebrew, so use `brew upgrade --greedy` if you want Homebrew to update them too.

A typical package installation consists of the following sequence of commands

```bash
brew update
brew upgrade
brew install [package-name]
```

### Windows

[[Top](#lab-0---tooling-setup) | [Home](../../README.md)]

Windows has improved meaningfully for AI development, largely through Windows Subsystem for Linux (WSL2). Running a full Ubuntu environment inside Windows, with GPU passthrough via CUDA on WSL2, is now a real and workable option. Many developers run their machine learning stacks entirely inside WSL2 and barely touch the Windows host. For practitioners already on Windows, such as enterprise and educational settings, this lowers the switching cost considerably. DirectML also extends GPU acceleration to AMD and Intel GPUs that CUDA doesn't support, which matters for consumer hardware diversity.

Unfortunately, WSL2, while good, adds a layer of abstraction that occasionally surfaces friction,like networking quirks, filesystem performance penalties when crossing the WSL/Windows boundary, and occasional driver interactions that don't exist on native Linux. It's better than it was, but not seamless. Outside of WSL2, native Windows Python environments can be a dependency management nightmare: path issues, build tool requirements (Visual C++ runtimes, etc.), and packages that assume Unix paths or shell behavior. Containerization helps, but adds its own complexity.

Ultimately, the best scenario for Windows AI development is to find a way to run a Linux environment within it. Therefore, we will not place any emphasis on Windows, focusing on Linux instead.

## GitHub

[[Top](#lab-0---tooling-setup) | [Home](../../README.md)]

Before you can clone this repo down to your desktop, you will need to install
the GitHub tools.

### Extensions

The following VS Code Extensions are useful when working with GitHub and its repositories:

* Git History by Don Jayamanne - View git log, file history, compare branches or commits
* GitHub Actions by GitHub - GitHub Actions workflows and runs for github.com repos in VS Code
* GitHub Codespaces by GitHub - Your instant dev environment
* GitHub Copilot modernization by Microsoft - Upgrade and migrate your applications to Azure
* GitHub Pull Requests by GitHub - Pull Request and Issue Provider for GitHub
* GitHub Repositories by GitHub - Remotely browse and edit any GitHub repository
* GitLens - Git supercharged by GitKraken - Supercharge Git within VS Code

## VS Code

[[Top](#lab-0---tooling-setup) | [Home](../../README.md)]

### Extensions

The following VS Code Extensions are useful across all languages:

* Code Spell Checker by Street Side Software - Spelling checker for source code
* Data Wrangler by Microsoft - Data viewing, cleaning and preparation for tabular datasets
* indent-rainbow by oderwat - Makes indentation easier to read
* Markdown All in One by Yu Zhang - All you need to write Markdown (It's not, but does a lot!)
* Markdown PDF by yzane - Convert Markdown to PDF
* Markdown Preview Mermaid by Matt Bierner - Adds Mermaid diagram and flowchart support to VS Code's builtin Markdown preview
* Print by PD Consulting - Prints rendered Markdown and colored code
* Rainbow CSV by mechatroner - Highlight CSV and TSV files. Run SQL-like queries
* Trailing Spaces by Shardul Mahadik - Highlights whitespace at the end of a line
* Vim by vscodevim - Vim emulation for Visual Studio Code

## Language Selection

- [Julia](julia.md)
- [MATLAB/Octave](octave.md)
- [Python](python.md)

[[Top](#lab-0---tooling-setup) | [Home](../../README.md)]