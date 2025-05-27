![Logo](https://github.com/AbedChouaib/IVEA/blob/main/resources/IVEA%20logo%20x256.png)

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.15498139.svg)](https://doi.org/10.5281/zenodo.15498139)

# About

Intelligent Vesicle Exocytosis Analysis Platform (IVEA) is an open-source Fiji plugin that employs artificial intelligence to detect and analyze exocytosis.
[Read the paper](https://www.biorxiv.org/content/10.1101/2024.08.02.606323v1)

## Table of Contents

* [Installation](#installation)
* [Usage](#usage)
* [Features](#features)
* [Python Setup](#python-setup)

# Installation

* Download latest plugin: [IVEA v2.3](https://github.com/AbedChouaib/IVEA/releases/tag/IVEA_v2.3)
* Download plugin used in paper (v2.1.1): [IVEA v2.1.1](https://github.com/AbedChouaib/IVEA/releases/tag/IVEA_v2.1.1)
* Get source code: [Source code](https://cloud.hiz-saarland.de/s/eEaF4A8eWpr88Qf)
* Download Fiji: [ImageJ Fiji](https://imagej.net/software/fiji/)
* Download test data: [Test data](https://cloud.hiz-saarland.de/s/zwipttdc6ySCLzC)
* Install plugin by dragging the JAR into ImageJ or copying it to the `plugins/` directory.

# Usage

* Get the manual: [IVEA Manual v2.0 (PDF)](https://github.com/AbedChouaib/IVEA/blob/main/resources/IVEA%20Manual_v2.0.pdf)
* Launch IVEA from ImageJ under "Plugins"
* Select one of the three modes: "Hotspot Area", "Fixed Event", "Non-Fixed Event"
* Choose the data import type: Video, Directory, or Image Sequence (experimental)
* Press Start to begin analysis

> GPU is optional for analysis, but required for training.

# Features

* Vision Transformer + LSTM architecture for robust event detection
* Fully automated, "plug and play" design
* User-friendly GUI
* Comes with pretrained models
* Accepts any resolution or stack length
* Blazing fast analysis: \~seconds per video (e.g., 256x256, 3000 frames)

# Python Setup

## Project Environment

**Project Name**: IVEA
**Python Version**: 3.8.10
**TensorFlow Version**: 2.10.1 (CUDA 11.2 / cuDNN 8.1.1)

Contains:

* `IVEA_main/` folder with all training scripts
* `requirements.txt` – core dependencies (excluding TF)
* `TensorFlow_Libs.txt` – pinned versions for TF 2.10.1 compatibility

## <img src="https://github.com/AbedChouaib/IVEA/blob/main/resources/anaconda-icon.png" width="24" style="vertical-align:middle;"/> Recommended Setup

We recommend using **Anaconda**:

```bash
conda create -n IVEA python=3.8.10
conda activate IVEA
```

Alternatively with `venv`:

```bash
python -m venv venv
# Windows:
venv\Scripts\activate
# macOS/Linux:
source venv/bin/activate
```

## 📦 Installing Dependencies

Install base packages:

```bash
pip install -r requirements.txt
```

Install TensorFlow stack:

```bash
pip install -r TensorFlow_Libs.txt
```

## <img src="https://github.com/AbedChouaib/IVEA/blob/main/resources/nvidia_64.png" width="24" style="vertical-align:middle;"/> GPU Acceleration & System Requirements

Ensure your system has:

* CUDA 11.2
* cuDNN 8.1.1
* Compatible NVIDIA driver

## <img src="https://github.com/AbedChouaib/IVEA/blob/main/resources/VScode_64.png" width="24" style="vertical-align:middle;"/> Using with VS Code

```bash
cd path/to/IVEA/IVEA_main
code .
```

Open Command Palette (Ctrl+Shift+P), select **Python: Select Interpreter**, and choose:

* `IVEA` (Conda env), or
* `venv` (local virtualenv)

## ▶️ Running IVEA

Launch the training GUI:

```bash
python IVEA_main.py
```

## 🔧 Configuration Files

Located in the `settings/` folder:

* `ivea_default_config.json`
* `ivea_GranuData_config.json`
* `ivea_NeuroData_config.json`

> Changing the model type automatically loads the matching config.
> For new sessions, defaults are used unless changed manually.
