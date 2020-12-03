library('ProjectTemplate')
load.project()
#check the enrollments and video stats data
head(cyber.security.1_enrolments)
#file of video data
head(cyber.security.3_video.stats)
#check number of rows for first and second enrollment cohorts
n11=nrow(cyber.security.1_enrolments)
n22=nrow(cyber.security.2_enrolments)

#combined all the enrollments in 1 dataframe and create bar chart based on enrollments in each cohorts
g = ggplot(data=df1)
g1 = g + geom_bar(aes(x=Column_sets, fill=factor(Column_sets)))
g2=g1 + labs(title = "Enrollment counts across Cohorts")+xlab("Course Sets") +ylab("Count of enrollments")+labs(fill = "Sets")


#moving to the countries in 1st,2nd,3rd cohorts
#verify some country names
head(first_cohort)
#check unique number of countries in each greater than 20 enrollments
(uniquec1=count(unique(first_cohort)))
(uniquec2=count(unique(second_cohort)))
(uniquec3=count(unique(third_cohort)))

#plotting

g = ggplot(data=first_cohort)
g1 = g + geom_bar(aes(x = reorder(value,n), y = n,fill= factor(n)), stat = 'identity' ,show.legend = FALSE )
g2=g1+labs(title = "Cohort1(67 Countries) ")+ylab("Count") +xlab("Country Name")+labs(fill = "Sets")
c11=g2+ coord_flip() 

g = ggplot(data=second_cohort)
g1 = g + geom_bar(aes(x = reorder(value,n), y = n,fill= factor(n)), stat = 'identity' ,show.legend = FALSE )
g2=g1+labs(title = "Cohort2 (44 Countries")+ylab("Count") +xlab("")+labs(fill = "Sets")
c22=g2+ coord_flip() 

g = ggplot(data=third_cohort)
g1 = g + geom_bar(aes(x = reorder(value,n), y = n,fill= factor(n)), stat = 'identity' ,show.legend = FALSE )
g2=g1+labs(title = "Cohort3 (27 Countries")+ylab("Count") +xlab("")+labs(fill = "Sets")
c33=g2+ coord_flip() 

Final_gg_country=ggarrange(c11, c22, c33 + rremove("x.text"), 
          labels = c("", "", ""),
          ncol = 3, nrow = 1)


#Check video stats 
dim(Extracted.video3)
#verify column names
colnames(Extracted.video3)

#number of videos stepsto test
nrow(Extracted.video3)
#no null or empty sets

#pair wise to check correlation between different video stats
pairs(video.sets)

#for means of all columns
colMeans(video.sets.counts)
#correlation matrix
cor(video.sets.counts)
#max in total views, we will focus on this
(max_views=max(video.sets.counts$total_views))
#minimum views
(min_views=min(video.sets.counts$total_views))
#first step video 1.1 Welcome to the course
question.title.max=mainfile.row$title
# step video minimum
question.title.min=mainfile.row$title

#scatter plot total views total downloads
scatt.vid=ggplot(data=video.sets.counts) + geom_point(aes(x=total_views , y=total_downloads),color="red") + labs(title = "Cohort3 Video Stats : Downloads vs Views Scatter plot")






