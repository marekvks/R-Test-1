library(forcats)
library(dplyr)

counties_by_nuts3 <- c("Praha", "Středočeský", "Jihočeský", "Plzeňský", "Karlovarský", "Ústecký", "Liberecký", "Královéhradecký", "Pardubický", "Vysočina", "Jihomoravský", "Olomoucký", "Zlínský", "Moravskoslezský")

nuts3_df <- school_dataset %>%
  mutate(nuts3 = fct_relevel(kraj, counties_by_nuts3)) %>%
  arrange(nuts3)