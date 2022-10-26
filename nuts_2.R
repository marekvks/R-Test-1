library(forcats)
library(dplyr)

nuts2_df <- nuts3_df %>%
  mutate(nuts2 = fct_recode(nuts3, "Střední_Čechy" = "Středočeský", "Jihozápad" = "Jihočeský", "Jihozápad" = "Plzeňský", "Severozápad" = "Karlovarský", "Severozápad" = "Ústecký", "Severovýchod" = "Liberecký", "Severovýchod" = "Královéhradecký", "Severovýchod" = "Pardubický", "Jihovýchod" = "Vysočina", "Jihovýchod" = "Jihomoravský", "Střední Morava" = "Olomoucký", "Střední Morava" = "Zlínský", "Moravskoslezsko" = "Moravskoslezský")) %>% 
  arrange(nuts2)