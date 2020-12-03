#data pre-processing for the 3rd cohorts Video Stats dataset

Extracted.video3=cyber.security.3_video.stats[c(1,3:7)]
dim(Extracted.video3)
#changing from 1 to 13 steps for which video data is present
Extracted.video3$step_position=1:13
#no null or empty sets
#extract removing the Index
video.sets=Extracted.video3[,-1]

#without video lengths
video.sets.counts=video.sets[,-1]
#without first row as its outlier
#max in total views, we will focus on this
(max_views=max(video.sets.counts$total_views))
(min_views=min(video.sets.counts$total_views))

#first step video 1.1 Welcome to the course
(row_max=Extracted.video3[Extracted.video3$total_views==max_views,]$step_position)
mainfile.row=cyber.security.3_video.stats[row_max,]
question.title.max=mainfile.row$title
question.title.max
# step video minimum
(Extracted.video3[Extracted.video3$total_views==min_views,])
(row_min=Extracted.video3[Extracted.video3$total_views==min_views,]$step_position)
mainfile.row=cyber.security.3_video.stats[row_min,]
question.title.min=mainfile.row$title
question.title.min

