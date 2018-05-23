rm(list = ls())


#matlab
#install.packages("R.matlab")
#library("R.matlab")

#folders
setwd('C:/Users/sapir/Google Drive/university/third year/project/2-pro/')
#setwd('C:/Users/Alpha/Google Drive (adi.ziv1@mail.huji.ac.il)/project/2-pro/')


#from matlab to Rdata
#emnist <- readMat("matlab/matlab/emnist-byclass.mat")
#save(emnist, file = "emnisr_matlab.Rdata")

#rm(list = ls())

####start from here###
load("emnisr_matlab.Rdata")
source('EMNIST_general_functions.R')


load("emnist_words.Rdata")
GenerateRandomWords(n_words = 1000,x_train = words[["X"]],y_train = words[["y"]],z_map = words[["y_hat"]],s = " ",L = 5 )
