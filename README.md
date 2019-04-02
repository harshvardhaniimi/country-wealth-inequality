# Why iPhone prices change across the borders?
iPhones need no introduction. However, their prices vary a lot across countries. For prices of iPhone in various countries, see appended file on prices. A little close inspection of the data gives an impression that iPhone is cheaper in high-income countries (or rich countries: you can call it what you want, they will give similar results), and expensive in low-income countries.

I wanted to test this relation statistically. My hunch said that they were charging poor countries higher and initial look at the data suggested that. This could be because they want to make iPhones have an elitist impression, with the exception of American consumers where they want everyone to get an iPhone. This could be due to hegemonic image of America in everyone's mind. We all consider America great!

Anyway, I started with the data. Got iPhone prices from https://iphone-worldwide.com, scrapped economic wealth data from Wikipedia, collected GDP data from IMF, and finally population density data from WB.

Correlation was around 40% for wealth per adult, wealth per capita, GDP per capita, and around 10% for Gini coefficient. My friend suggested to check the relation with population density, because he strongly believed that Apple would be increasing prices because of logistical reasons. Although I disagreed (Apple is too big to consider such small issues), but I checked for the correlation. It was around 37%. I then tried to fit linear model, but p-values were really bad. You can run all the codes, they're attached. I'm not totally satisfied with the results as there are still many anamolies in the plots. And 35 countries are not statistically significant, considering there are at least 150 countries where Apple would be present.

Data scraped from Wikipedia about 153 countries' economic wealth and inequality indicators. This is my first ever scraping. It was pretty simple one, once I found an online guide. I used "rvest" package in R to do this.

R codes, website snapshot and resulting CSV files are appended.
