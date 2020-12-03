# Example preprocessing script.
# Data preprocessing script.
#file of enrollments
head(cyber.security.1_enrolments)
#file of video data
head(cyber.security.3_video.stats)
# we will create 1 table from the 7 'cyber-security-i_enrolments' files
#we will create 2nd table from 5 'video.stats' files

cyber.security.3_video.stats[c(1,2,3)][]
class(cyber.security.1_enrolments)
is.list(cyber.security.1_enrolments)

#extract learnerIDs and country for all 7 files
lid1=cyber.security.1_enrolments[[1]]
(country1=cyber.security.1_enrolments[[13]])
lid2=cyber.security.2_enrolments[[1]]
(country2=cyber.security.2_enrolments[[13]])
lid3=cyber.security.3_enrolments[[1]]
(country3=cyber.security.3_enrolments[[13]])
lid4=cyber.security.4_enrolments[[1]]
(country4=cyber.security.4_enrolments[[13]])
lid5=cyber.security.5_enrolments[[1]]
(country5=cyber.security.5_enrolments[[13]])
lid6=cyber.security.6_enrolments[[1]]
(country6=cyber.security.6_enrolments[[13]])
lid7=cyber.security.7_enrolments[[1]]
(country7=cyber.security.7_enrolments[[13]])



#replace all of the learner IDs with the course set number the students took part in
replacevals=function(lidnumber,j){
  
  for(i in 1:length(lidnumber))
  {
    lidnumber[i]=paste("Course Set",j)
  }
  return(lidnumber)
}
#run function to replace for each level
Set1=replacevals(lid1,1)
Set2=replacevals(lid2,2)
Set3=replacevals(lid3,3)
Set4=replacevals(lid4,4)
Set5=replacevals(lid5,5)
Set6=replacevals(lid6,6)
Set7=replacevals(lid7,7)

#create data frame of combined Course sets
Column_sets=c(Set1,Set2,Set3,Set4,Set5,Set6,Set7)

df1 <- data.frame(Column_sets)
#Final Data Frame created to use for Analysis
df1

country_count_function=function(country)
{
  #remove null values in country for 1st cohort
  volv1=str_remove(country, "--")
  country_new=volv1[volv1 != ""]
  #use countrycode package and replace codes with names
  shaft1=countrycode(country_new,"ecb","country.name")
  shaft1
  #convert the country name to data frame
  df3<- data.frame(shaft1)
  df3
  
  #remove null values in country for 2nd cohort
  
  #dplyr to convert to tbl format tidy verse
  ctable <- tbl_df(shaft1)
  asda1=tibble::as_tibble(shaft1)
  
  #dplyr to set display count of each country
  count.countries=asda1 %>% count(value, sort = TRUE)
  count.countries
  #filter those with count greater than 20, our main concert
  max.viewing.countries=filter(count.countries, n >20 )
  
  max.country.df1 = as.data.frame(max.viewing.countries)
  
  return(max.country.df1)
}
#data integrated for analysis of the several Countries enrolled
first_cohort=country_count_function(country1)
second_cohort=country_count_function(country2)
third_cohort=country_count_function(country3)


