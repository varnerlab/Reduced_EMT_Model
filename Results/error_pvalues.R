pred1<-read.table("/Users/dbassen/Dropbox/server_swap_space/gen_2_model/poets/results_poets/cross_validation/EC1_jl_array.dat")
pred1_t<-t(pred1)
pred1 <- as.numeric(pred1_t[,1])

pred2<-read.table("/Users/dbassen/Dropbox/server_swap_space/gen_2_model/poets/results_poets/cross_validation/EC2_jl_array.dat")
pred2_t<-t(pred2)
pred2 <- as.numeric(pred2_t[,2])

pred3<-read.table("/Users/dbassen/Dropbox/server_swap_space/gen_2_model/poets/results_poets/cross_validation/EC3_jl_array.dat")
pred3_t<-t(pred3)
pred3 <- as.numeric(pred3_t[,3])

pred4<-read.table("/Users/dbassen/Dropbox/server_swap_space/gen_2_model/poets/results_poets/cross_validation/EC4_jl_array.dat")
pred4_t<-t(pred4)
pred4 <- as.numeric(pred4_t[,4])

pred5<-read.table("/Users/dbassen/Dropbox/server_swap_space/gen_2_model/poets/results_poets/cross_validation/EC5_jl_array.dat")
pred5_t<-t(pred5)
pred5 <- as.numeric(pred5_t[,5])

pred6<-read.table("/Users/dbassen/Dropbox/server_swap_space/gen_2_model/poets/results_poets/cross_validation/EC6_jl_array.dat")
pred6_t<-t(pred6)
pred6 <- as.numeric(pred6_t[,6])

pred7<-read.table("/Users/dbassen/Dropbox/server_swap_space/gen_2_model/poets/results_poets/cross_validation/EC7_jl_array.dat")
pred7_t<-t(pred7)
pred7 <- as.numeric(pred7_t[,7])

pred8<-read.table("/Users/dbassen/Dropbox/server_swap_space/gen_2_model/poets/results_poets/cross_validation/EC8_jl_array.dat")
pred8_t<-t(pred8)
pred8 <- as.numeric(pred8_t[,8])

pred9<-read.table("/Users/dbassen/Dropbox/server_swap_space/gen_2_model/poets/results_poets/cross_validation/EC9_jl_array.dat")
pred9_t<-t(pred9)
pred9 <- as.numeric(pred9_t[,9])

pred10<-read.table("/Users/dbassen/Dropbox/server_swap_space/gen_2_model/poets/results_poets/cross_validation/EC10_jl_array.dat")
pred10_t<-t(pred10)
pred10 <- as.numeric(pred10_t[,10])

pred11<-read.table("/Users/dbassen/Dropbox/server_swap_space/gen_2_model/poets/results_poets/cross_validation/EC11_jl_array.dat")
pred11_t<-t(pred11)
pred11 <- as.numeric(pred11_t[,11])

random <-read.table("/Users/dbassen/Dropbox/server_swap_space/gen_2_model/poets/results_poets/random_set/EC_full_jl_array.dat")
random_t <-t(random)
#random <- as.numeric(random_t[,11])

training <-read.table("/Users/dbassen/Dropbox/server_swap_space/gen_2_model/poets/EC.dat")
training_t<-t(training)

training1 <-wilcox.test( as.numeric(random_t[,1]) , as.numeric(training_t[,1]) )$p.value
training2 <-wilcox.test( as.numeric(random_t[,2]) , as.numeric(training_t[,2]) ) $p.value
training3 <-wilcox.test( as.numeric(random_t[,3]) , as.numeric(training_t[,3]) ) $p.value
training4 <-wilcox.test( as.numeric(random_t[,4]) , as.numeric(training_t[,4]) ) $p.value
training5 <-wilcox.test( as.numeric(random_t[,5]) , as.numeric(training_t[,5]) ) $p.value
training6 <-wilcox.test( as.numeric(random_t[,6]) , as.numeric(training_t[,6]) ) $p.value
training7 <-wilcox.test( as.numeric(random_t[,7]) , as.numeric(training_t[,7]) ) $p.value
training8 <-wilcox.test( as.numeric(random_t[,8]) , as.numeric(training_t[,8]) ) $p.value
training9 <-wilcox.test( as.numeric(random_t[,9]) , as.numeric(training_t[,9]) ) $p.value
training10 <-wilcox.test( as.numeric(random_t[,10]) , as.numeric(training_t[,10]) ) $p.value
training11 <-wilcox.test( as.numeric(random_t[,11]) , as.numeric(training_t[,11]) ) $p.value

c(training1,training2,training3,training4,training5,training6,training7,training8,training9,training10,training11)

prediction1 <-wilcox.test( as.numeric(random_t[,1]) , as.numeric(pred1) )$p.value
prediction2 <-wilcox.test( as.numeric(random_t[,2]) , as.numeric(pred2) ) $p.value
prediction3 <-wilcox.test( as.numeric(random_t[,3]) , as.numeric(pred3) ) $p.value
prediction4 <-wilcox.test( as.numeric(random_t[,4]) , as.numeric(pred4) ) $p.value
prediction5 <-wilcox.test( as.numeric(random_t[,5]) , as.numeric(pred5) ) $p.value
prediction6 <-wilcox.test( as.numeric(random_t[,6]) , as.numeric(pred6) ) $p.value
prediction7 <-wilcox.test( as.numeric(random_t[,7]) , as.numeric(pred7) ) $p.value
prediction8 <-wilcox.test( as.numeric(random_t[,8]) , as.numeric(pred8) ) $p.value
prediction9 <-wilcox.test( as.numeric(random_t[,9]) , as.numeric(pred9) ) $p.value
prediction10 <-wilcox.test( as.numeric(random_t[,10]) , as.numeric(pred10) ) $p.value
prediction11 <-wilcox.test( as.numeric(random_t[,11]) , as.numeric(pred11) ) $p.value

c(prediction1,prediction2,prediction3,prediction4,prediction5,prediction6,prediction7,prediction8,prediction9,prediction10,prediction11)
