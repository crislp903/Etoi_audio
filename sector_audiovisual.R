library(tidyverse)
library(rio)
library(lubridate)

## Armo lista con las bases usuarios de 3t 2015 a 4t 2019 ##



fechas <- seq(from = dmy('1/9/2015'), 
              length.out = length(list.files('etoi_1519')),
              by = 'quarter')


etoi_data <- map2_df(.x = list.files('etoi_1519'), .y = fechas, 
                     .f = ~ import(paste0('etoi_1519/',.x)) %>% 
                       filter(t37_cod_2 %in% c(5900, 6000)) %>% 
                       select(sexo, estado, t37_cod_2, categori) %>% 
                       mutate(date = .y))

