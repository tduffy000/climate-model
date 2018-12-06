
#Plot number 1 
plot(dff$adjusted_R2, type="p", ylab="Adj. R2", main="Variables Selection", col="blue")

par(new=TRUE)
plot(dff$OS_error, type = "p", xaxt="n", yaxt="n", ylab="", xlab = "", col="red", lty=2)
axis(side=4)
mtext("MSE", side=4)
legend("left", c("Adj R2", "MSE"), col=c("blue", "red"), lty=c(1,2))
axis(side=1, at=seq(1,20))
grid(21)


#Plot number 2
ddff <- dff %>% filter(dff$adjusted_R2>0.999, dff$OS_error<0.056)

plot(ddff$adjusted_R2, type="p", ylab="Adj. R2", main="Variables Selection", col="blue")

par(new=TRUE)
plot(ddff$OS_error, type = "p", xaxt="n", yaxt="n", ylab="", xlab = "", col="red", lty=2)
axis(side=4)
mtext("MSE", side=4)
legend("right", c("Adj R2", "MSE"), col=c("blue", "red"), lty=c(1,2))
axis(side=1, at=seq(1,8))
grid(20)
