## Reduced order EMT model

### Background ###
The epithelial to mesenchymal transition (EMT) is a broadly participating, evolutionarily conserved differentiation program essential for tissue morphogenesis, remodeling and pathological processes such as cancer. During EMT polarized, tightly adhered epithelial cell monolayers are transformed into non-interacting motile mesenchymal cells that simultaneously degrade and synthesize extracellular matrix (ECM) components and invade into the underlying tissue space. EMT is the fundamental initiator of developmental processes such as embryonic gastrulation and valvulogenesis. In this study, we developed and implemented a novel computational strategy to interrogate all of the known players in this transformation process to identify which are the major bottlenecks.
We determined that NFATc1 and pSP1 are essential for promoting epithelial or mesenchymal differentiation, respectively.
We then predicted the existence of a partially transformed cell that exhibits both epithelial and mesenchymal characteristics.
We found this partial cell type develops a network of invasive but stunted vascular structures that may be a unique cell target for understanding cancer progression and angiogenesis.

The EMT model is described in the publication:

[Gould R, Bassen D, Chakrabarti A, Varner V and J. Butcher (2016) Population heterogeneity in the epithelial to mesenchymal transition is controlled by NFAT and phosphorylated Sp1
bioRxiv 028993; doi: http://dx.doi.org/10.1101/028993](http://www.biorxiv.org/content/early/2015/10/13/028993)

### Installation
You can download this repository as a zip file, or clone or pull it by using the command:

	git pull https://github.com/varnerlab/Reduced_EMT_Model.git

or

	git clone https://github.com/varnerlab/Reduced_EMT_Model.git

### Code and directory layout ###
The model equations are encoded in ``Balances.jl`` which is called by the ``SolveBalances.jl`` driver function. The user should not directly call ``SolveBalances.jl``. Rather, multiple parameter sets can be simulated by calling the driver function from a script. The kinetic and other model parameters are encoded in ``DataFile.jl`` as a dictionary. The parameters stored in this dictionary can be updated in memory to run different simulations.

Model source code is contained in the ``<root>/src`` directory. The parameter estimation code is contained in the ``<root>/poets`` directory. The biological structure of the model is given in ``<root>/ModelStructure/Model.net``. The model equations were generated using the [Kwatee code generation system](https://github.com/varnerlab/KwateeServer) using the [GRN plugin](https://github.com/varnerlab/Kwatee-GRN-Plugin.git). 

### Model code and parameter ensemble
The EMT model equations were implemented in [Julia](http://julialang.org) and solved using the CVODE routine of the [Sundials package](https://github.com/JuliaLang/Sundials.jl). The model code and parameter ensemble is freely available under an [MIT software license](https://opensource.org/licenses/MIT). Model code is contained within the ``<root>/src`` subdirectory. 

The model ensemble was estimated using the [JuPOETs package](https://github.com/varnerlab/POETs.jl). The EMT objective functions, and problem specific constraints are encoded in ``<root>/poets/emt_grn_model_objective_function.jl``. The JuPOETs package is described in the publication:

[Bassen D, Vilkhovoy M, Minot M, J. Butcher and J. Varner (2016) JuPOETs: A Constrained Multiobjective Optimization Approach to Estimate Biochemical Model Ensembles in the Julia Programming Language. bioRxiv 056044; doi: http://dx.doi.org/10.1101/056044](http://biorxiv.org/content/early/2016/05/30/056044) 

