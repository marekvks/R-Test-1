library(forcats)
library(dplyr)

pocet_skol_kraj <- school_dataset %>%
  select(kraj) %>%
  count(kraj)

na_kraj <- school_dataset %>%
  filter(is.na(kraj == TRUE))

kraje_podle_nuts3 <- c("Praha", "Středočeský", "Jihočeský", "Plzeňský", "Karlovarský", "Ústecký", "Liberecký", "Královéhradecký", "Pardubický", "Vysočina", "Jihomoravský", "Olomoucký", "Zlínský", "Moravskoslezský")

kraj_vector = school_dataset["kraj"]

nuts3_kraj_df <- school_dataset %>%
  mutate(nuts3 = fct_relevel(kraj, kraje_podle_nuts3)) %>%
  arrange(nuts3)

kraje_podle_nuts2 <- c("Praha", "Střední Čechy", "Jihozápad", "Severozápad", "Severovýchod", "Jihovýchod", "Střední Morava", "Moravzskoslezsko")

nuts2_kraj_df <- nuts3_kraj_df %>%
  mutate(nuts2 = fct_recode(nuts3, "Střední_Čechy" = "Středočeský", "Jihozápad" = "Jihočeský", "Jihozápad" = "Plzeňský", "Severozápad" = "Karlovarský", "Severozápad" = "Ústecký", "Severovýchod" = "Liberecký", "Severovýchod" = "Královéhradecký", "Severovýchod" = "Pardubický", "Jihovýchod" = "Vysočina", "Jihovýchod" = "Jihomoravský", "Střední Morava" = "Olomoucký", "Střední Morava" = "Zlínský", "Moravskoslezsko" = "Moravskoslezský")) %>% 
  arrange(nuts2)

nuts32_df <- left_join(nuts3_kraj_df, nuts2_kraj_df)