# Top-k Maximum Margin Clustering (TMMC)

This repository contains a simple Matlab implementation of our paper TMMC.

## 1. Overview

TMMC is a maximum margin clustering approach based on the Top-k loss and deals with the datasets with overlapping or similar clusters. Different from the existing maximum margin clustering approaches, TMMC allows k predictions for each sample's ground-truth label and does not penalize k − 1 prediction mistakes. In this way, the tolerance of the MMC model is increased, and the error caused by the ambiguity of the similar clusters is decreased.

## 2. Usage

- Prepare the data:

  - The Yale dataset is downloaded from [Github](https://github.com/guanyuezhen/CGL)¹.
  - The Flower dataset is downloaded from [Github](https://github.com/youweiliang/ConsistentGraphLearning)².
  - The Caltech dataset is downloaded from [Caltech website](https://data.caltech.edu/records/20086).
  - The Scene dataset is downloaded from [Github](https://github.com/guanyuezhen/CGL)³.
  - The Places dataset is downloaded from [Github](https://github.com/guanyuezhen/CGL)⁴.
  - The NUS-WIDE dataset is downloaded from [NUS-WIDE website](https://lms.comp.nus.edu.sg/wp-content/uploads/2019/research/nuswide/NUS-WIDE.html).

- Prerequisites for Matlab:
  - Test on Matlab R2022a

- Conduct clustering
  - Run the file "TopK_MMC.m"

## 3. Citation

Please cite our paper if you find the work useful:  

@article{xiao2025_TMMC,  
author={Yanshan Xiao, Chaoyu Chen, Qiongli Zheng, Bo Liu, and Zhifeng Hao},  
journal={IEEE Transactions on Neural Networks and Learning Systems},  
title={Top-k Maximum Margin Clustering},  
year={2025}  
}
