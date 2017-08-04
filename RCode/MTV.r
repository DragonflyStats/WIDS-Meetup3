

set.seed(1001);
ID <- 101:110;
A1 <- sample(100:200,10,TRUE);
A2 <- sample(c("Male","Female"),10,TRUE);
DF1 <- data.frame(ID,A1,A2);

set.seed(1002);
ID <- 103:114;
B1 <- sample(50:100,12,TRUE)/10;
B2 <- sample(c("Dog","Cat","Parrot","Hamster"),12,TRUE);
DF2 <- data.frame(ID,B1,B2);


set.seed(1003);
ID <- sample(101:116,11);
C1 <- sample(10:60,11,TRUE)/10;
C2 <- sample(c("Blue","Red","Green","Yellow"),11,TRUE);
DF3 <- data.frame(ID,C1,C2);

