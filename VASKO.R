install.packages("cfbfastR")
install.packages("dplyr")

library(cfbfastR)
library(dplyr)

# Register your API key first
Sys.setenv(CFBD_API_KEY = "your_unique_id_here")

# Pull all play-by-play data for Coastal Carolina's 2024 season
pbp_all <- cfbfastR::load_cfb_pbp(seasons = 2024)
vasko_plays <- pbp_all %>%
  filter(passer_player_name == "Ethan Vasko")

# Third Down completion% compared to Overall
vasko_third_down <- vasko_plays %>%
  filter(down == 3) %>%
  count(play_type, sort = TRUE)

# Success Rate
vasko_plays_success <- vasko_plays %>%
  mutate(
    success = case_when(
      down == 1 & yards_gained >= 0.4 * distance ~ 1,
      down == 2 & yards_gained >= 0.6 * distance ~ 1,
      down %in% c(3, 4) & yards_gained >= distance ~ 1,
      TRUE ~ 0
    )
  )

# Average Success Rate
mean(vasko_plays$success, na.rm = TRUE)

# Success Rate by Down
vasko_plays_success %>%
  group_by(down) %>%
  summarise(success_rate = mean(success, na.rm = TRUE))

# Success Rate for third and 4th
third_fourth_success_rate_vasko <- vasko_plays_success %>%
  filter(down %in% c(3, 4)) %>%
  summarise(success_rate = mean(success, na.rm = TRUE))

print(third_fourth_success_rate_vasko)

# Creates dataset to view QB EPA/Play for passers with one hundred and fifty+ passes
qb_epa_per_play <- pbp_all %>%
  filter(!is.na(passer_player_name), !is.na(EPA)) %>%
  group_by(passer_player_name) %>%
  summarise(
    total_plays = n(),
    total_epa = sum(EPA),
    epa_per_play = mean(EPA)
  ) %>%
  filter(total_plays >= 150) %>%
  arrange(desc(epa_per_play))

epa_per_play <- mean(vasko_plays$EPA, na.rm = TRUE)
print(epa_per_play)

# Average Yards per Completion
vasko_avg_yds_per_completion <- vasko_plays %>%
  filter(completion == 1, !is.na(yards_gained)) %>%
  summarise(
    completions = n(),
    total_yards = sum(yards_gained),
    avg_yards_per_completion = total_yards / completions
  )

# Completion Buckets
vasko_completion_buckets <- vasko_plays %>%
  filter(completion == 1, !is.na(yards_gained)) %>%
  mutate(
    yardage_bucket = case_when(
      yards_gained >= 1 & yards_gained <= 3  ~ "1–3 yards",
      yards_gained >= 4 & yards_gained <= 6  ~ "4–6 yards",
      yards_gained >= 7 & yards_gained <= 10 ~ "7–10 yards",
      yards_gained > 10                      ~ "10+ yards",
      TRUE                                   ~ "0 or negative"
    )
  ) %>%
  count(yardage_bucket) %>%
  mutate(percentage = round(100 * n / sum(n), 1)) %>%
  arrange(desc(n))
