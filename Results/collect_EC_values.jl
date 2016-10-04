ec_training = readdlm("../poets/EC.dat")
ec_nominal = readdlm("../poets/EC_training.dat")
#ec_random = readdlm("../poets/results_poets/random_set/EC.dat")
#stopgap
ec_random = readdlm("../poets/results_poets/random_set/EC_full_jl_array.dat")

ec_pred1  = readdlm("../poets/results_poets/cross_validation/EC1_jl_array.dat")
ec_pred2  = readdlm("../poets/results_poets/cross_validation/EC2_jl_array.dat")
ec_pred3  = readdlm("../poets/results_poets/cross_validation/EC3_jl_array.dat")
ec_pred4  = readdlm("../poets/results_poets/cross_validation/EC4_jl_array.dat")
ec_pred5  = readdlm("../poets/results_poets/cross_validation/EC5_jl_array.dat")
ec_pred6  = readdlm("../poets/results_poets/cross_validation/EC6_jl_array.dat")
ec_pred7  = readdlm("../poets/results_poets/cross_validation/EC7_jl_array.dat")
ec_pred8  = readdlm("../poets/results_poets/cross_validation/EC8_jl_array.dat")
ec_pred9  = readdlm("../poets/results_poets/cross_validation/EC9_jl_array.dat")
ec_pred10 = readdlm("../poets/results_poets/cross_validation/EC10_jl_array.dat")
ec_pred11 = readdlm("../poets/results_poets/cross_validation/EC11_jl_array.dat")

# using Debug
# @debug function stop()
#   @bp
# end


# build rows of table
# 1
dat1 = []
push!(dat1 ,ec_nominal[1])
push!(dat1 ,ec_training[1,:]) # objective 1 error for all models
push!(dat1 ,ec_pred1[1,:])
push!(dat1 ,ec_random[1,:])

# @show std(dat1[2])
# @show std(dat1[3])
# #@show std(dat1[4])
# @show dat1[4]
# stop()
row1 = [mean(dat1[1]),mean(dat1[2]),std(dat1[2]),
mean(dat1[3]),std(dat1[3]),mean(dat1[4]),std(dat1[4])]
#using HypothesisTests
#@show dat1[2],dat1[4]
#@show pvalue(TwoSampleTTest(Array{Float32}(dat1[2]),Array{Float32}(dat1[4])))

# 2
dat2 = []
push!(dat2 ,ec_nominal[2])
push!(dat2 ,ec_training[2,:]) # objective 1 error for all models
push!(dat2 ,ec_pred2[2,:])
push!(dat2 ,ec_random[2,:])

row2 = [mean(dat2[1]),mean(dat2[2]),std(dat2[2]),
mean(dat2[3]),std(dat2[3]),mean(dat2[4]),std(dat2[4])]

# 3
dat3 = []
push!(dat3 ,ec_nominal[3])
push!(dat3 ,ec_training[3,:]) # objective 1 error for all models
push!(dat3 ,ec_pred3[3,:])
push!(dat3 ,ec_random[3,:])

row3 = [mean(dat3[1]),mean(dat3[2]),std(dat3[2]),
mean(dat3[3]),std(dat3[3]),mean(dat3[4]),std(dat3[4])]


# 4
dat4 = []
push!(dat4 ,ec_nominal[4])
push!(dat4 ,ec_training[4,:]) # objective 1 error for all models
push!(dat4 ,ec_pred4[4,:])
push!(dat4 ,ec_random[4,:])

row4 = [mean(dat4[1]),mean(dat4[2]),std(dat4[2]),
mean(dat4[3]),std(dat4[3]),mean(dat4[4]),std(dat4[4])]

# 5
dat5 = []
push!(dat5 ,ec_nominal[5])
push!(dat5 ,ec_training[5,:]) # objective 1 error for all models
push!(dat5 ,ec_pred5[5,:])
push!(dat5 ,ec_random[5,:])

row5 = [mean(dat5[1]),mean(dat5[2]),std(dat5[2]),
mean(dat5[3]),std(dat5[3]),mean(dat5[4]),std(dat5[4])]

# 6
dat6 = []
push!(dat6 ,ec_nominal[6])
push!(dat6 ,ec_training[6,:]) # objective 1 error for all models
push!(dat6 ,ec_pred6[6,:])
push!(dat6 ,ec_random[6,:])

row6 = [mean(dat6[1]),mean(dat6[2]),std(dat6[2]),
mean(dat6[3]),std(dat6[3]),mean(dat6[4]),std(dat6[4])]

# 7
dat7 = []
push!(dat7 ,ec_nominal[7])
push!(dat7 ,ec_training[7,:]) # objective 1 error for all models
push!(dat7 ,ec_pred7[7,:])
push!(dat7 ,ec_random[7,:])

row7 = [mean(dat7[1]),mean(dat7[2]),std(dat7[2]),
mean(dat7[3]),std(dat7[3]),mean(dat7[4]),std(dat7[4])]

# 8
dat8 = []
push!(dat8 ,ec_nominal[8])
push!(dat8 ,ec_training[8,:]) # objective 1 error for all models
push!(dat8 ,ec_pred8[8,:])
push!(dat8 ,ec_random[8,:])

row8 = [mean(dat8[1]),mean(dat8[2]),std(dat8[2]),
mean(dat8[3]),std(dat8[3]),mean(dat8[4]),std(dat8[4])]

# 9
dat9 = []
push!(dat9 ,ec_nominal[9])
push!(dat9 ,ec_training[9,:]) # objective 1 error for all models
push!(dat9 ,ec_pred9[9,:])
push!(dat9 ,ec_random[9,:])

row9 = [mean(dat9[1]),mean(dat9[2]),std(dat9[2]),
mean(dat9[3]),std(dat9[3]),mean(dat9[4]),std(dat9[4])]

# 10
dat10 = []
push!(dat10,ec_nominal[10])
push!(dat10,ec_training[10,:]) # objective 1 error for all models
push!(dat10,ec_pred10[10,:])
push!(dat10,ec_random[10,:])

row10 = [mean(dat10[1]),mean(dat10[2]),std(dat10[2]),
mean(dat10[3]),std(dat10[3]),mean(dat10[4]),std(dat10[4])]

# 11
dat11 = []
push!(dat11,ec_nominal[11])
push!(dat11,ec_training[11,:]) # objective 1 error for all models
push!(dat11,ec_pred11[11,:])
push!(dat11,ec_random[11,:])

row11 = [mean(dat11[1]),mean(dat11[2]),std(dat11[2]),
mean(dat11[3]),std(dat11[3]),mean(dat11[4]),std(dat11[4])]

rows=[]
push!(rows,row1)
push!(rows,row2)
push!(rows,row3)
push!(rows,row4)
push!(rows,row5)
push!(rows,row6)
push!(rows,row7)
push!(rows,row8)
push!(rows,row9)
push!(rows,row10)
push!(rows,row11)


dir_out= "../poets/results_poets"

writedlm("$dir_out/fig_error_table.csv",rows,",")



## to get nominal values
#dbassen@butcherhpc:~/Dropbox/server_swap_space/gen_2_model/poets$ ji emt_grn_model_objective_function.jl
#
#julia> global HOLD = 0
#0

#julia> objective_function(parameter_array)
# writedlm("EC_training.dat",objective_function(parameter_array))
