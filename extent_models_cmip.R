library(tidyverse)
library(dplyr)
library(tidyr)
library(readxl)
library(ggplot2)
library("RColorBrewer")
#-----------------------------------------------------------------------------------------------------------------
#-------------------------------------ANTÁRTICA
#-----------------------------------------------------------------------------------------------------------------
# ---- abrindo dados satélite ----
#ice_sate <- read_excel(
 # "/home/leticia/Documentos/recuperação/Sea_Ice_Index_Monthly_Data_by_Year_G02135_v3.0.xlsx", sheet = 3)
#ice_sate <- ice_sate[c(3:37),]
#---- ABRINDO ARQUIVOS
i1 <- read.table("/home/leticia/Documentos/2020.1/leticia_dados_CMIP/dados_CMIP5/GDFL/grads/GFDL_CM3_antar.txt") 
i2 <- read.table("/home/leticia/Documentos/2020.1/leticia_dados_CMIP/dados_CMIP5/MPI/grads/mpi_antar.txt")
i3 <- read.table("/home/leticia/Documentos/2020.1/leticia_dados_CMIP/dados_CMIP5/NCAR/grads/ncar_antar.txt")
i4 <- read.table("/home/leticia/Documentos/2020.1/leticia_dados_CMIP/dados_CMIP6/GDFL/grads/gdfl_antar.txt")
i5 <- read.table("/home/leticia/Documentos/2020.1/leticia_dados_CMIP/dados_CMIP6/MPI/grads/mpi_antar.txt")
i6 <- read.table("/home/leticia/Documentos/2020.1/leticia_dados_CMIP/dados_CMIP6/NCAR/grads/ncar_antar.txt")
i7 <- read.table("/home/leticia/Documentos/2020.1/leticia_dados_CMIP/satelite/sate_antar.txt")
i8 <- read.table("/home/leticia/Documentos/2020.1/leticia_dados_CMIP/dados_CMIP5/BESM/grads/besm_antar.txt")
#---- RETIRANDO O NOME DAS COLUNAS
i1 <- i1[-1,]
i2 <- i2[-1,]
i3 <- i3[-1,]
i4 <- i4[-1,]
i5 <- i5[-1,]
i6 <- i6[-1,]
i7 <- i7[-1,]
i8 <- i8[-1,]
#---- CRIANDO DATA.FRAME
ice_sic <- data.frame(mes = i1$V1, 
                      BESM_CMIP5 = i8$V3,
                      GDFL_CMIP5 = i1$V3, 
                      MPI_CMIP5 = i2$V3, 
                      NCAR_CMIP5 = i3$V3, 
                      GDFL_CMIP6 = i4$V3, 
                      MPI_CMIP6 = i5$V3, 
                      NCAR_CMIP6 = i6$V3,
                      SATELLITE = i7$V3)
ice_sic
#---- MANIPULANDO DATA.FRAME PARA O PLOT
sic <- gather(data = ice_sic, key = meses, 
              value = extensao,BESM_CMIP5,
              GDFL_CMIP5,MPI_CMIP5,NCAR_CMIP5,
              GDFL_CMIP6,MPI_CMIP6,NCAR_CMIP6,
              SATELLITE)
sic$extensao <- as.numeric(as.character(sic$extensao))
#---- AJUSTE EIXO X
sic$mes <- factor(sic$mes, 
                  levels = c("JAN", "FEB", "MAR", "APR", "MAY", "JUN", 
                             "JUL", "AUG", "SEP", "OCT", "NOV", "DEC"))
sic

#---- PLOT
sea_ice <- ggplot(sic, aes(x=sic$mes,y=sic$extensao)) +
  geom_line(aes(group = meses,linetype=meses, colour = meses),size=1)+
  #scale_linetype_manual(values = c("dotted","solid", "dotted","solid","dotted","solid"), name = "") +
  scale_colour_manual(values = c("orange",'red1','red4','royalblue1','royalblue4','green','green4','black'), 
                      labels = c("BESM-OA2.5",'GDFL-CM3.0','GDFL-CM4.0',
                                 'MPI-ESM-LR','MPI-ESM1.2-LR',
                                 'NCAR-CCSM4.0','NCAR-CESM2.0','Observado'),
                      name="") +
  scale_linetype_manual(values =  c("solid","solid","dashed","solid","dashed",
                                    "solid","dashed","solid"),
                        labels = c("BESM-OA2.5",'GDFL-CM3.0','GDFL-CM4.0',
                                   'MPI-ESM-LR','MPI-ESM1.2-LR',
                                   'NCAR-CCSM4.0','NCAR-CESM2.0','Observado'),
                        name="")+
    
  labs(x = "", 
       y = "SIE (x10⁶km²)",size = 10) + 
  ylim(-1,30) +
  theme_classic(base_size = 18) +
    theme( panel.border = element_rect(fill=NA,color="black", size=1.1, 
                                                                linetype="solid")
        )
sea_ice
#-----------------------------------------------------------------------------------------------------------------
#-------------------------------------ÁRTICO
#-----------------------------------------------------------------------------------------------------------------
#ice_sate <- read_excel(
 # "/home/leticia/Documentos/recuperação/Sea_Ice_Index_Monthly_Data_by_Year_G02135_v3.0.xlsx", sheet = 1)
#ice_sate <- ice_sate[c(3:37),]
#---- ABRINDO ARQUIVOS
i1 <- read.table("/home/leticia/Documentos/2020.1/leticia_dados_CMIP/dados_CMIP5/GDFL/grads/GFDL_CM3_arct.txt") 
i2 <- read.table("/home/leticia/Documentos/2020.1/leticia_dados_CMIP/dados_CMIP5/MPI/grads/mpi_arct.txt")
i3 <- read.table("/home/leticia/Documentos/2020.1/leticia_dados_CMIP/dados_CMIP5/NCAR/grads/ncar_arct.txt")
i4 <- read.table("/home/leticia/Documentos/2020.1/leticia_dados_CMIP/dados_CMIP6/GDFL/grads/gdfl_arct.txt")
i5 <- read.table("/home/leticia/Documentos/2020.1/leticia_dados_CMIP/dados_CMIP6/MPI/grads/mpi_arct.txt")
i6 <- read.table("/home/leticia/Documentos/2020.1/leticia_dados_CMIP/dados_CMIP6/NCAR/grads/ncar_arct.txt")
i7 <- read.table("/home/leticia/Documentos/2020.1/leticia_dados_CMIP/satelite/sate_arct.txt")
i8 <- read.table("/home/leticia/Documentos/2020.1/leticia_dados_CMIP/dados_CMIP5/BESM/grads/besm_arct.txt")
#---- RETIRANDO O NOME DAS COLUNAS
i1 <- i1[-1,]
i2 <- i2[-1,]
i3 <- i3[-1,]
i4 <- i4[-1,]
i5 <- i5[-1,]
i6 <- i6[-1,]
i7 <- i7[-1,]
i8 <- i8[-1,]
#---- CRIANDO DATA.FRAME
ice_sic <- data.frame(mes = i1$V1, 
                      BESM_CMIP5 = i8$V3,
                      GDFL_CMIP5 = i1$V3, 
                      MPI_CMIP5 = i2$V3, 
                      NCAR_CMIP5 = i3$V3, 
                      GDFL_CMIP6 = i4$V3, 
                      MPI_CMIP6 = i5$V3, 
                      NCAR_CMIP6 = i6$V3,
                      SATELLITE = i7$V3)
ice_sic
#---- MANIPULANDO DATA.FRAME PARA O PLOT
sic1 <- gather(data = ice_sic, key = meses, 
              value = extensao,BESM_CMIP5,
              GDFL_CMIP5,MPI_CMIP5,NCAR_CMIP5,
              GDFL_CMIP6,MPI_CMIP6,NCAR_CMIP6,
              SATELLITE)
sic1$extensao <- as.numeric(as.character(sic1$extensao))
#---- AJUSTE EIXO X
sic1$mes <- factor(sic1$mes, 
                  levels = c("JAN", "FEB", "MAR", "APR", "MAY", "JUN", 
                             "JUL", "AUG", "SEP", "OCT", "NOV", "DEC"))
sic1
#---- PLOT
sea_ice <- ggplot(sic1, aes(x=sic1$mes,y=sic1$extensao)) +
  geom_line(aes(group = meses,linetype=meses, colour = meses),size=1)+
  scale_colour_manual(values = c("orange",'red1','red4','royalblue1','royalblue4','green','green4','black'), 
                      labels = c("BESM-OA2.5",'GDFL-CM3.0','GDFL-CM4.0',
                                 'MPI-ESM-LR','MPI-ESM1.2-LR',
                                 'NCAR-CCSM4.0','NCAR-CESM2.0','Observado'),
                      name="") +
  scale_linetype_manual(values =  c("solid","solid","dashed","solid","dashed",
                                    "solid","dashed","solid"), 
                        labels = c("BESM-OA2.5",'GDFL-CM3.0','GDFL-CM4.0',
                        'MPI-ESM-LR','MPI-ESM1.2-LR',
                        'NCAR-CCSM4.0','NCAR-CESM2.0','Observado'),
                        name="")+
  labs(x = "", 
       y = "SIE (x10⁶km²)",size = 10) + 
  ylim(-1,30) +
  theme_classic(base_size = 18) +
  theme(panel.border = element_rect(fill=NA,color="black", size=1.1, 
                                                                linetype="solid")
  )
sea_ice

