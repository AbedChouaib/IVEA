![Logo](https://github.com/AbedChouaib/IVEA/blob/main/resources/IVEA%20logo%20x256.png)

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.15498139.svg)](https://doi.org/10.5281/zenodo.15498139)    [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.15498139.svg)](https://doi.org/10.5281/zenodo.13153017)

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

> GPU is required for new training but not for refinement.

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

We recommend using **Anaconda**, especially for users new to programming.

### 🔹 Step-by-step Guide

1. Download and install Anaconda from [https://www.anaconda.com](https://www.anaconda.com)
2. Open the Anaconda Prompt (Windows) or terminal (Mac/Linux)
3. Create and activate the environment:

```bash
conda create -n IVEA python=3.8.10
conda activate IVEA
```

4. Download or clone the project from GitHub:

```bash
git clone https://github.com/AbedChouaib/IVEA.git
cd IVEA/Python\ Code/IVEA_main
```

5. Install project dependencies:

```bash
pip install -r requirements.txt
pip install -r TensorFlow_Libs.txt
```

6. Open the project using your preferred interface:

   * `jupyter notebook` – to run interactively in notebooks
   * `jupyter lab` – modern notebook environment
   * `spyder` – MATLAB-like IDE included with Anaconda
   * `code .` – if VS Code is installed

> These interfaces are beginner-friendly and allow inspection of results, training behavior, and debugging.

---

## <img src="https://github.com/AbedChouaib/IVEA/blob/main/resources/nvidia_64.png" width="24" style="vertical-align:middle;"/> GPU Acceleration & System Requirements

Ensure your system has:

* CUDA 11.2
* cuDNN 8.1.1
* Compatible NVIDIA driver

GPU is not required for analysis but is **highly recommended** for training.

## <img src="https://github.com/AbedChouaib/IVEA/blob/main/resources/VScode_64.png" width="24" style="vertical-align:middle;"/> Using with VS Code

### 💡 VS Code Guide for Beginners

1. Download and install [VS Code](https://code.visualstudio.com/)
2. Open Anaconda Prompt or terminal and run:

```bash
cd path/to/IVEA/Python\ Code/IVEA_main
code .
```

3. VS Code will open the folder. Now:

   * Press `Ctrl+Shift+P` → **Python: Select Interpreter**
   * Choose `conda` environment named `IVEA` or the `venv` you created

4. To run a Python script:

   * Open any `.py` file
   * Click the ▶️ Run button in the top right, or right-click → Run Python File

5. To run Jupyter Notebooks:

   * Install the Jupyter VS Code extension if prompted
   * Open `.ipynb` notebooks directly and run cells interactively

> This setup is ideal for users who want to inspect variables, tweak parameters, and visualize training output.

---

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
