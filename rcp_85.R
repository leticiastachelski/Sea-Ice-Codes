library(tidyverse)
library(dplyr)
library(tidyr)
library(readxl)
library(ggplot2)
library("RColorBrewer")
#-----------------------------------------------------------------------------------------------------------------
#-------------------------------------ANTÁRTICA
#-----------------------------------------------------------------------------------------------------------------
i1 <- read.table('/home/leticia/Documentos/2020.1/leticia_dados_CMIP/dados_CMIP5/rcp_85/besm_antar_rcp_85.txt')
i2 <- read.table('/home/leticia/Documentos/2020.1/leticia_dados_CMIP/dados_CMIP5/rcp_85/gdfl_antar_rcp_85.txt')
i3 <- read.table('/home/leticia/Documentos/2020.1/leticia_dados_CMIP/dados_CMIP5/rcp_85/mpi_antar_rcp_85.txt')
i4 <- read.table('/home/leticia/Documentos/2020.1/leticia_dados_CMIP/dados_CMIP5/rcp_85/ncar_antar_rcp_85.txt')
#-----
i1 <- i1[-1,]
i2 <- i2[-1,]
i3 <- i3[-1,]
i4 <- i4[-1,]
#---- FEVEREIRO
ic <- data.frame(ano = i1$V2, mes=i1$V1, gdfl_fev=i2$V3, mpi_fev=i3$V3, ncar_fev = i4$V3, besm_fev = i1$V3)
ice_fev <- ic[ic$mes == "FEB",]
ice_fev$mes <- NULL
#---- SETEMBRO
ic1 <- data.frame(ano = i1$V2, mes=i1$V1, gdfl_set=i2$V3, mpi_set=i3$V3, ncar_set = i4$V3, besm_set = i1$V3)
ice_set <- ic1[ic1$mes == "SEP",]
ice_set$mes <- NULL
icec <- data.frame(ano = ice_fev$ano, besm_fev = ice_fev$besm_fev,
                   gdfl_fev = ice_fev$gdfl_fev, mpi_fev = ice_fev$mpi_fev, ncar_fev = ice_fev$ncar_fev,
                   besm_set = ice_set$besm_set,
                   gdfl_set = ice_set$gdfl_set, mpi_set = ice_set$mpi_set, ncar_set = ice_set$ncar_set)
#----
ice <- gather(data=icec, key = meses, 
              value = extensao, besm_fev, gdfl_fev, mpi_fev, ncar_fev, besm_set, gdfl_set, mpi_set, ncar_set)
ice$extensao <- as.numeric(as.character(ice$extensao))
ice$ano <- as.numeric(as.character(ice$ano))

#---- PLOT
sea_ice <- ggplot(ice, aes(x=ano,y=extensao)) +
  geom_line(aes(group = meses, colour = meses),size=0.8)+
  scale_colour_manual(values = c('orange','orange1','red1','red4','royalblue1','royalblue4','green','green3'), 
                       labels = c('BESM-OA / Fevereiro','BESM-OA / Setembro','GDFL-CM3.0 / Fevereiro','GDFL-CM3.0 / Setembro',
                                  'MPI-ESM-LR / Fevereiro','MPI-ESM-LR / Setembro',
                                  'NCAR-CCSM4.0 / Fevereiro','NCAR-CCSM4.0 / Setembro'), name="") +
  
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
#-------------------------------------ARTÍCO
#-----------------------------------------------------------------------------------------------------------------
#i1 <- read.table('/home/leticia/Downloads/BESM_all.txt')
#i1$V5 <- NULL
#i1$V6 <- NULL
i1 <- read.table('/home/leticia/Documentos/2020.1/leticia_dados_CMIP/dados_CMIP5/rcp_85/besm_arct_rcp_85.txt')
i2 <- read.table('/home/leticia/Documentos/2020.1/leticia_dados_CMIP/dados_CMIP5/rcp_85/gdfl_arct_rcp_85.txt')
i3 <- read.table('/home/leticia/Documentos/2020.1/leticia_dados_CMIP/dados_CMIP5/rcp_85/mpi_arct_rcp_85.txt')
i4 <- read.table('/home/leticia/Documentos/2020.1/leticia_dados_CMIP/dados_CMIP5/rcp_85/ncar_arct_rcp_85.txt')
#-----
i1 <- i1[-1,]
i2 <- i2[-1,]
i3 <- i3[-1,]
i4 <- i4[-1,]
#---- FEVEREIRO
ic <- data.frame(ano = i1$V2, mes=i1$V1, gdfl_fev=i2$V3, mpi_fev=i3$V3, ncar_fev = i4$V3, besm_fev = i1$V3)
ice_fev <- ic[ic$mes == "MAR",]
ice_fev$mes <- NULL
#---- SETEMBRO
ic1 <- data.frame(ano = i1$V2, mes=i1$V1, gdfl_set=i2$V3, mpi_set=i3$V3, ncar_set = i4$V3, besm_set = i1$V3)
ice_set <- ic1[ic1$mes == "SEP",]
ice_set$mes <- NULL
icec <- data.frame(ano = ice_fev$ano, besm_fev = ice_fev$besm_fev,
                   gdfl_fev = ice_fev$gdfl_fev, mpi_fev = ice_fev$mpi_fev, ncar_fev = ice_fev$ncar_fev,
                   besm_set = ice_set$besm_set,
                   gdfl_set = ice_set$gdfl_set, mpi_set = ice_set$mpi_set, ncar_set = ice_set$ncar_set)
#----
ice <- gather(data=icec, key = meses, 
              value = extensao, besm_fev, gdfl_fev, mpi_fev, ncar_fev, besm_set, gdfl_set, mpi_set, ncar_set)
ice$extensao <- as.numeric(as.character(ice$extensao))
ice$ano <- as.numeric(as.character(ice$ano))

#---- PLOT
sea_ice <- ggplot(ice, aes(x=ano,y=extensao)) +
  geom_line(aes(group = meses, colour = meses),size=0.8)+
  scale_colour_manual(values = c('orange','orange1','red1','red4','royalblue1','royalblue4','green','green3'), 
                      labels = c('BESM-OA / Março','BESM-OA / Setembro','GDFL-CM3.0 / Março','GDFL-CM3.0 / Setembro',
                                 'MPI-ESM-LR / Março','MPI-ESM-LR / Setembro',
                                 'NCAR-CCSM4.0 / Março','NCAR-CCSM4.0 / Setembro'), name="") +
  
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



