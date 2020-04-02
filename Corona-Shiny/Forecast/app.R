library(shiny)
library(shinydashboard) 
library(ggplot2)
library(httr)

library(zoo)



url <-"https://iam.bluemix.net/oidc/token"

data  <- "apikey=SN19sYaId9V78JgCQpLMB_WYg0u-CUUeBgTsgUUyKevJ&grant_type=urn:ibm:params:oauth:grant-type:apikey"
IBM_cloud_IAM_uid <- "bx"
IBM_cloud_IAM_pwd <- "bx"

auth = httr::authenticate(IBM_cloud_IAM_uid, IBM_cloud_IAM_pwd) 
print(auth)

res<-httr::POST(url, body=data, auth )
print(res) 

json <- jsonlite::fromJSON(httr::content(res, as = 'text', type = 'application/json', encoding = 'UTF-8'))
print(json$access_token) 
iam_token <- json$access_token


sales <- 500
title <- tags$a(href='https://dataplatform.cloud.ibm.com/dashboards/dce4dcfb-142d-45ff-8003-65d2ef221de3/view/7138b81f00b6119076ddc4e40790780779632d5ae6bbd70a80d17b490a342497f03d4196c82e4a5f8f130666fae8115a9b',
                icon("yellow"),
                'Corona Virus')

ui <- dashboardPage(
  
  dashboardHeader(title = title),
  dashboardSidebar(
    
    
    selectInput("country", "Country",
                list("UAE", "China", "Italy"),selected = "UAE"
                
    ),
    
    radioButtons("radio", label = h3("Select an Option"),
                 choices =  c("Confirmed" = 1,
                              "Recovered" = 2
                 ),selected = 1),
    
    # Copy the line below to make a date selector 
    dateInput("date", label = h5("Date"), value = "2020-03-10"),
    
    
    checkboxGroupInput("checkGroup", label = h3("Hospital Supplies"), 
                       choices = list("Hospital Beds" = 1, "ICU Beds" = 2),),
    
    
   
    
    
    
    sidebarMenu(
      
      
      
    )
  ),
  dashboardBody(
    
    
    fluidRow(
      
      
      valueBoxOutput("ibox"),
      valueBoxOutput("vbox"),
      valueBoxOutput("wbox")
    ),
    
    
    tags$head(
      tags$link(rel = "stylesheet", type = "text/css", href = "custom1.css")
    ),
    
    
    
    
    
    box(
      width = 40,
      height = 510,
      title = "Impact of Corona Virus on the country", background = "black", solidHeader = TRUE,
      plotOutput("lineChart")
    ),
    fluidRow(
      img(src='corona-pic.png',  height = 130, weight = 130),
      img(src='corona-pic.png', height = 130, weight = 130),
      img(src='corona-pic.png', height = 130, weight = 130),
      
      img(src='corona-pic.png', height = 130, weight = 130),
      img(src='corona-pic.png', height = 130, weight = 130),
      img(src='corona-pic.png', height = 130, weight = 130),
      img(src='corona-pic.png', height = 130, weight = 130),
      img(src='corona-pic.png', height = 130, weight = 130),
      img(src='corona-pic.png', height = 130, weight = 130),
      img(src='corona-pic.png', height = 130, weight = 130),
      img(src='corona-pic.png', height = 130, weight = 130)
      
      
      
      
    ),
    
    
    mainPanel(
      
      
    )   
    
  )
)

server <- function(input, output, session) {
  
 
  output$lineChart <- renderPlot({  
    
 
    
    if (input$country == "UAE"){
      if (input$radio == 1){
        payload1 <- paste0('{"fields":["SNo", "ObservationDate", "Province/State", "Country/Region", "Last Update", "Confirmed", "Deaths", "Recovered"],"values":[[',0, ',"', input$date, '","', "null", '","' ,"United Arab Emirates" , '","' ,"1-29-20 19:30", '",' ,"null", ',' ,"null", ',' ,"null", ']]}')  
        print(payload1) 
        
        ml_instance_id <- "4df5f8ca-a32f-4b4c-a18c-fa002053fc06" 
        results<-httr::POST('https://us-south.ml.cloud.ibm.com/v3/wml_instances/4df5f8ca-a32f-4b4c-a18c-fa002053fc06/deployments/89262ece-546c-4a85-a36c-cb6a662dd23b/online', body = payload1, add_headers("Content-Type"="application/json", "Authorization" = paste0("Bearer", iam_token), "ML-Instance-ID" = ml_instance_id ))
        print(results)
        jsonResults <- jsonlite::fromJSON(httr::content(results, as = 'text', type = 'application/json', encoding = 'UTF-8'))
        
        }
      
      else if(input$radio == 2){
        payload1 <- paste0('{"fields":["SNo", "ObservationDate", "Province/State", "Country/Region", "Last Update", "Confirmed", "Deaths", "Recovered"],"values":[[',0, ',"', input$date, '","', "null", '","' ,"United Arab Emirates" , '","' ,"1-29-20 19:30", '",' ,"null", ',' ,"null", ',' ,"null", ']]}')  
        print(payload1) 
        
        ml_instance_id <- "4df5f8ca-a32f-4b4c-a18c-fa002053fc06" 
        results<-httr::POST('https://us-south.ml.cloud.ibm.com/v3/wml_instances/4df5f8ca-a32f-4b4c-a18c-fa002053fc06/deployments/f9f34359-e04b-41ab-830a-bdb97d826995/online', body = payload1, add_headers("Content-Type"="application/json", "Authorization" = paste0("Bearer", iam_token), "ML-Instance-ID" = ml_instance_id ))
        print(results)
        jsonResults <- jsonlite::fromJSON(httr::content(results, as = 'text', type = 'application/json', encoding = 'UTF-8'))
        
      }
      

      
    }
    
    
    else if (input$country == "China"){
      if (input$radio == 1){
        payload1 <- paste0('{"fields":["SNo", "ObservationDate", "Province/State", "Country/Region", "Last Update", "Confirmed", "Deaths", "Recovered"],"values":[[',1, ',"', input$date, '","', "Hebei", '","' ,"Mainland China" , '","' ,"1/22/2020 17:00", '",' ,"null", ',' ,"null", ',' ,"null", ']]}')  
        print(payload1) 
        
        ml_instance_id <- "4df5f8ca-a32f-4b4c-a18c-fa002053fc06" 
        results<-httr::POST('https://us-south.ml.cloud.ibm.com/v3/wml_instances/4df5f8ca-a32f-4b4c-a18c-fa002053fc06/deployments/57e8a436-378d-4383-9fe0-bda5cfb43b03/online', body = payload1, add_headers("Content-Type"="application/json", "Authorization" = paste0("Bearer", iam_token), "ML-Instance-ID" = ml_instance_id ))
        print(results)
        jsonResults <- jsonlite::fromJSON(httr::content(results, as = 'text', type = 'application/json', encoding = 'UTF-8'))
        
      }
      
      else if(input$radio == 2){
        payload1 <- paste0('{"fields":["SNo", "ObservationDate", "Province/State", "Country/Region", "Last Update", "Confirmed", "Deaths", "Recovered"],"values":[[',1, ',"', input$date, '","', "Hebei", '","' ,"Mainland China" , '","' ,"1/22/2020 17:00", '",' ,"null", ',' ,"null", ',' ,"null", ']]}')  
        print(payload1) 
        
        ml_instance_id <- "4df5f8ca-a32f-4b4c-a18c-fa002053fc06" 
        results<-httr::POST('https://us-south.ml.cloud.ibm.com/v3/wml_instances/4df5f8ca-a32f-4b4c-a18c-fa002053fc06/deployments/765272a4-d860-4665-9285-1df6f2a46d41/online', body = payload1, add_headers("Content-Type"="application/json", "Authorization" = paste0("Bearer", iam_token), "ML-Instance-ID" = ml_instance_id ))
        print(results)
        jsonResults <- jsonlite::fromJSON(httr::content(results, as = 'text', type = 'application/json', encoding = 'UTF-8'))
        
      }
      
      
    }
    
    
    else if (input$country == "Italy"){
      if (input$radio == 1){
        payload1 <- paste0('{"fields":["SNo", "ObservationDate", "Province/State", "Country/Region", "Last Update", "Confirmed", "Deaths", "Recovered"],"values":[[',481, ',"', input$date, '","', "null", '","' ,"Italy" , '","' ,"1/31/2020 23:59", '",' ,"null", ',' ,"null", ',' ,"null", ']]}')  
        print(payload1) 
        
        ml_instance_id <- "4df5f8ca-a32f-4b4c-a18c-fa002053fc06" 
        results<-httr::POST('https://us-south.ml.cloud.ibm.com/v3/wml_instances/4df5f8ca-a32f-4b4c-a18c-fa002053fc06/deployments/5f9822ff-ca68-432a-8693-db3108ae9495/online', body = payload1, add_headers("Content-Type"="application/json", "Authorization" = paste0("Bearer", iam_token), "ML-Instance-ID" = ml_instance_id ))
        print(results)
        jsonResults <- jsonlite::fromJSON(httr::content(results, as = 'text', type = 'application/json', encoding = 'UTF-8'))
        
      }
      
      else if(input$radio == 2){
        payload1 <- paste0('{"fields":["SNo", "ObservationDate", "Province/State", "Country/Region", "Last Update", "Confirmed", "Deaths", "Recovered"],"values":[[',481, ',"', input$date, '","', "null", '","' ,"Italy" , '","' ,"1/31/2020 23:59", '",' ,"null", ',' ,"null", ',' ,"null", ']]}')  
        print(payload1) 
        
        ml_instance_id <- "4df5f8ca-a32f-4b4c-a18c-fa002053fc06" 
        results<-httr::POST('https://us-south.ml.cloud.ibm.com/v3/wml_instances/4df5f8ca-a32f-4b4c-a18c-fa002053fc06/deployments/fc86e265-61d9-4a60-8c0b-725fc90e19dc/online', body = payload1, add_headers("Content-Type"="application/json", "Authorization" = paste0("Bearer", iam_token), "ML-Instance-ID" = ml_instance_id ))
        print(results)
        jsonResults <- jsonlite::fromJSON(httr::content(results, as = 'text', type = 'application/json', encoding = 'UTF-8'))
        
      }
      
    }
    
    
    
    
    print(jsonResults) 
    
    
    dataFrame <- jsonResults$values 
    
    print(dataFrame)
    
    df = as.data.frame(jsonResults$values)
    colnames(df) = jsonResults$fields 
    
    
    colnames(df)[4] <- "Cases"  
    
    temp <<- df 
    
    df[[1]] = as.POSIXct(df[[1]], format = "%Y-%m-%d %H:%M %p UTC", tz = "GMT")
    df = data.frame(lapply(df, function(x){
      if (class(x)[1] == "factor"){
        as.numeric(x)
        print(x)
      } else {
        x  
      }
    }))
    print(str(df))
    
    temp2 <<- df
    df$ObservationDate <- as.factor(df$ObservationDate)
    df$Cases <- as.numeric(as.character(df$Cases))
    
    print(input$checkGroup)
    if(is.null(input$checkGroup)) 
    {
      ggplot(df, aes(ObservationDate, Cases, group=1)) +
        geom_point() +  #optional
        geom_line() 
      
    } 
    
    else if (all(c("1", "2") %in% input$checkGroup)){ 
      
      ggplot(df, aes(ObservationDate, Cases, group=1)) +
        geom_point() +  #optional
        geom_line() +
        geom_hline(yintercept=110, linetype="dashed", color = "red") +
        geom_hline(yintercept=70, linetype="dashed", color = "orange")
      
    }
    
    else if (input$checkGroup == "1"){ 
      
      ggplot(df, aes(ObservationDate, Cases, group=1)) +
        geom_point() +  #optional
        geom_line() +
        geom_hline(yintercept=110, linetype="dashed", color = "red")
      
    }
    
    else if (input$checkGroup == "2"){ 
      
      ggplot(df, aes(ObservationDate, Cases, group=1)) +
        geom_point() +  #optional
        geom_line() +
        
        geom_hline(yintercept=70, linetype="dashed", color = "orange")
      
    }
    
    
    
    

    
  
      
    #scale_x_date(breaks = df$ObservationDate)
    
   
    
  },height = 450, width = 1400)
  
  
  output$ibox <- renderValueBox({
    
    valueBox(
      paste0(823,479), "Total confirmed cases", icon = icon("fas fa-chart-line"),
      color = "blue"
      
    )
    
  })
  
  output$vbox <- renderValueBox({
    valueBox(
      
      paste0(174,019), "Total recovered cases", icon = icon("fas fa-heartbeat")
      
    )
  })
  
  output$wbox <- renderValueBox({
    valueBox(
      paste0(40,636), "Total death cases", icon = icon("fas fa-procedures"),
      color = "teal"
      
    )
  })
  
  
  
}

shinyApp(ui = ui, server = server)
