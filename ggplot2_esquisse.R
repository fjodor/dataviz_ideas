## ggplot mit grafischer Oberfläche: esquisse

library(tidyverse)

all_songs <- read_csv(file = "chart2000-songyear-0-3-0062.csv",
                      na = c("", "-"))
attr(all_songs, "spec") <- NULL

top_artists <- all_songs %>%
  group_by(artist) %>%
  summarise(total_score = sum(indicativerevenue)) %>% 
  arrange(desc(total_score)) %>% 
  head(n = 5) %>% 
  pull(artist)

songs <- all_songs %>% 
  filter(artist %in% top_artists) %>% 
  mutate(artist = fct_infreq(artist),
         indicativerevenue = round(indicativerevenue))

esquisse::esquisser()

library(esquisse)
esquisser()

