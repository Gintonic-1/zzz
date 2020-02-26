setwd("//ad.ucl.ac.uk/homeh/rejbqzh/DesktopSettings/Desktop/Bayesian/ICA")
set.seed(13)
install.packages("R2OpenBUGS")
library(R2OpenBUGS)

y_1=25
y_2=30
n_1=300
n_2=900
data=list(a=y_1,b=y_2,c=n_1,d=n_2)

model.file="ICA 2020.txt"				# Specifies the path to the model file
params <- c("y_1","y_2","theta_1","theta_2","rho")	# Defines the list of parameters
n.chains=2
n.burnin=1000
n.iter=2000
n.thin=1
debug=FALSE

# Finally runs the model by calling OpenBUGS in the background
m=bugs(data=data,inits=NULL,model.file=model.file,parameters.to.save=params,
       n.chains=n.chains,n.iter=n.iter,n.burnin=n.burnin,n.thin=n.thin,DIC=TRUE,debug=TRUE)

print(m)
hist(y_1)
