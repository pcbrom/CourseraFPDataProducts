---
title: "Coursera Final Project Devel. Data Products"
author: "PEDRO CARVALHO BROM"
---

### **What do we have here?**

In this repository you will find the code for creating the Shiny application of [false vs. True](supermetrica.shinyapps.io/efarsas/)

There are only two files ui.R and server.R, which serve to evaluate how the page was built.

The predictive model links have been removed since the project is limited only to running a Shiny application.

### **About the prediction model used**

The technique used is logistic regression combined with machine learning. The intent is to calculate the probability of the news being true or false given your metrics of characters and words, using only the title and news information. The database was scraped from www.e-farsas.com and contains a total of 891 posts, of which approximately 74% are false. That is, according to the site we have more fake viral than true in circulating on the internet.

## **Additional model considerations**

In simpler terms we consider a 'good' model when its accuracy sensitivity and specificity are at least 80%. Therefore, we can consider that this model serves only as a 'joke of a guess'. The point that is bad is the classification of true news, because although the model is sensitive to information, the specificity is still very low and this implies in accusing true news as false. Kappa measurement is also important for a well-calibrated model. If it is close to 1 then the model is consistent with the training and test information.

### **Example usage**

Let's use this post as an example "China opens high bus!" . According to the website the original news is false.

Title: China opens high bus!

News: Chinese have inaugurated what would be a revolution in means of transport: A bus that passes over the cars, which can carry up to 1200 passengers! It will be? The news surfaced on several websites and portals in early August 2016 and shows a new concept in passenger transport: A high-speed bus that could carry up to 1200 passengers per trip and, because it was high, would leave the touring vehicles free to pass through Under him That is, the TEB-1, in addition to carrying hundreds of passengers, would still leave the streets and avenues free for touring vehicles. The photos of the inauguration of the "bus of the future" spread through the web and many people were curious to know if this is true or farce! Does this bus really exist?

Now just paste in the respective fields in the entries and click on 'Query' and wait approximately 15 seconds. Take the test with other news. (Up to 5 queries allowed)

