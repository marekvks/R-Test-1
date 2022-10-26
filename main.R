library(forcats)
library(dplyr)

# Calculating sum of schools in each county
sum_schools_county_df <- school_dataset %>%
  select(kraj) %>%
  count(kraj, name = "school_total", sort = TRUE)

# Getting NA county
na_county_df <- school_dataset %>%
  filter(is.na(kraj == TRUE))

# Calculating the sum of students in counties
student_per_county_df <- school_dataset %>%
  group_by(kraj) %>%
  summarize(student_count = sum(pocet_zaku))

# Calculating the sum of students in nuts2
student_per_nuts2_df <- nuts2_df %>%
  group_by(nuts2) %>%
  summarize(student_count = sum(pocet_zaku))

student_per_assistant_by_county_df <- nuts2_df %>%
  group_by(kraj) %>%
  summarize(student_count = sum(pocet_zaku),
            assistant_count = sum(pocet_asistentu)) %>%
  mutate(student_per_assistant = student_count / assistant_count)

student_per_assistant_by_nuts2_df <- nuts2_df %>%
  group_by(nuts2) %>%
  summarize(student_count = sum(pocet_zaku),
            assistant_count = sum(pocet_asistentu)) %>%
  mutate(student_per_assistant = student_count / assistant_count)

average_students_without_psycholog <- school_dataset %>%
  filter(psycholog == "ne") %>%
  summarize(avg_students_without_psycholog = mean(pocet_zaku))

average_students_with_without_psycholog <- school_dataset %>%
  filter(psycholog == "ano") %>%
  summarize(avg_students_with_psycholog = mean(pocet_zaku))

average_students_without_psycholog <- school_dataset %>%
  filter(spec_pedagog == "ne") %>%
  summarize(avg_students_without_sp_pedagog = mean(pocet_zaku))

average_students_with_without_psycholog <- school_dataset %>%
  filter(spec_pedagog == "ano") %>%
  summarize(avg_students_with_sp_pedagog = mean(pocet_zaku))

school_with_psycholog_pedagog <- school_dataset %>%
  filter(psycholog == "ano" | spec_pedagog == "ano") %>%
  count(kraj, name = "school_with_ped_or_psych", sort = TRUE)

school_with_psycholog_pedagog_percentage <- left_join(sum_schools_county_df, school_with_psycholog_pedagog) %>%
  group_by(kraj) %>%
  mutate(percentage = school_with_ped_or_psych / (school_total / 100))