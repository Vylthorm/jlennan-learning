library(dplyr)
head(mtcars)

#1
mtcars %>% filter(mpg>20) %>% filter(cyl==6)

#2
head(mtcars %>% arrange(cyl,desc(wt)))

#non-pipe method from teacher
head(arrange(mtcars,cyl,desc(wt)))

#3?
head(mtcars %>% select(mpg,hp))

#4
distinct(select(mtcars,gear))

#5
head(mutate(mtcars,Performance=hp/wt))

#6
summarize(mtcars,avg_mpg=mean(mpg))

#7
mtcars %>% filter(cyl==6) %>% summarize(avg_hp=mean(hp))
#correct answer below, solution sheet shows incorrectly
#122.2857 and not around 24.26049 , I accidentally showed Standard Deviation.