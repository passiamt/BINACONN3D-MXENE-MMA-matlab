# BINACONN3D-MXENES

MATLAB codes and data for the paper: M.-T. Passia, Y. Zhao, H. Wang, and S.A. Cummer, "Synthesis of broadband multilayer metamaterial absorbers based on spatially-variable 3D-printed structures and MXenes", Phys.Rev.Appl., DOI: https://doi.org/10.1103/8q6s-zg6y 
See the paper for more information.

This project has received funding from the European Union’s Horizon 2020 research and innovation programme under the Marie Sklodowska-Curie grant agreement No.101146306. The MSCA Global Postdoctoral Fellowship is 'MILLISURF'.

## Requirements
- MATLAB with a version of 2022b or later with RFtoolbox 
- COMSOL Multiphysics 6.1 with MATLAB

## Prerequisites

In order to run all scripts, you need to download the mph (COMSOL) files from [link](...)
and store them with their original name under `comsol-files`, for example:

```bash
comsol-files/MMA_MXene_manufacturable8_done.mph
```

## Usage

# BINACONN 3D matlab codes
The BINACONN3D matlab code is located in the matlab/BINACONN3D folder.
- The user should execute main.m 
- The code takes as input a 3D array of size 48X22X7 which corresponds to the complex dielectric constant of each cell for a device with seven material levels.  The complex dielectric constant of the optimized device with seven materials, reported in the paper, is saved at the folder matlab/BINACONN3D/Input_data as e_discr_7materials.mat
- Each manufacturable subcomponents is saved in the folder Output_data_live
- The BINACONN3D uses randomization to select which cells are selected within a component.  In the main.m file in line 162 we set the BINACONN3D method to run 8 times, to produce 8 different manufacturable subcomponents. 
- Since a randomization process is present in the code each time the user runs the main.m file, a different set of manufacturable subcomponents will be produced. 
- The subcomponents used in the paper are saved in the 'Output_data_used_in_paper' subfolder of BINACONN3D.  
- In the 'matlab' subfolder, the script 'Read_and_simulate_binary_MMAs.m' reads all manufacturable subcomponents, loads them into the unfilled COMSOL file 'MMA_MXene_manufacturable8.mph'. The COMSOL file that contains the manufacturable MMA 8, and is ready to simulate, is 'MMA_MXene_manufacturable8_done.mph'. By running the COMSOL file, the user can obtain the absorbance saved in the 'A_Manufacturable_8.txt', located in comsol-files/Output_data.

# Figure scripts
The following scripts reproduce the figures from the paper:

- The script 'Read_data_generate_Fig_14a.m' located in 'matlab/BINACONN3D/Codes' reproduces the paper's Fig.14(a). The script is located in the 'BINACONN3D/Codes' folder as it uses functions of BINACONN3D.
- The script 'Read_data_generate_Fig_17.m' located in 'matlab' folder reads the VNA's raw .s2p file (in subfolder 'measurement-data' named 'Fig17_raw_meas.s2p'), with the measured S-parameters, as well as the FEM S-parameters of the manufacturable MMA with seed 8 (file A_Manufacturable_8.txt in subfolder comsol-files/Output_data)  The script plots the simulated and measured absorbance in the X-band.



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
