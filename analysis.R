#correlation between countries

df_country=df
df_prices=read.csv("iphone_prices.csv",header = T)
df_gdp = read.csv("gdp.csv",header = T)
df_popd = read.csv("pop_density.csv",header=T)

#there are two representations of wealth to choose from wealth per adult, or GDP per capita
#we will find correlation between them

#merging both data frames containing country data and iphone prices

df_2=merge(df_country,df_prices,by.x="Country",by.y="Country")
df_1=merge(df_2,df_gdp,by.x="Country",by.y = "Country")
df_1=merge(df_1,df_popd,by.x="Country",by.y = "Country")

write.csv(df_1,file="data.csv")

View(df_1)

gini=as.numeric(df_1$`Wealth Gini`)
wealth_pa=as.numeric(df_1$`Wealth per adult`)
gdp_pc=as.numeric(df_1$`GDP per capita`)
wealth_pc=as.numeric(df_1$`Wealth per capita`)
gdp=as.numeric(df_1$GDP)
popd=as.numeric(df_1$Pop.Density)
xs=as.numeric(df_1$XS.64.GB)
xs_max=as.numeric(df_1$XS.Max.64.GB)
xr=as.numeric(df_1$XR.64.GB)

boxplot(xr,xs,xs_max, names=c("XR", "XS 64 GB", "XS Max 64 GB"), horizontal = TRUE)

cor(wealth_pa,gdp_pc)
# there is a considerable correlation between GDP per capita and Wealth per adult. Looks like
# we can drop one of them.

xmat = cbind(gini,wealth_pa,wealth_pc,gdp_pc,gdp,popd,xr,xs,xs_max)
cor(xmat)

model_xs = lm(xs ~ gini+wealth_pa+gdp_pc+gdp)
summary(model_xs)

par(mar = c(5, 4, 4, 4) + 0.3)

plot(xs,col="red",type="l",pch=20,ylim=c(500,2000))
#lines(xr,col="blue")
#lines(xs_max,col="black")
#points(xr,pch=20,col="blue")
#points(xs_max,col="black",pch=20)

#for plotting wealth per adult on new axis

par(new=TRUE)
plot(wealth_pa,type="l",col="green",pch=20,axes=FALSE,bty="n",xlab="",ylab = "")
axis(side=4, at = pretty(range(wealth_pa)))
