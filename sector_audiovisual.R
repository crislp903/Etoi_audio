library(tidyverse)
library(rio)
library(lubridate)

## Armo lista con las bases usuarios de 3t 2015 a 4t 2019 ##
bases_etoi <- list()
bases_etoi$audiovisual <- c(5900, 6000)
bases_etoi$ind_315 <- import('Bases_datos/etoi_1519/etoi153_usu_ind.txt')
bases_etoi$ind_415 <- import('Bases_datos/etoi_1519/etoi154_usu_ind.txt')
bases_etoi$ind_116 <- import('Bases_datos/etoi_1519/etoi161_usu_ind.txt')
bases_etoi$ind_116 <- import('Bases_datos/etoi_1519/etoi161_usu_ind.txt')


fechas <- seq(from = dmy('1/9/2015'), 
              length.out = length(list.files('Bases_datos/etoi_1519')),
              by = 'quarter')

import('Bases_datos/etoi_1519/etoi153_usu_ind.txt') %>%
  filter(t37_cod_2 %in% c(5900, 6000)) %>% 
  select(sexo, estado, t37_cod_2)

etoi_data <- map2_df(.x = list.files('Bases_datos/etoi_1519'), .y = fechas, 
                     .f = ~ import(..x) %>% 
                       filter(t37_cod_2 %in% c(5900, 6000)) %>% 
                       select(sexo, estado, t37_cod_2) %>% 
                       mutate(date = ..y))
