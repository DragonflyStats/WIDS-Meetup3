library(dplyr)
#########
# Make Table 1
PID <- c(101,102,103,104,105,106,107,108,110)
VarA <- sample(letters[1:12],length(PID),replace=T)
VarB <- sample(10:20/10,length(PID),replace=T)
Table1 <- data.frame(PID,VarA,VarB)
rm(PID);rm(VarA);rm(VarB);
#######
# Make Table 2
PID <- c(101,102,103,104,105,106,108,109)
Var1 <- sample(c("RAVC","SLIR","HUFP","GRFD"),length(PID),replace=T)
Var2 <- sample(9:16,length(PID),replace=T)
Table2 <- data.frame(PID,Var1,Var2)
rm(PID);rm(Var1);rm(Var2);
#######
# Make Table 3
PrimKey <- c(101,102,103,104,105,106,107,108,109,110)
X1 <- c("Dog","Cat","Dog","Dog","Duck","Cat","Dog","Cat","Hamster","Goat")
X2 <- c("BodyRolls","BodyRolls","Hikicks","Hikicks","BodyRolls",
"BodyRolls","Hikicks","Hikicks","BodyRolls","BodyRolls")
Table3 <- data.frame(PrimKey,X1,X2)
rm(PrimKey);rm(X1);rm(X2);
#########
