number_of_mRNA_species_balances = 23
number_of_protein_species_balances = 23
number_of_auxilary_balances = 0
gene_deletion_array = ones(number_of_mRNA_species_balances)

# Assume we have no mRNA or protein initially, but we do have cells -
total_number_of_species = number_of_mRNA_species_balances+number_of_mRNA_species_balances+number_of_auxilary_balances
initial_condition_vector = zeros(total_number_of_species)
cell_mass_index = number_of_mRNA_species_balances+number_of_mRNA_species_balances+1
atra_index = number_of_mRNA_species_balances+number_of_mRNA_species_balances+2
cRAFS621_index = number_of_mRNA_species_balances+number_of_mRNA_species_balances+3

# constants (from bionumbers)
hl60_diameter = 12                # \mum
number_of_rnapII = 75000          # copies/cells
number_of_ribosome = 1e6          # copies/cells
mRNA_half_life_TF = 2             # hrs
protein_half_life = 10            # hrs
doubling_time_hl60 = 19.5         # hrs
max_translation_rate = 5          # aa/sec
max_transcription_rate = 6.0       # n/sec
average_transcript_length = 15000 # n
average_protein_length = 5000     # aa
fraction_nucleus = 0.49           # dimensionless
av_number = 6.02e23               # number/mol
avg_gene_number = 2               # number of copues of a gene -

# Calculate the volume (convert to L)
V = ((1-fraction_nucleus)*(1/6)*(3.14159)*(hl60_diameter)^3)*(1e-15)

# Calculate the rnapII_concentration and ribosome_concentration
rnapII_concentration = number_of_rnapII*(1/av_number)*(1/V)*1e9 # \nM
ribosome_concentration = number_of_ribosome*(1/av_number)*(1/V)*1e9 # \nM

# degrdation rate constants -
degradation_constant_mRNA = -(1/mRNA_half_life_TF)*log(0.5)
degradation_constant_protein = -(1/protein_half_life)*log(0.5)

# kcats for transcription and translation -
kcat_transcription = max_transcription_rate*(3600/average_transcript_length)  # hr^-1
kcat_translation = max_translation_rate*(3600/average_protein_length)  # hr^-1

# Maximum specific growth rate -
maximum_specific_growth_rate = (1/doubling_time_hl60)*log(2) # 0.0355 # hr^-1

# What is the average gene concentration -
avg_gene_concentration = avg_gene_number*(1/av_number)*(1/V)*1e9  #\nM

# What fraction of the maximum is the background?
background_expression_parameter_array = 0.0000001*ones(number_of_mRNA_species_balances)
background_expression_parameter_array[1] = 0.0
background_expression_parameter_array[2] = 0.0
background_expression_parameter_array[3] = 0.0

# How fast do my ells die?
death_rate_constant = 0.2*maximum_specific_growth_rate

# Saturation constants for translation and trascription -
saturation_transcription = 4600*(1/av_number)*(1/V)*1e9
saturation_translation = 100000*(1/av_number)*(1/V)*1e9

const_transcription = kcat_transcription/saturation_transcription
const_translation   = kcat_translation/saturation_translation

eg_transciption_rate = 1.0 * const_transcription * rnapII_concentration
eg_translation_rate = 1.0 * const_translation * ribosome_concentration
