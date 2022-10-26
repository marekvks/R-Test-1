library(forcats)
library(dplyr)

counties_by_nuts3 <- c("Praha", "Středočeský", "Jihočeský", "Plzeňský", "Karlovarský", "Ústecký", "Liberecký", "Královéhradecký", "Pardubický", "Vysočina", "Jihomoravský", "Olomoucký", "Zlínský", "Moravskoslezský")

nuts3_df <- school_dataset %>%
  mutate(nuts3 = fct_relevel(kraj, counties_by_nuts3)) %>%
  arrange(nuts3)

nuts32_df <- nuts3_df %>%
  mutate(nuts2 = fct_recode(nuts3, "Střední Čechy" = "Středočeský", "Jihozápad" = "Jihočeský", "Jihozápad" = "Plzeňský", "Severozápad" = "Karlovarský", "Severozápad" = "Ústecký", "Severovýchod" = "Liberecký", "Severovýchod" = "Královéhradecký", "Severovýchod" = "Pardubický", "Jihovýchod" = "Vysočina", "Jihovýchod" = "Jihomoravský", "Střední Morava" = "Olomoucký", "Střední Morava" = "Zlínský", "Moravskoslezsko" = "Moravskoslezský")) %>% 
  arrange(nuts2)

rm(nuts3_df)