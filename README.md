# IVEA
![Logo](https://github.com/AbedChouaib/IVEA/blob/main/resources/IVEA%20logo%20x256.png)

# About
Intelligent Vesicle Exocytosis Analysis Platform (IVEA) is an open-source Fiji plugin that employs artificial intelligence to detect and analyze exocytosis.
[paper](https://www.biorxiv.org/content/10.1101/2024.08.02.606323v1)

## Table of Contents
- [Installation](#installation)
- [Usage](#usage)
- [Features](#features)

# Installation
- Download latest plugin: [Get latest plugin](https://github.com/AbedChouaib/IVEA/releases/tag/IVEA_v1.1)
- Download plugin (paper results version): [Get plugin](https://github.com/AbedChouaib/IVEA/releases/tag/v1.0.0)
- Get source code: [Source code](https://cloud.hiz-saarland.de/s/zwipttdc6ySCLzC)
- Download Fiji: [ImageJ Fiji](https://imagej.net/software/fiji/)
- Download test data: [Test data](https://cloud.hiz-saarland.de/s/zwipttdc6ySCLzC)
- Drag and drop IVEA jar file into ImageJ, then restart ImageJ. (or copy paste it to ImageJ plugin directory)

# Usage
- Run IVEA via the ImageJ menu, located under "Plugin".
- IVEA offers three different analysis types, each accessible via a dedicated tab: "Hotspot Area", "Fixed Event", and "Non-Fixed Event".
- Select the appropriate tab based on the nature of the analysis. (note: "Fixed Event" analysis doesn't work on the "Non-Fixed Event").
- Select the import type in the check box: Video, Video directory or Image sequence (experimental!).
- Import your data, then press start.
- A GPU is not required for the analysis phase, whereas it is essential for the training phase. 

# Features
-  Intelligent software which employ Vision Transformer network and LSTM network for exocytosis detectionin wide range of cells.
-  Open source "plug and play" fully automated software.
-  user friendlu GUI.
-  Pretrained models available within IVEA.
-  Trainable software.
-  Super fast, down to few seconds per video analysis. (256x256, 3000 frames)
