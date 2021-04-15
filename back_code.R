install.packages("rvest")

install.packages("shiny")

install.packages("tidyverse")

library(rvest)

library(stringr)

library(ggplot2)

library(shiny)


# 1) DATA ACQUISITION

# we want: price, rating

# CANTU

# scraping product name

name_ca <- read_html("https://www.lookfantastic.it/cantu-shea-butter-for-natural-hair-moisturizing-curl-activator-cream-355-ml/12042575.html")%>%
  html_nodes("#mainContent > div.newYorkProductPage_topRow > div.newYorkProductPage_lastColumn > div.newYorkProductPage_productDetailsContainer > div.newYorkProductPage_productName > div > h1")%>%
  html_text()

print(name_ca) 

# scraping product price

price_ca <- read_html("https://www.lookfantastic.it/cantu-shea-butter-for-natural-hair-moisturizing-curl-activator-cream-355-ml/12042575.html")%>%
  html_nodes("#mainContent > div.newYorkProductPage_topRow > div.newYorkProductPage_lastColumn > div.newYorkProductPage_productDetailsContainer > div.newYorkProductPage_productPrice > div > div > span > p")%>%
  html_text()

price_ca <-gsub('[\t\n\ ]', '', price_ca)

price_ca <- str_replace_all(price_ca, "€", "")

price_ca <- str_replace_all(price_ca, ",", ".")

print(price_ca)

#View(price_ca)

# scraping product rating

rating_ca <- read_html("https://www.lookfantastic.it/cantu-shea-butter-for-natural-hair-moisturizing-curl-activator-cream-355-ml/12042575.html")%>%
  html_nodes("#productReviewsComponent > div > div.productReviews_summary-columns > div.productReviews_summary-left > div > div.productReviews_aggregateRatingValueAndStars > span")%>%
  html_text()

rating_ca <-gsub('[\t\n\ ]', '', rating_ca)

# AVEDA

# scraping product name 

name_av <- read_html("https://www.lookfantastic.it/aveda-be-curly-curl-enhancer-200ml/10304622.html")%>%
  html_nodes("#mainContent > div.newYorkProductPage_topRow > div.newYorkProductPage_lastColumn > div.newYorkProductPage_productDetailsContainer > div.newYorkProductPage_productName > div > h1")%>%
  html_text()

# scraping product price

price_av <- read_html("https://www.lookfantastic.it/aveda-be-curly-curl-enhancer-200ml/10304622.html")%>%
  html_nodes("#mainContent > div.newYorkProductPage_topRow > div.newYorkProductPage_lastColumn > div.newYorkProductPage_productDetailsContainer > div.newYorkProductPage_productPrice > div > div > span > p")%>%
  html_text()

price_av <-gsub('[\t\n\ ]', '', price_av)

price_av <- str_replace_all(price_av, "€", "")

price_av <- str_replace_all(price_av, ",", ".")

# scraping product rating 

rating_av <- read_html("https://www.lookfantastic.it/aveda-be-curly-curl-enhancer-200ml/10304622.html")%>%
  html_nodes("#productReviewsComponent > div > div.productReviews_summary-columns > div.productReviews_summary-left > div > div.productReviews_aggregateRatingValueAndStars > span")%>%
  html_text()

rating_av <-gsub('[\t\n\ ]', '', rating_av)


# SHAE MOISTURE

# scraping product name 

name_sm <- read_html("https://www.lookfantastic.it/shea-moisture-raw-shea-cupuacu-frizz-defense-gel-cream-249ml/11446317.html#")%>%
  html_nodes("#mainContent > div.newYorkProductPage_topRow > div.newYorkProductPage_lastColumn > div.newYorkProductPage_productDetailsContainer > div.newYorkProductPage_productName > div > h1")%>%
  html_text()

#View(name_sm) 

# scraping product price

price_sm <- read_html("https://www.lookfantastic.it/shea-moisture-raw-shea-cupuacu-frizz-defense-gel-cream-249ml/11446317.html#")%>%
  html_nodes("#mainContent > div.newYorkProductPage_topRow > div.newYorkProductPage_lastColumn > div.newYorkProductPage_productDetailsContainer > div.newYorkProductPage_productPrice > div > div > span > p")%>%
  html_text()

price_sm <-gsub('[\t\n\ ]', '', price_sm)

price_sm <- str_replace_all(price_sm, "€", "")

price_sm <- str_replace_all(price_sm, ",", ".")


# scraping product rating 

rating_sm <- read_html("https://www.lookfantastic.it/shea-moisture-raw-shea-cupuacu-frizz-defense-gel-cream-249ml/11446317.html#")%>%
  html_nodes("#productReviewsComponent > div > div.productReviews_summary-columns > div.productReviews_summary-left > div > div.productReviews_aggregateRatingValueAndStars > span")%>%
  html_text()

rating_sm <-gsub('[\t\n\ ]', '', rating_sm)




# AS I AM

# scraping product name 

name_aia <- read_html("https://www.lookfantastic.it/as-i-am-curling-jelly-coil-and-curl-definer-227g/11321484.html")%>%
  html_nodes("#mainContent > div.newYorkProductPage_topRow > div.newYorkProductPage_lastColumn > div.newYorkProductPage_productDetailsContainer > div.newYorkProductPage_productName > div > h1")%>%
  html_text()

#View(name_aia) 

# scraping product price

price_aia <- read_html("https://www.lookfantastic.it/as-i-am-curling-jelly-coil-and-curl-definer-227g/11321484.html")%>%
  html_nodes("#mainContent > div.newYorkProductPage_topRow > div.newYorkProductPage_lastColumn > div.newYorkProductPage_productDetailsContainer > div.newYorkProductPage_productPrice > div > div > span > p")%>%
  html_text()

price_aia <-gsub('[\t\n\ ]', '', price_aia)

price_aia <- str_replace_all(price_aia, "€", "")

price_aia <- str_replace_all(price_aia, ",", ".")


# scraping product rating 

rating_aia <- read_html("https://www.lookfantastic.it/as-i-am-curling-jelly-coil-and-curl-definer-227g/11321484.html")%>%
  html_nodes("#productReviewsComponent > div > div.productReviews_summary-columns > div.productReviews_summary-left > div > div.productReviews_aggregateRatingValueAndStars > span")%>%
  html_text()

rating_aia <-gsub('[\t\n\ ]', '', rating_aia)



# dividing data based on type

# vectors

# the vector for product names

prod_names <- c(name_ca, name_av, name_sm, name_aia)

names(prod_names) <- c("Cantu", "Aveda", "Shae Moisture", "As I Am")


#View(prod_names)

#print(prod_names)


# the vector for prices

prices <- c(price_ca, price_av, price_sm, price_aia)

prices <- as.numeric(prices)

#View(prices)

#print(prices)



# the vector for ratings

ratings <- c(rating_ca, rating_av, rating_sm, rating_aia)

ratings <- as.numeric(ratings)

#View(ratings)

#print(ratings)

# vector for brands

brand_names <- c("Cantu", "Aveda", "Shae Moisture", "As I Am")


# making a data frame

mydata <- data.frame(prices, ratings)
print(mydata)

# making a list

mylist <- list("Prices", "Ratings")
print(mylist)


# 2) DATA VISUALIZATION

gg <- ggplot(mydata, aes(x = reorder(brand_names, -prices), y = prices, fill = brand_names)) + geom_bar(stat = "identity") + scale_fill_manual(values = c("orangered3", "orangered3", "forestgreen", "orangered3")) + labs(title="Price comparison across brands", x="Brands", y="Prices" ) + geom_text(aes(label=prices), vjust=1.6, color="white", size=5.5) + theme(plot.title = element_text(size = 30, face = "bold"), axis.text.x = element_text(size = 15), axis.text.y = element_text(size = 15), axis.title.x = element_text(size = 25), axis.title.y = element_text(size = 35) + theme_minimal())
print(gg)


gg1 <- ggplot(mydata, aes(x = reorder(brand_names, -ratings), y = ratings, fill = brand_names)) + geom_bar(stat = "identity") + scale_fill_manual(values = c("orangered3", "orangered3", "forestgreen", "orangered3")) + labs(title="Rating comparison across brands", x="Brands", y="Ratings" ) + geom_text(aes(label=ratings), vjust=1.6, color="white", size=5.5) + theme(plot.title = element_text(size = 30, face = "bold"), axis.text.x = element_text(size = 15), axis.text.y = element_text(size = 15), axis.title.x = element_text(size = 25), axis.title.y = element_text(size = 5) + theme_minimal())
print(gg1)


# 3) DATA ANALYSIS

# find the best price

best_price <- function(x){
  minimum <- min(x)
  return(minimum)
}

lowest_price <- best_price(prices)

print(lowest_price)

lowest_priced_brand <- function(x){
  for (i in x){
    if(i==8.45){print("The best priced brand is Cantu")}
    else{break}
  }
}

lowest_priced_brand(prices)

# find the best rating

best_rating <- function(x){
  maximum <- max(x)
  return(maximum)
}

highest_rating <- best_rating(ratings)

print(highest_rating)


best_rated_brand <- function(x){
  for (i in x){
    if(i==4.73){print("The best reviewed brand is Cantu")}
    else{break}
  }
}

best_rated_brand(ratings)

