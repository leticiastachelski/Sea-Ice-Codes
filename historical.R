library(tidyverse)
library(dplyr)
library(tidyr)
library(readxl)
library(ggplot2)
library("RColorBrewer")
#-----------------------------------------------------------------------------------------------------------------
#-------------------------------------ANTÁRTICA
#-----------------------------------------------------------------------------------------------------------------
i1 <- read.table('/home/leticia/Documentos/2020.1/leticia_dados_CMIP/dados_CMIP5/historical/gdfl_antar.txt')
i2 <- read.table('/home/leticia/Documentos/2020.1/leticia_dados_CMIP/dados_CMIP5/historical/mpi_antar.txt')
i3 <- read.table('/home/leticia/Documentos/2020.1/leticia_dados_CMIP/dados_CMIP5/historical/ncar_antar.txt')
i4 <- read.table('/home/leticia/Documentos/2020.1/leticia_dados_CMIP/dados_CMIP5/historical/besm_antar.txt')
i5 <- read.table('/home/leticia/Documentos/2020.1/leticia_dados_CMIP/satelite/cmip6/sate_antar_cmip5.txt')
  #-----
i1 <- i1[-1,]
i2 <- i2[-1,]
i3 <- i3[-1,]
i4 <- i4[-1,]
i5 <- i5[-1,]
#---- FEVEREIRO
ic <- data.frame(ano = i1$V2, mes=i1$V1, gdfl_fev=i1$V3, mpi_fev=i2$V3, ncar_fev = i3$V3, besm_fev = i4$V3, sate_fev= i5$V3)
ice_fev <- ic[ic$mes == "FEB",]
ice_fev$mes <- NULL
#---- SETEMBRO
ic1 <- data.frame(ano = i1$V2, mes=i1$V1, gdfl_set=i1$V3, mpi_set=i2$V3, ncar_set = i3$V3, besm_set = i4$V3, sate_set= i5$V3)
ice_set <- ic1[ic1$mes == "SEP",]
ice_set$mes <- NULL
icec <- data.frame(ano = ice_fev$ano, 
                   besm_fev = ice_fev$besm_fev,
                   gdfl_fev = ice_fev$gdfl_fev, mpi_fev = ice_fev$mpi_fev, ncar_fev = ice_fev$ncar_fev, sate_fev = ice_fev$sate_fev,
                   besm_set = ice_set$besm_set,
                   gdfl_set = ice_set$gdfl_set, mpi_set = ice_set$mpi_set, ncar_set = ice_set$ncar_set, sate_set = ice_set$sate_set)
#----
ice <- gather(data=icec, key = meses, 
              value = extensao, besm_fev, gdfl_fev, mpi_fev, ncar_fev,sate_fev,
              besm_set, gdfl_set, mpi_set, ncar_set,sate_set)
ice$extensao <- as.numeric(as.character(ice$extensao))
# #----
 ice$ano <- as.numeric(as.character(ice$ano))
#icec$sate_fev <- as.numeric(as.character(icec$sate_fev))
#icec$besm_fev <- as.numeric(as.character(icec$besm_fev))
#summary(icec$sate_fev)
#cora <- cor.test(icec$besm_fev, icec$sate_fev, method = "pearson", conf.level = 0.95)
#cora
###library(purrr)
###lm1 <- lm(sate_fev ~ besm_fev ,icec)
###summary(ice)
# icec$gdfl_fev <- as.numeric(as.character(icec$gdfl_fev))
# sd(icec$gdfl_fev)
# var(icec$gdfl_fev)
# icec$mpi_fev <- as.numeric(as.character(icec$mpi_fev))
# sd(icec$mpi_fev)
# var(icec$mpi_fev)
# icec$ncar_fev <- as.numeric(as.character(icec$ncar_fev))
# sd(icec$ncar_fev)
# var(icec$ncar_fev)
# #----
# icec$gdfl_set <- as.numeric(as.character(icec$gdfl_set))
# sd(icec$gdfl_set)
# var(icec$gdfl_set)
# icec$mpi_set <- as.numeric(as.character(icec$mpi_set))
# sd(icec$mpi_set)
# var(icec$mpi_set)
# icec$ncar_set <- as.numeric(as.character(icec$ncar_set))
# sd(icec$ncar_set)
# var(icec$ncar_set)
#----
# icec$besm_fev <- as.numeric(as.character(icec$besm_fev))
# sd(icec$besm_fev)
# var(icec$besm_fev)
# icec$besm_set <- as.numeric(as.character(icec$besm_set))
# sd(icec$besm_set)
# var(icec$besm_set)
#---- PLOT
values <- c('orange','#fd8d3c','red1','red4','royalblue1','royalblue4','green','green3','#555555','black')
sea_ice <- ggplot(ice, aes(x=ano,y=extensao)) +
  geom_line(aes(group = meses, linetype = meses, colour = meses),size=0.8)+
  stat_smooth(aes(x = ano, y = extensao, group = meses), 
              method = "lm", formula = y ~ x, se = FALSE, linetype = "dashed",
              colour = "black", size =0.3) +
  scale_colour_manual(values = values, 
                      labels = c('BESM-OA / Fevereiro','BESM-OA / Setembro',
                                 'GDFL-CM3.0 / Fevereiro','GDFL-CM3.0 / Setembro',
                                 'MPI-ESM-LR / Fevereiro','MPI-ESM-LR / Setembro',
                                 'NCAR-CCSM4.0 / Fevereiro','NCAR-CCSM4.0 / Setembro',
                                 'Observado-Fevereiro','Observado-Setembro'), name="") +
  
 scale_linetype_manual(values=c("solid","solid","solid","solid",
                                "solid","solid","solid","solid","dashed","dashed"),
                       labels = c('BESM-OA / Fevereiro','BESM-OA / Setembro',
                                  'GDFL-CM3.0 / Fevereiro','GDFL-CM3.0 / Setembro',
                                  'MPI-ESM-LR / Fevereiro','MPI-ESM-LR / Setembro',
                                  'NCAR-CCSM4.0 / Fevereiro','NCAR-CCSM4.0 / Setembro',
                                  'Observado-Fevereiro','Observado-Setembro'),name="") +
   labs(title = "",
       x = "", 
       y = "SIE (x10⁶km²)",size = 5) + 
  ylim(-1,31) + 
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
i1 <- read.table('/home/leticia/Documentos/2020.1/leticia_dados_CMIP/dados_CMIP5/historical/gdfl_arct.txt')
i2 <- read.table('/home/leticia/Documentos/2020.1/leticia_dados_CMIP/dados_CMIP5/historical/mpi_arct.txt')
i3 <- read.table('/home/leticia/Documentos/2020.1/leticia_dados_CMIP/dados_CMIP5/historical/ncar_arct.txt')
i4 <- read.table('/home/leticia/Documentos/2020.1/leticia_dados_CMIP/dados_CMIP5/historical/besm_arct.txt')
i5 <- read.table('/home/leticia/Documentos/2020.1/leticia_dados_CMIP/satelite/cmip6/sate_arct_cmip5.txt')
#-----
i1 <- i1[-1,]
i2 <- i2[-1,]
i3 <- i3[-1,]
i4 <- i4[-1,]
i5 <- i5[-1,]
#---- FEVEREIRO
ic <- data.frame(ano = i1$V2, mes=i1$V1, gdfl_fev=i1$V3, mpi_fev=i2$V3, ncar_fev = i3$V3, besm_fev = i4$V3,sate_fev=i5$V3)
ice_fev <- ic[ic$mes == "MAR",]
ice_fev$mes <- NULL
#---- SETEMBRO
ic1 <- data.frame(ano = i1$V2, mes=i1$V1, gdfl_set=i1$V3, mpi_set=i2$V3, ncar_set = i3$V3, besm_set = i4$V3,sate_set=i5$V3)
ice_set <- ic1[ic1$mes == "SEP",]
ice_set$mes <- NULL
icec <- data.frame(ano = ice_fev$ano, 
                   besm_fev = ice_fev$besm_fev,
                   gdfl_fev = ice_fev$gdfl_fev, mpi_fev = ice_fev$mpi_fev, ncar_fev = ice_fev$ncar_fev, sate_fev=ice_fev$sate_fev,
                   besm_set = ice_set$besm_set,
                   gdfl_set = ice_set$gdfl_set, mpi_set = ice_set$mpi_set, ncar_set = ice_set$ncar_set,sate_set=ice_set$sate_set)
#----
ice <- gather(data=icec, key = meses, 
              value = extensao, besm_fev, gdfl_fev, mpi_fev, ncar_fev,sate_fev, besm_set, gdfl_set, mpi_set, ncar_set,sate_set)
ice$extensao <- as.numeric(as.character(ice$extensao))
ice$ano <- as.numeric(as.character(ice$ano))
#----
#----
ice$ano <- as.numeric(as.character(ice$ano))
# icec$gdfl_fev <- as.numeric(as.character(icec$gdfl_fev))
# sd(icec$gdfl_fev)
# var(icec$gdfl_fev)
# icec$mpi_fev <- as.numeric(as.character(icec$mpi_fev))
# sd(icec$mpi_fev)
# var(icec$mpi_fev)
# icec$ncar_fev <- as.numeric(as.character(icec$ncar_fev))
# sd(icec$ncar_fev)
# var(icec$ncar_fev)
# #----
# icec$gdfl_set <- as.numeric(as.character(icec$gdfl_set))
# sd(icec$gdfl_set)
# var(icec$gdfl_set)
# icec$mpi_set <- as.numeric(as.character(icec$mpi_set))
# sd(icec$mpi_set)
# var(icec$mpi_set)
# icec$ncar_set <- as.numeric(as.character(icec$ncar_set))
# sd(icec$ncar_set)
# var(icec$ncar_set)
# #----
# icec$besm_fev <- as.numeric(as.character(icec$besm_fev))
# sd(icec$besm_fev)
# var(icec$besm_fev)
# icec$besm_set <- as.numeric(as.character(icec$besm_set))
# sd(icec$besm_set)
# var(icec$besm_set)
#----
# icec$besm_fev <- as.numeric(as.character(icec$besm_fev))
# sd(icec$besm_fev)
# var(icec$besm_fev)
# icec$besm_set <- as.numeric(as.character(icec$besm_set))
# sd(icec$besm_set)
# var(icec$besm_set)
#---- PLOT
sea_ice <- ggplot(ice, aes(x=ano,y=extensao)) +
  geom_line(aes(group = meses,linetype=meses, colour = meses),size=0.8)+
  stat_smooth(aes(x = ano, y = extensao, group = meses), 
              method = "lm", formula = y ~ x, se = FALSE, linetype = "dashed",
              colour = "black", size =0.3) +
  scale_colour_manual(values = c('orange','#fd8d3c','red1','red4','royalblue1','royalblue4','green','green3','#555555','black'), 
                      labels = c('BESM-OA / Março','BESM-OA / Setembro','GDFL-CM3.0 / Março','GDFL-CM3.0 / Setembro',
                                 'MPI-ESM-LR / Março','MPI-ESM-LR / Setembro',
                                 'NCAR-CCSM4.0 /Março','NCAR-CCSM4.0 / Setembro','Observado-Março','Observado-Setembro'), name="") +
  
  scale_linetype_manual(values = c("solid","solid","solid","solid",
                                   "solid","solid","solid","solid","dashed","dashed"), 
                        labels=c('BESM-OA / Março','BESM-OA / Setembro','GDFL-CM3.0 / Março','GDFL-CM3.0 / Setembro',
                                            'MPI-ESM-LR / Março','MPI-ESM-LR / Setembro',
                                            'NCAR-CCSM4.0 /Março','NCAR-CCSM4.0 / Setembro','Observado-Março','Observado-Setembro'),name="")+
   labs(title = "",
       x = "", 
       y = "SIE (x10⁶km²)",size = 5) + 
  ylim(-1,31) + 
  theme_classic(base_size = 20) +
  theme(#legend.position=c(.75,.80),
    #legend.text=element_text(size=10),
    # axis.text.x = element_text(angle = 45, hjust = 1),
    panel.border = element_rect(fill=NA,color="black", size=1.1, 
                                linetype="solid"))
sea_ice
