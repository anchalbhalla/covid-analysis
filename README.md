# covid-analysis
This project shows how to use the full IBM Watson Studio suite to build a solution for health care clients and organizations such as National Emergency and Crisis to evaluate and plan the covid-19 pandemic

# COVID Analyzer - COVID-19 Trend Analysis and Visualization
![alt text](https://github.com/anchalbhalla/covid-analysis/blob/master/images/header.png)

## Description 
Navigating our new world in this time of crisis is not easy. Healthcare and emergency organizations need to be aware of the current situation for 2 main reason: 
1. Planning out healthcare and other supplies by forecasting the trend and take the necessary actions as precautions.
2. Be more aware of the situation in the country plus globally to track critical countries and times.

The project aims to solve the following <strong>business problems</strong>: 
1. What's next? A pandemic as such usually leaves governments and healthcare officials confused as to what would be the effect of this and is going to happen in the future. 
2. Future planning - Organizations need to plan out the necessary precautions by looking at the current situation and the predicted situation.

![alt text](https://github.com/anchalbhalla/covid-analysis/blob/master/images/problems.png)


The COVID analyzer project aims to ease the task of these critical organisations so authories can focus more on planning and treatments. It uses data from all across the globe to visualize the current situation in a very interactive manner using <strong>Cognos Dashboards</strong> which gives them the customization option as well. Next, <strong>AI models</strong> have been deployed to a <strong>shiny application</strong> which show the forecast of the coronavirus spread in critial countries - UAE, Italy and China. These models have been created using <strong>SPSS</strong> to show the quick, efficient and accurate methods on Watson Studio.


## Products used: 
- Watson studio: 
  - Data refinery 
  - Cognos Dashboards 
  - SPSS
  - WML (Watson Machine Learning) 
  - R Studio - Shiny application


## Data Science Pipeline  
The general data science pipeline was followed to evaluate the covid-19 results.

![alt text](https://github.com/anchalbhalla/covid-analysis/blob/master/images/pipeline.png)

### Data preparation 
Data Source: Daily Covid-19 reports by John Hopkins - https://github.com/CSSEGISandData/COVID-19/tree/master/csse_covid_19_data/csse_covid_19_daily_reports

The data is all over the place and it can get very overwhelming to extract and use the right ones. For the procress I used Excel and Data refinery to get data for the latest dates globally for the dashboarding part. And for the time series models I got data only for UAE, China and Italy for all the dates.


### Data Exploration - Cognos Dashboard Visualizations 
Below is a representation of the dashboard I created. You can access the dashboard over here to try it out on your own: https://dataplatform.cloud.ibm.com/dashboards/91e629de-7a3c-4280-97d9-b3d45dd1c2f2/view/5c12a50e3b936dc54edec4e40790780779632d5ae6bbd70a80d17b490a342497f03d4196c82e4a5f8f130666fae8115a9b 

![alt text](https://github.com/anchalbhalla/covid-analysis/blob/master/images/dashboard-pic.png)

The  dashboard shows all the confirmed cases till now in different countries accross the globe. If if you hover over any point, it will show you the confirmed cases in that particular country. It also, shows the deaths, recovered and confrimed cases for each country. Cognos provides a very interactive feel, you can click on any country and monitor the situation of it. 


![alt text](https://github.com/anchalbhalla/covid-analysis/blob/master/images/dashboard1.gif)

Another map is a comparion between of the number of cases in critical countries: UAE, Italy and China in the span of 2 months. We can see that the numbers are increasing expontially in Italy and China. And the graph is more linear when it comes to UAE.


![alt text](https://github.com/anchalbhalla/covid-analysis/blob/master/images/dashboard2.gif)

### AI Models - Trend Analysis (Forecasting)
Looking at the current situation a dashboard will only tell us what is happening in the present but what about the future? I have created 6 models on SPSS for 3 countries UAE Italy and China to forecast the confirmed and recovered cases. 

The models were created using Arima time series models on SPSS, to show the forecast for the next 15 days while spotting at any outliers, seasonal changes, etc. Below is a model created for confirmed cases in UAE 

![alt text](https://github.com/anchalbhalla/covid-analysis/blob/master/images/spss-pipeline.png)

The output of the model shows the current sitaution with a predicted graph. It shows the forecasted number of cases.

![alt text](https://github.com/anchalbhalla/covid-analysis/blob/master/images/spss-graph.png)

### Shiny Application
Now to show the output of all the models in an interactive way for the health officials to use, an R shiny app. Below you can see the confirmed cases for the countries UAE, Italy and China. You can see that for Italy and China the growth is very expontential whereas for UAE its growing in a linear manner which is a good sign. 

![alt text](https://github.com/anchalbhalla/covid-analysis/blob/master/images/corona-confimed.gif)

If we look at the recovery, its going to continue to have a linear growth for all the countries. 

![alt text](https://github.com/anchalbhalla/covid-analysis/blob/master/images/corona-recovered.gif)

Now lets say we want to check if we want to plan our hospital supplies- hospital beds and ICU beds to accomadate the increasing numbers we can simply check the boxes to see what is lacking 

![alt text](https://github.com/anchalbhalla/covid-analysis/blob/master/images/corona-hospital.gif)


## Conclusion 
The project can easily be replicated by using the files in this repositary. Create a watson studio instance and upload the SPSS files to create the time series models. Download the R project to run the app. 
