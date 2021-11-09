# Carregando os pacotes
require("agricolae");require("gclus");require("cluster");require("vegan")
require("lattice");require("nortest");require("rio");require("ggplot2")
require("gganimate");# install_formats("Excel") #Usada para extração em Excel


####################################################
#             Análise de Clusters                  #
####################################################
dd<-read.table("c://r//lismara.txt",h=T,sep="\t")
names(dd)
rotulos<-dd$id
d.std<-decostand(dd[3:25], "standardize",na.rm=T) # padronização dos dados retiro NAs com o na.rm
d.std.euc<-vegdist(d.std,"euclidean") # criando a matriz de distâncias euclidianas
d.std.euc.ward<-hclust(d.std.euc, method="ward.D") # método de linkage = Ward
x11()
plot(d.std.euc.ward, xlab="Acessos",ylab="Distância Euclidiana",
     labels = rotulos,cex=.2,las=1,cex.lab=1.2,main="",
     lwd=1.5);box()
altCorte<-diff(d.std.euc.ward$height)
abline(h=d.std.euc.ward$height[which(altCorte==max(altCorte))])
abline(v=d.std.euc.ward$merge[which(altCorte==max(altCorte))])
x11()
plot(y=d.std.euc.ward$height,x=nrow(dd):2,type="S",
     xlab="Passos",ylab="Distância Euclidiana",col="black",lwd=1.5,las=1,cex.lab=1.2,
     xlim=c(0,25))
abline(h=d.std.euc.ward$height[which(altCorte==max(altCorte))])
grupos<-cutree(d.std.euc.ward,2)

# Análise de Componentes Principais 
names(dd)
da<-dd[c(3,4,6,9,10,15,17,21,24)]
pca<-prcomp(da,scale.=T)
round(pca$sdev^2,5)	#Autovalores
ve<-round(pca$sdev^2/sum(pca$sdev^2),5)*100;ve #% variância explicada
cumsum(ve)#% da variância acumulada
summary(pca) # mostra todos
pca # Autovalores das variáveis
pca$x # factor coordinates of cases
mcor<-cor(da,pca$x);mcor #correlações
barplot(pca$sdev^2,names.arg=colnames(pca$rotation),ylim=c(0,(pca$sdev^2)[1]*1.1),
        ylab="Inertia",xlab="Componentes Princiais",cex.lab=1.2
        ,main="Sreeplot");box()
abline(h=1,lty=2)	
#Construção do Biplot e sua tabela
pc1V<-cor(da,pca$x)[,1]/sd(cor(da,pca$x)[,1])
pc2V<-cor(da,pca$x)[,2]/sd(cor(da,pca$x)[,2])
pc1c<-pca$x[,1]/sd(pca$x[,1])
pc2c<-pca$x[,2]/sd(pca$x[,2])
nv<-ncol(da) # número de variáveis utilizadas na análise
x11()
plot(pc1V,pc2V,xlim=c(min(pc1V,pc1c),max(pc1V,pc1c)),
     ylim=c(min(pc2V,pc2c),max(pc2V,pc2c)),pch="",las=1,
     xlab=paste("CP1 (",ve[1],"%)",sep=""),ylab=paste("CP2 (",ve[2],"%)",sep=""),font.lab=2)
abline(v=0,h=0)
arrows(rep(0,nv),rep(0,nv),pc1V*.90,pc2V*.90,lwd=1.5,length=.1)
#lv<-as.factor(grupos[ft]);nlv<-levels(lv)
lv<-as.factor(rotulos);nlv<-levels(lv)
for(i in 1:length(nlv)){
  ff<-lv==nlv[i]  
  points(pc1c[ff],pc2c[ff],cex=1.3,col=i,pch=i+15)  
};text(pc1V,pc2V,names(pc1V),font=4,cex=.9)
legend(-2,1,c("Tumor","Controle"),pch=15+1:length(levels(lv)),col=1:length(levels(lv)))


plot(pc1V,pc2V,xlim=c(min(pc1V,pc1c),max(pc1V,pc1c)),
     ylim=c(min(pc2V,pc2c),max(pc2V,pc2c)),pch="",las=1,
     xlab=paste("CP1 (",ve[1],"%)",sep=""),ylab=paste("CP2 (",ve[2],"%)",sep=""),font.lab=2)
abline(v=0,h=0)
arrows(rep(0,nv),rep(0,nv),pc1V*.90,pc2V*.90,lwd=1.5,length=.1)
text(pc1V,pc2V,names(pc1V),font=4,cex=.9)
text(pc1c[ff],pc2c[ff],dd$nome[ff],font=3,col="red")
text(pc1c[!ff],pc2c[!ff],dd$nome[!ff],font=3,col="blue")
# Tabela do Biplot com as PC e seus respectivos autovetores
ck<-sum(pca$sdev^2>=1)
tabelapca<-vector()
for( i in 1:ck) tabelapca<-cbind(tabelapca,mcor[,i],pca$rotation[,i])
colnames(tabelapca)<-paste(rep(c("PC","x"),ck),rep(1:ck,rep(2,ck)),sep="")
round(tabelapca,3)
summary(pca)
