#scraping data from Wikipedia about country
#help gathered from https://medium.com/@kyleake/wikipedia-data-scraping-with-r-rvest-in-action-3c419db9af2d

library("rvest")
library("magrittr")

url = 'https://en.wikipedia.org/wiki/List_of_countries_by_distribution_of_wealth'
url2 = html('https://en.wikipedia.org/wiki/List_of_countries_by_distribution_of_wealth')


df=url %>% read_html() %>% html_node(xpath = '//*[@id="mw-content-text"]/div/table[2]') %>% html_table(fill=TRUE)

View(df)

#reamoving empty row from df

df=df[2:152,]

write.csv(df,file="data.csv")

pc_wealth = as.numeric(df$`Wealth per capita`)
gini = as.numeric(df$`Wealth Gini`)

