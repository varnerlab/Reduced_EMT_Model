# to remake the error table
python reformat_prediction_patch.py
julia collect_EC_values.jl
python reformat_error_fig.py

