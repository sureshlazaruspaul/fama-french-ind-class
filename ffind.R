
library(sqldf)

gitpath <- "https://raw.githubusercontent.com/sureshlazaruspaul/"

ffind <- fread(paste0(gitpath, "fama-french-ind-class/main/ffind.csv")) %>%
  filter(ind_def == 48)

# SQL merge - merge by range ...
data <- sqldf("
              select data.*, ffind.class 
                from data LEFT JOIN ffind on 
                  (data.hsiccd >= ffind.sic_start and 
                    data.hsiccd <= ffind.sic_end)
              ", stringsAsFactors = FALSE); rm("ffind")

