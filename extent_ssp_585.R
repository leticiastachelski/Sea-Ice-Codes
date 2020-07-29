library(tidyverse)
library(dplyr)
library(tidyr)
library(readxl)
library(ggplot2)
library("RColorBrewer")
#-----------------------------------------------------------------------------------------------------------------
#-------------------------------------ANTÁRTICA
#-----------------------------------------------------------------------------------------------------------------
i1 <- read.table("/home/leticia/Documentos/2020.1/leticia_dados_CMIP/dados_CMIP6/ssp_585/GFDL_585.txt") 
i2 <- read.table("/home/leticia/Documentos/2020.1/leticia_dados_CMIP/dados_CMIP6/ssp_585/mpi_585.txt")
i3 <- read.table("/home/leticia/Documentos/2020.1/leticia_dados_CMIP/dados_CMIP6/ssp_585/ncar_585.txt")
#----
i1 <- i1[-1,]
i2 <- i2[-1,]
i3 <- i3[-1,]
#---- FEVEREIRO
ic <- data.frame(ano = i1$V2, mes=i1$V1, gdfl_fev=i1$V3, mpi_fev=i2$V3, ncar_fev = i3$V3)
ice_fev <- ic[ic$mes == "FEB",]
ice_fev$mes <- NULL
#---- SETEMBRO
ic1 <- data.frame(ano = i1$V2, mes=i1$V1, gdfl_set=i1$V3, mpi_set=i2$V3, ncar_set = i3$V3)
ice_set <- ic1[ic1$mes == "SEP",]
ice_set$mes <- NULL
icec <- data.frame(ano = ice_fev$ano,
                   gdfl_fev = ice_fev$gdfl_fev, mpi_fev = ice_fev$mpi_fev, ncar_fev = ice_fev$ncar_fev,
                   gdfl_set = ice_set$gdfl_set, mpi_set = ice_set$mpi_set, ncar_set = ice_set$ncar_set)
#----
ice <- gather(data=icec, key = meses, 
              value = extensao, gdfl_fev, mpi_fev, ncar_fev, gdfl_set, mpi_set, ncar_set)
ice$extensao <- as.numeric(as.character(ice$extensao))
ice$ano <- as.numeric(as.character(ice$ano))

#---- PLOT
sea_ice <- ggplot(ice, aes(x=ano,y=extensao)) +
  geom_line(aes(group = meses, colour = meses),size=0.8)+
  scale_colour_manual(values = c('red1','red4','royalblue1','royalblue4','green','green4'), 
                      labels = c('GDFL-CM3.0 / Fevereiro','GDFL-CM3.0 / Setembro',
                                 'MPI-ESM1.2-LR / Fevereiro','MPI-ESM1.2-LR / Setembro',
                                 'NCAR-CESM2.0 / Fevereiro','NCAR-CESM2.0 / Setembro'), name="") +
  
  labs(title = "",
       x = "", 
       y = "SIE (x10⁶km²)",size = 5) + 
  ylim(-1,30) + 
  theme_classic(base_size = 20) +
  theme(#legend.position=c(.75,.80),
    #legend.text=element_text(size=10),
    # axis.text.x = element_text(angle = 45, hjust = 1),
    panel.border = element_rect(fill=NA,color="black", size=1.1, 
                                linetype="solid"))
sea_ice
#-----------------------------------------------------------------------------------------------------------------
#------------------------------------- ÁRTICO
#-----------------------------------------------------------------------------------------------------------------
i1 <- read.table("/home/leticia/Documentos/2020.1/leticia_dados_CMIP/dados_CMIP6/ssp_585/GFDL_arct_585.txt") 
i2 <- read.table("/home/leticia/Documentos/2020.1/leticia_dados_CMIP/dados_CMIP6/ssp_585/mpi_arct_585.txt")
i3 <- read.table("/home/leticia/Documentos/2020.1/leticia_dados_CMIP/dados_CMIP6/ssp_585/ncar_arct_585.txt")
#----
i1 <- i1[-1,]
i2 <- i2[-1,]
i3 <- i3[-1,]
#---- FEVEREIRO
ic <- data.frame(ano = i1$V2, mes=i1$V1, gdfl_fev=i1$V3, mpi_fev=i2$V3, ncar_fev = i3$V3)
ice_mar <- ic[ic$mes == "MAR",]
ice_mar$mes <- NULL
#---- SETEMBRO
ic1 <- data.frame(ano = i1$V2, mes=i1$V1, gdfl_set=i1$V3, mpi_set=i2$V3, ncar_set = i3$V3)
ice_set <- ic1[ic1$mes == "SEP",]
ice_set$mes <- NULL
ice_set$ano <- NULL
i <- data.frame(c(ice_mar,ice_set))
#----
ice <- gather(data=i, key = meses, 
              value = extensao, gdfl_fev, mpi_fev, ncar_fev, gdfl_set, mpi_set, ncar_set)

ice$extensao <- as.numeric(as.character(ice$extensao))
ice$ano <- as.numeric(as.character(ice$ano))

#---- PLOT
sea_ice <- ggplot(ice, aes(x=ano,y=extensao)) +
  geom_line(aes(group = meses, colour = meses),size=0.8)+
  scale_colour_manual(values = c('red1','red4','royalblue1','royalblue4','green','green4'), 
                      labels = c('GDFL-CM4.0 / Março','GDFL-CM4.0 / Setembro',
                                 'MPI-ESM1.2-LR / Março','MPI-ESM1.2-LR / Setembro',
                                 'NCAR-CESM2.0 / Março','NCAR-CESM2.0 / Setembro'), name="") +
  
  labs(title = "",
       x = "", 
       y = "SIE (x10⁶km²)",size = 5) + 
  ylim(-1,30) + 
  theme_classic(base_size = 20) +
  theme(#legend.position=c(.75,.80),
    #legend.text=element_text(size=10),
    # axis.text.x = element_text(angle = 45, hjust = 1),
    panel.border = element_rect(fill=NA,color="black", size=1.1, 
                                linetype="solid"))
sea_ice
