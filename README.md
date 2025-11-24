# BINACONN3D-MXENES

[![DOI](https://zenodo.org/badge/DOI/10.1234/zenodo.XYZ.svg)](https://doi.org/10.1234/zenodo.XYZ)

[![Dataset DOI](https://img.shields.io/badge/Figshare-10.6084/m9.figshare.30696251-blue)](https://doi.org/10.6084/m9.figshare.30696251)


MATLAB codes and data for the paper: M.-T. Passia, Y. Zhao, H. Wang, and S.A. Cummer, "Synthesis of broadband multilayer metamaterial absorbers based on spatially-variable 3D-printed structures and MXenes", Phys.Rev.Appl., DOI: https://doi.org/10.1103/8q6s-zg6y 
See the paper for more information.

This project has received funding from the European Union’s Horizon 2020 research and innovation programme under the Marie Sklodowska-Curie grant agreement No.101146306. The MSCA Global Postdoctoral Fellowship project is named MILLISURF.

## Requirements
- MATLAB with a version of 2022b or later with RFtoolbox 
- COMSOL Multiphysics 6.1 with MATLAB

### LFS if cloning this repository
- If you download the zip file, you will download the data files of LFS type automatically.
- If you clone this repository on your local machine, you do not automatically get the data files of LFS type. Make sure that you (i) Install Git LFS and (ii) Enable LFS for your Git setup 

```bash
git lfs install
``` 

before cloning the repository.


## Prerequisites

In order to run the script 
```bash 
Read_and_simulate_binary_MMAs.m
```
you need to download the mph (COMSOL) files from [link](...)
and store them with their original name under `comsol-files`, for example:

```bash
comsol-files/MMA_MXene_manufacturable8_done.mph
```
In order to also run the COMSOL Multiphysics .mph file 
```bash
Seven_materials_S_parameters.mph
```
you also need to download the mph (COMSOL) files from [link](...)
The .mph file `Seven_materials_S_parameters.mph` contains the FEM simulation of the optimized MMA with seven materials. The output of this file is `A_7materials.txt` in subfolder `comsol-files/Output_data`.

## Usage

# BINACONN 3D matlab codes
The BINACONN3D matlab code is located in the `matlab/BINACONN3D` folder.
- The user should execute main.m 
- The code takes as input a 3D array of size 48X22X7 which corresponds to the complex dielectric constant of each cell for a device with seven material levels.  The complex dielectric constant of the optimized device with seven materials, reported in the paper, is saved at the folder `matlab/BINACONN3D/Input_data`as 
```bash
e_discr_7materials.mat
```
- Each manufacturable subcomponents is saved in the folder `Output_data_live`
- The BINACONN3D uses randomization to select which cells are selected within a component.  In the `main.m` file in line 162 we set the BINACONN3D method to run 8 times, to produce 8 different manufacturable subcomponents. 
- Due to the randomization process, each time the user runs the `main.m` file, a different set of manufacturable subcomponents will be produced. 
- The subcomponents used in the paper are saved in the `Output_data_used_in_paper` subfolder of BINACONN3D.  
- In the `matlab` subfolder, the script 
```bash 
Read_and_simulate_binary_MMAs.m
```
 reads all manufacturable subcomponents, loads them into the unfilled COMSOL file 
 ```bash
 MMA_MXene_manufacturable8.mph
 ```
 . The COMSOL file that contains the manufacturable MMA 8, and is ready to simulate, is 
 ```bash
  MMA_MXene_manufacturable8_done.mph
 ```
 . By running the COMSOL file, the user can obtain the absorbance saved in the 
 ```bash
  A_Manufacturable_8.txt
 ```
 , located in `comsol-files/Output_data`.

# Figure scripts
The following scripts reproduce main figures from the paper:

- The script 
```bash 
Read_data_generate_Fig_14a.m
```
 located in `matlab/BINACONN3D/Codes` reproduces the paper's Fig.14(a). The script is located in the `BINACONN3D/Codes` folder as it uses functions of BINACONN3D.
- The script 
```bash
Read_data_generate_Fig_17.m
```
 located in `matlab` folder reads the VNA's raw .s2p file in subfolder `measurement-data` named 
 ```bash
 Fig17_raw_meas.s2p
 ```
 , with the measured S-parameters, as well as the FEM S-parameters of the manufacturable MMA with seed 8 (file `A_Manufacturable_8.txt` in subfolder `comsol-files/Output_data`)  The script plots the simulated and measured absorbance in the X-band.

- The script 
```bash
Read_data_generate_Fig_12.m
```
 located in `matlab` folder generates the paper's Fig.12.
The script reads the .txt outputs from COMSOL Multiphysics located in subfolder `comsol-files/Output_data` and plots them. Specifically it reads and then plots the absorbance of the optimized MMA of 2 materials `A_2materials.txt`,  4 materials `A_4materials.txt`, 7 materials `A_7materials.txt`and of the continuous spatially-varying dielectric constant `A_continuous.txt`.

- The script 
```bash
Read_data_generate_Fig_15.m
```
 located in `matlab` folder generates part of the paper's Fig.15. The script indicatively plots the absorbance of the manufacturable MMA 8 (the one fabricated and measured) and compares it to the absorbance of the MMA with seven materials. 
The script reads the .txt outputs from COMSOL Multiphysics located in subfolder `comsol-files/Output_data` and plots them. Specifically it reads and then plots the absorbance of the optimized MMA of 7 materials `A_7materials.txt` and the optimized manufacturable MMA 8 `A_Manufacturable_8.txt`.


## Citation

If you use this package, please cite this paper:

```bibtex
@article{passia2025,
   author       = {{M.-T. Passia, Y. Zhao, H. Wang, and S.A. Cummer}}, 
   title =   "Synthesis of broadband multilayer metamaterial absorbers based on spatially-variable 3D-printed structures and MXenes",
   year         = "2025", 
   journal      = "Phys. Rev. Appl.", 
   doi = {https://doi.org/10.1103/8q6s-zg6y},
   volume       = "", 
   number       = "",
   pages        = "",
}
```

## **How to Contribute?**
If you’d like to contribute, feel free to submit a PR! 🚀
