library(haven)
library(psych)
m=10

#read in the results from the analysis in SAS
overimputatie<- read_sas("C:/Users/u0118563/OneDrive - KU Leuven/Projecten/Corona Vera Hoorens/Paper 4/results/combined.sas7bdat", NULL)
perimputatie<- read_sas("C:/Users/u0118563/OneDrive - KU Leuven/Projecten/Corona Vera Hoorens/Paper 4/results/fixed.sas7bdat", 
                        NULL)
vcovar<- read_sas("C:/Users/u0118563/OneDrive - KU Leuven/Projecten/Corona Vera Hoorens/Paper 4/results/covarpm1.sas7bdat", 
                  NULL)

#function to calculate type III test
pvalcombined_main=function(ff,ref,k){
  ####theta bar####
  overimputatie_effect=subset(overimputatie,Parm==ff)
  overimputatie_effect$theta_bar=overimputatie_effect$Estimate
  overimputatie_effect=subset(overimputatie_effect,select=c(ff,'theta_bar') )
  overimputatie_effect=subset(overimputatie_effect,overimputatie_effect[1]!=ref)
  
  ####B####
  perimputatie_effect=subset(perimputatie,Effect==ff)
  colnames(perimputatie_effect)[1]='imp'
  perimputatie_effect=subset(perimputatie_effect,select=c('imp',ff,'Estimate'))
  perimputatie_effect=subset(perimputatie_effect,perimputatie_effect[2]!=ref)
  
  perimputatie_effect2=merge(perimputatie_effect,overimputatie_effect, by = c(ff))
  perimputatie_effect2$between=(perimputatie_effect2$Estimate-perimputatie_effect2$theta_bar)
  
  perimputatie_effect2=perimputatie_effect2[order(perimputatie_effect2$imp, perimputatie_effect2[ff]),]
  b1=subset(perimputatie_effect2, imp ==1,
            select=c(between))
  
  b2=subset(perimputatie_effect2, imp ==2,
            select=c(between))
  b3=subset(perimputatie_effect2, imp ==3,
            select=c(between))
  b4=subset(perimputatie_effect2, imp ==4,
            select=c(between))
  b5=subset(perimputatie_effect2, imp ==5,
            select=c(between))
  b6=subset(perimputatie_effect2, imp ==6,
            select=c(between))
  b7=subset(perimputatie_effect2, imp ==7,
            select=c(between))
  b8=subset(perimputatie_effect2, imp ==8,
            select=c(between))
  b9=subset(perimputatie_effect2, imp ==9,
            select=c(between))
  b10=subset(perimputatie_effect2, imp ==10,
             select=c(between))
  data1=(b1$between)%*%t(b1$between)
  data2=(b2$between)%*%t(b2$between)
  data3=(b3$between)%*%t(b3$between)
  data4=(b4$between)%*%t(b4$between)
  data5=(b5$between)%*%t(b5$between)
  data6=(b6$between)%*%t(b6$between)
  data7=(b7$between)%*%t(b7$between)
  data8=(b8$between)%*%t(b8$between)
  data9=(b9$between)%*%t(b9$between)
  data10=(b10$between)%*%t(b10$between)
  
  b=(data1+data2+data3+data4+data5+data6+data7+data8+data9+data10)/9
  
  
  ####u####
  vcovar_effect=subset(vcovar,Effect==ff)
  vcovar_effect=vcovar_effect[which(vcovar_effect[ff]!=ref),]
  colnames(vcovar_effect)[1]='imp'
  
  vcovar_effect=vcovar_effect[order(vcovar_effect$imp, vcovar_effect[ff]),]
  
  
  u1=subset(vcovar_effect,imp ==1)
  u2=subset(vcovar_effect, imp ==2)
  u3=subset(vcovar_effect, imp ==3)
  u4=subset(vcovar_effect, imp ==4)
  u5=subset(vcovar_effect, imp ==5)
  u6=subset(vcovar_effect, imp ==6)
  u7=subset(vcovar_effect, imp ==7)
  u8=subset(vcovar_effect, imp ==8)
  u9=subset(vcovar_effect, imp ==9)
  u10=subset(vcovar_effect, imp ==10)
  
  create_varcovar=function(imput){
    rows=paste('Col',imput$Row,sep = "")
    return(subset(imput,select=rows))
  }
  
  u1b=create_varcovar(u1)
  u2b=create_varcovar(u2)
  u3b=create_varcovar(u3)
  u4b=create_varcovar(u4)
  u5b=create_varcovar(u5)
  u6b=create_varcovar(u6)
  u7b=create_varcovar(u7)
  u8b=create_varcovar(u8)
  u9b=create_varcovar(u9)
  u10b=create_varcovar(u10)
  
  u=(u1b+u2b+u3b+u4b+u5b+u6b+u7b+u8b+u9b+u10b)/m
  
  
  #####final#####
  theta=overimputatie_effect$theta_bar
  rm=(1+1/m)*tr(b%*%solve(u))/k
  v=k*(m-1)
  w=4+(v-4)*(1+(1-2/v)/rm)^2
  D=t(theta)%*%solve(u)%*%theta/(k*(1+rm))
  
  return(pf(D,k,w,lower.tail = F))
}

####get results###

get_result=function(){

kolom1=c('time_since_exp')

kolom2=c(
  pvalcombined_main('time_since_exp',0,4)
)

stap1=as.data.frame(cbind(kolom1,round(kolom2,3)))
print(stap1)
}

get_result()


