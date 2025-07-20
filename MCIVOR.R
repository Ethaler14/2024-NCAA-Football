library(cfbfastR)
library(dplyr)

# Register your API key first
Sys.setenv(CFBD_API_KEY = "idGgsiw9QBmtMJUDN6FkEWnOQE9fGyItig2D8RbH/nFqGCkKj7bULQdPq+ayhvoW")

# Pull all play-by-play data for Abilene Christian's 2024 season
pbp_all <- cfbfastR::load_cfb_pbp(seasons = 2024)
McIvor_plays <- pbp_all %>%
  filter(passer_player_name == "Maverick McIvor")

missing_game <- read.csv("~/Desktop/download.csv")

McIvor_plays <- bind_rows(McIvor_plays, missing_game)

mcivor_third_down <- McIvor_plays %>%
  filter(down == 3) %>%
  count(play_type, sort = TRUE)

mcivor_third_down

mcivor_plays_success <- McIvor_plays %>%
  mutate(
    success = case_when(
      down == 1 & yards_gained >= 0.4 * distance ~ 1,
      down == 2 & yards_gained >= 0.6 * distance ~ 1,
      down %in% c(3, 4) & yards_gained >= distance ~ 1,
      TRUE ~ 0
    )
  )

mean(McIvor_plays$success, na.rm = TRUE)

mcivor_plays_success %>%
  group_by(down) %>%
  summarise(success_rate = mean(success, na.rm = TRUE))

third_fourth_success_rate_mcivor <- mcivor_plays_success %>%
  filter(down %in% c(3, 4)) %>%
  summarise(success_rate = mean(success, na.rm = TRUE))

print(third_fourth_success_rate_mcivor)