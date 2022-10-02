Coursera Fitabase Data Case Study
================
Joseph Lennan
2022-09-28

# Explanation

The goal of this case study for the Google Analytics Certificate is to
analyze the provided smart fitness data to provide insight into trends
and potential opportunities with Bellabeat’s current products in mind.

# Documentation

Documentation of Data
<https://www.fitabase.com/media/1930/fitabasedatadictionary102320.pdf>
Distance in Kilometers Calories is Calories burned

\#Data Import & Prep

``` r
#Get Dataframes

sleepDay = myfiles$sleepDay_merged.csv
dailyActivity = myfiles$dailyActivity_merged.csv
dailyIntensities = myfiles$dailyIntensities_merged.csv
dailySteps = myfiles$dailySteps_merged.csv
dailyCalories = myfiles$dailyCalories_merged.csv
hourlyCalories = myfiles$hourlyCalories_merged.csv
hourlyIntensities = myfiles$hourlyIntensities_merged.csv
weightLog = myfiles$weightLogInfo_merged.csv
```

\#Data Examination

``` r
#Skim Data for key observations & potential flaws

sleepDay %>%
  select(TotalSleepRecords,
         TotalMinutesAsleep,
         TotalTimeInBed
  ) %>%
  skim_without_charts()
```

|                                                  |            |
|:-------------------------------------------------|:-----------|
| Name                                             | Piped data |
| Number of rows                                   | 413        |
| Number of columns                                | 3          |
| \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_   |            |
| Column type frequency:                           |            |
| numeric                                          | 3          |
| \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_ |            |
| Group variables                                  | None       |

Data summary

**Variable type: numeric**

| skim_variable      | n_missing | complete_rate |   mean |     sd |  p0 | p25 | p50 | p75 | p100 |
|:-------------------|----------:|--------------:|-------:|-------:|----:|----:|----:|----:|-----:|
| TotalSleepRecords  |         0 |             1 |   1.12 |   0.35 |   1 |   1 |   1 |   1 |    3 |
| TotalMinutesAsleep |         0 |             1 | 419.47 | 118.34 |  58 | 361 | 433 | 490 |  796 |
| TotalTimeInBed     |         0 |             1 | 458.64 | 127.10 |  61 | 403 | 463 | 526 |  961 |

``` r
#Mean 419 Min Asleep, 39.2 Mean Extra Minutes in Bed
#Standard Deviations seem high, ~68% of people take ~86 minutes to go to bed?
#Might be counting time after waking and still lying in bed?



dailyActivity %>% 
  select(
    TotalDistance,
    TotalSteps,
    Calories,
    TrackerDistance,
    LoggedActivitiesDistance,
    SedentaryActiveDistance,
    SedentaryMinutes,
    LightActiveDistance,
    LightlyActiveMinutes,
    ModeratelyActiveDistance,
    FairlyActiveMinutes,
    VeryActiveDistance,
    VeryActiveMinutes
  ) %>% 
  skim_without_charts()
```

|                                                  |            |
|:-------------------------------------------------|:-----------|
| Name                                             | Piped data |
| Number of rows                                   | 940        |
| Number of columns                                | 13         |
| \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_   |            |
| Column type frequency:                           |            |
| numeric                                          | 13         |
| \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_ |            |
| Group variables                                  | None       |

Data summary

**Variable type: numeric**

| skim_variable            | n_missing | complete_rate |    mean |      sd |  p0 |     p25 |     p50 |      p75 |     p100 |
|:-------------------------|----------:|--------------:|--------:|--------:|----:|--------:|--------:|---------:|---------:|
| TotalDistance            |         0 |             1 |    5.49 |    3.92 |   0 |    2.62 |    5.24 |     7.71 |    28.03 |
| TotalSteps               |         0 |             1 | 7637.91 | 5087.15 |   0 | 3789.75 | 7405.50 | 10727.00 | 36019.00 |
| Calories                 |         0 |             1 | 2303.61 |  718.17 |   0 | 1828.50 | 2134.00 |  2793.25 |  4900.00 |
| TrackerDistance          |         0 |             1 |    5.48 |    3.91 |   0 |    2.62 |    5.24 |     7.71 |    28.03 |
| LoggedActivitiesDistance |         0 |             1 |    0.11 |    0.62 |   0 |    0.00 |    0.00 |     0.00 |     4.94 |
| SedentaryActiveDistance  |         0 |             1 |    0.00 |    0.01 |   0 |    0.00 |    0.00 |     0.00 |     0.11 |
| SedentaryMinutes         |         0 |             1 |  991.21 |  301.27 |   0 |  729.75 | 1057.50 |  1229.50 |  1440.00 |
| LightActiveDistance      |         0 |             1 |    3.34 |    2.04 |   0 |    1.95 |    3.36 |     4.78 |    10.71 |
| LightlyActiveMinutes     |         0 |             1 |  192.81 |  109.17 |   0 |  127.00 |  199.00 |   264.00 |   518.00 |
| ModeratelyActiveDistance |         0 |             1 |    0.57 |    0.88 |   0 |    0.00 |    0.24 |     0.80 |     6.48 |
| FairlyActiveMinutes      |         0 |             1 |   13.56 |   19.99 |   0 |    0.00 |    6.00 |    19.00 |   143.00 |
| VeryActiveDistance       |         0 |             1 |    1.50 |    2.66 |   0 |    0.00 |    0.21 |     2.05 |    21.92 |
| VeryActiveMinutes        |         0 |             1 |   21.16 |   32.84 |   0 |    0.00 |    4.00 |    32.00 |   210.00 |

``` r
#5.49 Units Mean Total Distance, 7638 Mean Steps, 2304 Mean Calories...

dailyIntensities %>% 
  select(
    SedentaryMinutes,
    LightlyActiveMinutes,
    FairlyActiveMinutes,
    VeryActiveMinutes,
    SedentaryActiveDistance,
    LightActiveDistance,
    ModeratelyActiveDistance,
    VeryActiveDistance
  ) %>% 
  skim_without_charts()
```

|                                                  |            |
|:-------------------------------------------------|:-----------|
| Name                                             | Piped data |
| Number of rows                                   | 940        |
| Number of columns                                | 8          |
| \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_   |            |
| Column type frequency:                           |            |
| numeric                                          | 8          |
| \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_ |            |
| Group variables                                  | None       |

Data summary

**Variable type: numeric**

| skim_variable            | n_missing | complete_rate |   mean |     sd |  p0 |    p25 |     p50 |     p75 |    p100 |
|:-------------------------|----------:|--------------:|-------:|-------:|----:|-------:|--------:|--------:|--------:|
| SedentaryMinutes         |         0 |             1 | 991.21 | 301.27 |   0 | 729.75 | 1057.50 | 1229.50 | 1440.00 |
| LightlyActiveMinutes     |         0 |             1 | 192.81 | 109.17 |   0 | 127.00 |  199.00 |  264.00 |  518.00 |
| FairlyActiveMinutes      |         0 |             1 |  13.56 |  19.99 |   0 |   0.00 |    6.00 |   19.00 |  143.00 |
| VeryActiveMinutes        |         0 |             1 |  21.16 |  32.84 |   0 |   0.00 |    4.00 |   32.00 |  210.00 |
| SedentaryActiveDistance  |         0 |             1 |   0.00 |   0.01 |   0 |   0.00 |    0.00 |    0.00 |    0.11 |
| LightActiveDistance      |         0 |             1 |   3.34 |   2.04 |   0 |   1.95 |    3.36 |    4.78 |   10.71 |
| ModeratelyActiveDistance |         0 |             1 |   0.57 |   0.88 |   0 |   0.00 |    0.24 |    0.80 |    6.48 |
| VeryActiveDistance       |         0 |             1 |   1.50 |   2.66 |   0 |   0.00 |    0.21 |    2.05 |   21.92 |

``` r
#193 mean lightly active minutes, 32 fairly active mean minutes


dailySteps %>% 
  select(
    StepTotal
  ) %>% 
  skim_without_charts()
```

|                                                  |            |
|:-------------------------------------------------|:-----------|
| Name                                             | Piped data |
| Number of rows                                   | 940        |
| Number of columns                                | 1          |
| \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_   |            |
| Column type frequency:                           |            |
| numeric                                          | 1          |
| \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_ |            |
| Group variables                                  | None       |

Data summary

**Variable type: numeric**

| skim_variable | n_missing | complete_rate |    mean |      sd |  p0 |     p25 |    p50 |   p75 |  p100 |
|:--------------|----------:|--------------:|--------:|--------:|----:|--------:|-------:|------:|------:|
| StepTotal     |         0 |             1 | 7637.91 | 5087.15 |   0 | 3789.75 | 7405.5 | 10727 | 36019 |

``` r
dailyCalories %>% 
  select(
    Calories
  ) %>% 
  skim_without_charts()
```

|                                                  |            |
|:-------------------------------------------------|:-----------|
| Name                                             | Piped data |
| Number of rows                                   | 940        |
| Number of columns                                | 1          |
| \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_   |            |
| Column type frequency:                           |            |
| numeric                                          | 1          |
| \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_ |            |
| Group variables                                  | None       |

Data summary

**Variable type: numeric**

| skim_variable | n_missing | complete_rate |    mean |     sd |  p0 |    p25 |  p50 |     p75 | p100 |
|:--------------|----------:|--------------:|--------:|-------:|----:|-------:|-----:|--------:|-----:|
| Calories      |         0 |             1 | 2303.61 | 718.17 |   0 | 1828.5 | 2134 | 2793.25 | 4900 |

``` r
#Separate Datetime to Date and Time

#Date Time - Posix*
sleepDay$Date_Time_Cleaned = strptime(sleepDay$SleepDay,"%m/%d/%Y %I:%M:%S %p",tz="UTC")
hourlyCalories$Date_Time_Cleaned = strptime(hourlyCalories$ActivityHour,"%m/%d/%Y %I:%M:%S %p",tz="UTC")
hourlyIntensities$Date_Time_Cleaned = strptime(hourlyIntensities$ActivityHour,"%m/%d/%Y %I:%M:%S %p",tz="UTC")
weightLog$Date_Time_Cleaned = strptime(weightLog$Date,"%m/%d/%Y %I:%M:%S %p",tz="UTC")


#Date Only - Posix*
sleepDay$Date_Cleaned = strptime(sleepDay$SleepDay,"%m/%d/%Y")
hourlyCalories$Date_Cleaned = strptime(hourlyCalories$ActivityHour,"%m/%d/%Y")
hourlyIntensities$Date_Cleaned = strptime(hourlyIntensities$ActivityHour,"%m/%d/%Y")
weightLog$Date_Cleaned = strptime(weightLog$Date,"%m/%d/%Y")

dailyActivity$Date_Cleaned = strptime(dailyActivity$ActivityDate,"%m/%d/%Y")
dailyIntensities$Date_Cleaned = strptime(dailyIntensities$ActivityDay,"%m/%d/%Y")
dailySteps$Date_Cleaned = strptime(dailySteps$ActivityDay,"%m/%d/%Y")
dailyCalories$Date_Cleaned = strptime(dailyCalories$ActivityDay,"%m/%d/%Y")

#Time Only - Characters
sleepDay$Time_Cleaned = strftime(sleepDay$Date_Time_Cleaned,"%H:%M:%S")
hourlyCalories$Time_Cleaned = strftime(hourlyCalories$Date_Time_Cleaned,"%H:%M:%S")
hourlyIntensities$Time_Cleaned = strftime(hourlyIntensities$Date_Time_Cleaned,"%H:%M:%S")
weightLog$Time_Cleaned = strftime(weightLog$Date_Time_Cleaned,"%H:%M:%S")


#Joins/Merge

#Activity and Sleep
Activity_Day_Sleep_Day = left_join(dailyActivity,sleepDay,by=c("Id","Date_Cleaned"))


#Adding Columns for Analysis

#Time Awake in Bed
Activity_Day_Sleep_Day$SleepLatency = Activity_Day_Sleep_Day$TotalTimeInBed - Activity_Day_Sleep_Day$TotalMinutesAsleep

#Conversion Integer to Numeric - For Correlations
Activity_Day_Sleep_Day[c(3,4,5,6,7,8,9,10,11,12,13,14,15,19,20,23)] = sapply(Activity_Day_Sleep_Day[c(3,4,5,6,7,8,9,10,11,12,13,14,15,19,20,23)],as.numeric)
```

``` r
# Examining & Graphing Variables


#Sleep Variable
Activity_Day_Sleep_Day %>%
  select(TotalSleepRecords,
         TotalMinutesAsleep,
         TotalTimeInBed,
         SleepLatency
  ) %>%
  skim_without_charts()
```

|                                                  |            |
|:-------------------------------------------------|:-----------|
| Name                                             | Piped data |
| Number of rows                                   | 943        |
| Number of columns                                | 4          |
| \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_   |            |
| Column type frequency:                           |            |
| numeric                                          | 4          |
| \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_ |            |
| Group variables                                  | None       |

Data summary

**Variable type: numeric**

| skim_variable      | n_missing | complete_rate |   mean |     sd |  p0 | p25 | p50 | p75 | p100 |
|:-------------------|----------:|--------------:|-------:|-------:|----:|----:|----:|----:|-----:|
| TotalSleepRecords  |       530 |          0.44 |   1.12 |   0.35 |   1 |   1 |   1 |   1 |    3 |
| TotalMinutesAsleep |       530 |          0.44 | 419.47 | 118.34 |  58 | 361 | 433 | 490 |  796 |
| TotalTimeInBed     |       530 |          0.44 | 458.64 | 127.10 |  61 | 403 | 463 | 526 |  961 |
| SleepLatency       |       530 |          0.44 |  39.17 |  46.57 |   0 |  17 |  25 |  40 |  371 |

``` r
#Individual Means and Deviations - Some Notable Outliers
#Some IDs have no SD - Because only one observed sleep data. 
#Notably, two individuals had substantially higher awake means, 
#2 others had substantially higher awake standard deviations

Sleep_Awake_Mean_SD = 
  Activity_Day_Sleep_Day %>%
  group_by(Id) %>%
  drop_na() %>%
  mutate(awake_mean=mean(SleepLatency,na.rm=TRUE),
         awake_sd = sd(SleepLatency,na.rm=TRUE),
         asleep_mean=mean(TotalMinutesAsleep,na.rm=TRUE),
         asleep_sd = sd(TotalMinutesAsleep,TRUE),
         .keep="used") %>%
  filter(!duplicated(Id))

#Visualization of Outliers around cluster of more normal means and deviations
ggplot(Sleep_Awake_Mean_SD,aes(x=asleep_mean,y=asleep_sd)) + geom_point()
```

![](Coursera-Fitabase-Data-Case-Study_files/figure-gfm/Data%20Graphing%20and%20Observation-1.png)<!-- -->

``` r
ggplot(Sleep_Awake_Mean_SD,aes(x=awake_mean,y=awake_sd)) + geom_point()
```

![](Coursera-Fitabase-Data-Case-Study_files/figure-gfm/Data%20Graphing%20and%20Observation-2.png)<!-- -->

``` r
#Exercise/Activity Variable
Exercise_Sedentary_Mean_SD = 
  Activity_Day_Sleep_Day %>%
  group_by(Id) %>%
  drop_na() %>%
  mutate(TotalSteps_mean=mean(TotalSteps,na.rm=TRUE),
         TotalSteps_sd = sd(TotalSteps,na.rm=TRUE),
         TotalDistance_mean=mean(TotalDistance,na.rm=TRUE),
         TotalDistance_sd = sd(TotalDistance,TRUE),
         Calories_mean=mean(Calories,na.rm=TRUE),
         Calories_sd = sd(Calories,na.rm=TRUE),
         SedentaryMinutes_mean=mean(SedentaryMinutes,na.rm=TRUE),
         SedentaryMinutes_sd = sd(SedentaryMinutes,TRUE),
         .keep="used") %>%
  filter(!duplicated(Id))

ggplot(Exercise_Sedentary_Mean_SD,aes(x=TotalSteps_mean,y=TotalSteps_sd)) + geom_point()
```

![](Coursera-Fitabase-Data-Case-Study_files/figure-gfm/Data%20Graphing%20and%20Observation-3.png)<!-- -->

``` r
ggplot(Exercise_Sedentary_Mean_SD,aes(x=TotalDistance_mean,y=TotalDistance_sd)) + geom_point()
```

![](Coursera-Fitabase-Data-Case-Study_files/figure-gfm/Data%20Graphing%20and%20Observation-4.png)<!-- -->

``` r
ggplot(Exercise_Sedentary_Mean_SD,aes(x=Calories_mean,y=Calories_sd)) + geom_point()
```

![](Coursera-Fitabase-Data-Case-Study_files/figure-gfm/Data%20Graphing%20and%20Observation-5.png)<!-- -->

``` r
ggplot(Exercise_Sedentary_Mean_SD,aes(x=SedentaryMinutes_mean,y=SedentaryMinutes_sd)) + geom_point()
```

![](Coursera-Fitabase-Data-Case-Study_files/figure-gfm/Data%20Graphing%20and%20Observation-6.png)<!-- -->

``` r
#Minutes - VeryActiveMinutes, FairlyActiveMinutes,LightlyActiveMinutes,SedentaryMinutes

Exercise_Minutes_Mean_SD = 
  Activity_Day_Sleep_Day %>%
  group_by(Id) %>%
  drop_na() %>%
  mutate(VeryActiveMinutes_mean=mean(VeryActiveMinutes,na.rm=TRUE),
         VeryActiveMinutes_sd = sd(VeryActiveMinutes,na.rm=TRUE),
         FairlyActiveMinutes_mean=mean(FairlyActiveMinutes,na.rm=TRUE),
         FairlyActiveMinutes_sd = sd(FairlyActiveMinutes,TRUE),
         LightlyActiveMinutes_mean=mean(LightlyActiveMinutes,na.rm=TRUE),
         LightlyActiveMinutes_sd = sd(LightlyActiveMinutes,na.rm=TRUE),
         SedentaryMinutes_mean=mean(SedentaryMinutes,na.rm=TRUE),
         SedentaryMinutes_sd = sd(SedentaryMinutes,TRUE),
         .keep="used") %>%
  filter(!duplicated(Id))

ggplot(Exercise_Minutes_Mean_SD,aes(x=VeryActiveMinutes_mean,y=VeryActiveMinutes_sd)) + geom_point()
```

![](Coursera-Fitabase-Data-Case-Study_files/figure-gfm/Data%20Graphing%20and%20Observation-7.png)<!-- -->

``` r
ggplot(Exercise_Minutes_Mean_SD,aes(x=FairlyActiveMinutes_mean,y=FairlyActiveMinutes_sd)) + geom_point()
```

![](Coursera-Fitabase-Data-Case-Study_files/figure-gfm/Data%20Graphing%20and%20Observation-8.png)<!-- -->

``` r
ggplot(Exercise_Minutes_Mean_SD,aes(x=LightlyActiveMinutes_mean,y=LightlyActiveMinutes_sd)) + geom_point()
```

![](Coursera-Fitabase-Data-Case-Study_files/figure-gfm/Data%20Graphing%20and%20Observation-9.png)<!-- -->

``` r
ggplot(Exercise_Minutes_Mean_SD,aes(x=SedentaryMinutes_mean,y=SedentaryMinutes_sd)) + geom_point()
```

![](Coursera-Fitabase-Data-Case-Study_files/figure-gfm/Data%20Graphing%20and%20Observation-10.png)<!-- -->

``` r
#Graphs

#Basic Graphs from case study description

ggplot(data=Activity_Day_Sleep_Day,aes(x=TotalSteps,y=SedentaryMinutes)) + geom_point() + geom_smooth()
```

![](Coursera-Fitabase-Data-Case-Study_files/figure-gfm/Data%20Graphing%20and%20Observation-11.png)<!-- -->

``` r
ggplot(data=Activity_Day_Sleep_Day,aes(x=TotalMinutesAsleep,y=TotalTimeInBed)) + geom_point() + geom_smooth()
```

![](Coursera-Fitabase-Data-Case-Study_files/figure-gfm/Data%20Graphing%20and%20Observation-12.png)<!-- -->

# Graphs and Correlation

``` r
#Investigating Correlations alongside Graphs

#High Correlation between Steps and Calories Burned
ggplot(data=Activity_Day_Sleep_Day,aes(x=TotalSteps,y=Calories)) + geom_point() + geom_smooth()
```

    ## `geom_smooth()` using method = 'loess' and formula 'y ~ x'

![](Coursera-Fitabase-Data-Case-Study_files/figure-gfm/Important/Correlation%20Graphs-1.png)<!-- -->

``` r
cor(Activity_Day_Sleep_Day$TotalSteps,Activity_Day_Sleep_Day$Calories,use="complete.obs")
```

    ## [1] 0.5929493

``` r
#High Correlation - Less Sleep - More Sedentary Minutes, but also some outliers with 0 Sedentary Minutes
ggplot(data=Activity_Day_Sleep_Day, aes(x=SedentaryMinutes, y=TotalMinutesAsleep)) + geom_point() + geom_smooth()
```

    ## `geom_smooth()` using method = 'loess' and formula 'y ~ x'

    ## Warning: Removed 530 rows containing non-finite values (stat_smooth).

    ## Warning: Removed 530 rows containing missing values (geom_point).

![](Coursera-Fitabase-Data-Case-Study_files/figure-gfm/Important/Correlation%20Graphs-2.png)<!-- -->

``` r
cor(Activity_Day_Sleep_Day$SedentaryMinutes,Activity_Day_Sleep_Day$TotalMinutesAsleep,use="complete.obs")
```

    ## [1] -0.599394

``` r
#High (Obvious) Correlation More Distance = More Calories Burned
ggplot(data=Activity_Day_Sleep_Day, aes(x=TotalDistance, y=Calories)) + geom_point() + geom_smooth()
```

    ## `geom_smooth()` using method = 'loess' and formula 'y ~ x'

![](Coursera-Fitabase-Data-Case-Study_files/figure-gfm/Important/Correlation%20Graphs-3.png)<!-- -->

``` r
cor(Activity_Day_Sleep_Day$TotalDistance,Activity_Day_Sleep_Day$Calories,use="complete.obs")
```

    ## [1] 0.6466023

``` r
#Low Negative Correlation - Sleep Latency might be caused by not enough calories burned for excess energy?
ggplot(data=Activity_Day_Sleep_Day, aes(x=Calories, y=SleepLatency)) + geom_point() + geom_smooth()
```

    ## `geom_smooth()` using method = 'loess' and formula 'y ~ x'

    ## Warning: Removed 530 rows containing non-finite values (stat_smooth).
    ## Removed 530 rows containing missing values (geom_point).

![](Coursera-Fitabase-Data-Case-Study_files/figure-gfm/Important/Correlation%20Graphs-4.png)<!-- -->

``` r
cor(Activity_Day_Sleep_Day$Calories,Activity_Day_Sleep_Day$SleepLatency,use="complete.obs")
```

    ## [1] -0.2891555

``` r
  #What if we look at the range from 1000-2000 Calories?
  Activity_Day_Sleep_Day %>%
    filter(between(Calories,1000,2000)) %>%
    ggplot(aes(x=Calories,y=SleepLatency)) + geom_point() + geom_smooth()
```

    ## `geom_smooth()` using method = 'loess' and formula 'y ~ x'

    ## Warning: Removed 218 rows containing non-finite values (stat_smooth).

    ## Warning: Removed 218 rows containing missing values (geom_point).

![](Coursera-Fitabase-Data-Case-Study_files/figure-gfm/Important/Correlation%20Graphs-5.png)<!-- -->

``` r
  Activity_Day_Sleep_Day %>%
    filter(between(Calories,1000,2000)) %>%
    summarise(cor(Calories, SleepLatency, use = "complete.obs"))
```

    ##   cor(Calories, SleepLatency, use = "complete.obs")
    ## 1                                         -0.277088

``` r
#More Exercise and Less Sedentary Minutes = Less Minutes Asleep (Possibly more rested or better quality sleep?)
ggplot(data=Activity_Day_Sleep_Day, aes(x=TotalDistance, y=TotalMinutesAsleep)) + geom_point() + geom_smooth()
```

    ## `geom_smooth()` using method = 'loess' and formula 'y ~ x'

    ## Warning: Removed 530 rows containing non-finite values (stat_smooth).

    ## Warning: Removed 530 rows containing missing values (geom_point).

![](Coursera-Fitabase-Data-Case-Study_files/figure-gfm/Important/Correlation%20Graphs-6.png)<!-- -->

``` r
cor(Activity_Day_Sleep_Day$TotalDistance,Activity_Day_Sleep_Day$TotalMinutesAsleep,use="complete.obs")
```

    ## [1] -0.1721427

``` r
ggplot(data=Activity_Day_Sleep_Day, aes(x=TotalDistance, y=TotalTimeInBed)) + geom_point() + geom_smooth()
```

    ## `geom_smooth()` using method = 'loess' and formula 'y ~ x'

    ## Warning: Removed 530 rows containing non-finite values (stat_smooth).
    ## Removed 530 rows containing missing values (geom_point).

![](Coursera-Fitabase-Data-Case-Study_files/figure-gfm/Important/Correlation%20Graphs-7.png)<!-- -->

``` r
cor(Activity_Day_Sleep_Day$TotalDistance,Activity_Day_Sleep_Day$TotalTimeInBed,use="complete.obs")
```

    ## [1] -0.1580949

``` r
#Low Correlation Data

#Calories Burned vs Sleep - 
#Maybe having too much energy from not burning enough for some people?
#No clear relationship between Minutes Asleep and Calories burned here
ggplot(data=Activity_Day_Sleep_Day, aes(x=Calories, y=TotalMinutesAsleep)) + geom_point() + geom_smooth()
```

    ## `geom_smooth()` using method = 'loess' and formula 'y ~ x'

    ## Warning: Removed 530 rows containing non-finite values (stat_smooth).

    ## Warning: Removed 530 rows containing missing values (geom_point).

![](Coursera-Fitabase-Data-Case-Study_files/figure-gfm/Low-Value%20Data-1.png)<!-- -->

``` r
cor(Activity_Day_Sleep_Day$Calories,Activity_Day_Sleep_Day$TotalMinutesAsleep,use="complete.obs")
```

    ## [1] -0.02852571

``` r
#Normal Minutes Asleep (~5-8 hrs), people that sleep less more likely to spend more time in bed (trying to go back to sleep)
ggplot(data=Activity_Day_Sleep_Day, aes(x=SleepLatency, y=TotalMinutesAsleep)) + geom_point() + geom_smooth()
```

    ## `geom_smooth()` using method = 'loess' and formula 'y ~ x'

    ## Warning: Removed 530 rows containing non-finite values (stat_smooth).
    ## Removed 530 rows containing missing values (geom_point).

![](Coursera-Fitabase-Data-Case-Study_files/figure-gfm/Low-Value%20Data-2.png)<!-- -->

``` r
cor(Activity_Day_Sleep_Day$SleepLatency,Activity_Day_Sleep_Day$TotalMinutesAsleep,use="complete.obs")
```

    ## [1] -0.001761677

``` r
#Calories and Total Time in Bed
ggplot(data=Activity_Day_Sleep_Day,aes(x=Calories,y=TotalTimeInBed)) + geom_point() + geom_smooth()
```

    ## `geom_smooth()` using method = 'loess' and formula 'y ~ x'

    ## Warning: Removed 530 rows containing non-finite values (stat_smooth).
    ## Removed 530 rows containing missing values (geom_point).

![](Coursera-Fitabase-Data-Case-Study_files/figure-gfm/Low-Value%20Data-3.png)<!-- -->

``` r
cor(Activity_Day_Sleep_Day$Calories,Activity_Day_Sleep_Day$TotalTimeInBed,use="complete.obs")
```

    ## [1] -0.1325071

``` r
#Does More Exercise Lower Sleep Latency? Not such a clear relationship, possibly too many external variables, possibly misunderstanding TimeAwakeInBed Variable
ggplot(data=Activity_Day_Sleep_Day, aes(x=TotalDistance, y=SleepLatency)) + geom_point() + geom_smooth()
```

    ## `geom_smooth()` using method = 'loess' and formula 'y ~ x'

    ## Warning: Removed 530 rows containing non-finite values (stat_smooth).
    ## Removed 530 rows containing missing values (geom_point).

![](Coursera-Fitabase-Data-Case-Study_files/figure-gfm/Low-Value%20Data-4.png)<!-- -->

``` r
cor(Activity_Day_Sleep_Day$Calories,Activity_Day_Sleep_Day$TotalTimeInBed,use="complete.obs")
```

    ## [1] -0.1325071

``` r
ggplot(data=Activity_Day_Sleep_Day, aes(x=SedentaryMinutes, y=SleepLatency)) + geom_point() + geom_smooth()
```

    ## `geom_smooth()` using method = 'loess' and formula 'y ~ x'

    ## Warning: Removed 530 rows containing non-finite values (stat_smooth).
    ## Removed 530 rows containing missing values (geom_point).

![](Coursera-Fitabase-Data-Case-Study_files/figure-gfm/Low-Value%20Data-5.png)<!-- -->

``` r
cor(Activity_Day_Sleep_Day$Calories,Activity_Day_Sleep_Day$TotalTimeInBed,use="complete.obs")
```

    ## [1] -0.1325071

# Data Bulletpoints

More Distance and Steps Correlated to more Calories Burned Less Sleep
Correlated with More Sedentary Minutes that day Less sleep, lower energy
for exercise? More Exercise and Less Sedentary Minutes = Less Minutes
Asleep More exercise, higher sleep quality and thus less minutes asleep?
Low Negative Correlation between Calories and Sleep Latency Could this
be due to less calories burned keeping people awake? Lack of Food or
Exercise?

# Product Suggestions

My product suggestion or improvement for Bellabeat would be directed at
aiming to improve sleep and exercise, working to balance and help
schedule Bellabeat users both exercise consistently and sleep
consistently for better motivation and higher quality sleep.

By further analyzing what general data says about the quality and
quantity of sleep in correlation with various factors of exercise, such
as the time exercise takes place as well as the length and intensity of
it, we can draw some ideas on what general suggestions to make to
people.

Depending on the future analysis, we might break down users by their
fitness and make suggestions such as getting at least 30 minutes of
intense exercise per day and encourage them to consistently sleep for
healthy amounts to help them reinforce their exercise habits with the
extra willpower and motivation that can come from it.

I’m not an expert when it comes to mobile apps and so I think it would
be best to explore how mobile apps encourage users’ habits utilizing
rewards and other methods to see what would work best for Bellabeat and
their users. One small way I can think of to encourage users is that
once they have been active enough, showing off the data we’ve tracked
about their progress and success, such as streaks or improvements in
exercise and sleep.

Figuring out how to implement these app improvements would be highly
beneficial to Bellabeat and their users by helping reinforce and benefit
exercise and sleep, and thereby the use of the app as a means to do so.
