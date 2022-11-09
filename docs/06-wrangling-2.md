# Data wrangling 2

## Walkthrough video

There is a [walkthrough video](https://uofglasgow.zoom.us/rec/play/Kde7hTS2bAJAvhuAufvxpYi8shgfoSH4kKeWN8YGJ9k1_lbHDFsNzHZBm9Bfu_bKVtcOxoNQbrBf8Ddt.Cy_Kex6M9v1_3v_G?startTime=1602841645000&_x_zm_rtaid=cW5f8v0JQcOlLI1cBpI84g.1628694791961.c3bcc75dbabdfb3f3ac44f8fd7884865&_x_zm_rhtaid=355) of this chapter available via Zoom.

* Video notes: this video was recorded in 2020, it uses the server, and the book has been updated visually.  There are no other differences between the video and this book chapter.

## Activity 1: Set-up

* Open R Studio and ensure the environment is clear.  
* Open the `stub-wrangling-2.Rmd` file and ensure that the working directory is set to your Data Skills folder and that the two .csv data files (`participant-info.csv` and `ahi-cesd.csv`) are in your working directory (you should see them in the file pane).   
* If you're on the server, avoid a number of issues by restarting the session - click `Session` - `Restart R`  
* Type and run the below code to load the `tidyverse` package and to load in the data files. 


```r
library(tidyverse) 

dat <- read_csv('ahi-cesd.csv')
pinfo <- read_csv('participant-info.csv')
all_dat <- inner_join(dat, pinfo, by= c("id", "intervention"))
```




Now let's start working with our `tidyverse` verb functions...

## Activity 2: Select  

Select the columns all_dat, ahiTotal, cesdTotal, sex, age, educ, income, occasion, elapsed.days from the data and create a variable called ```summarydata```. 


```r
summarydata <- select(all_dat, ahiTotal, cesdTotal, sex, age, educ, income, occasion, elapsed.days)
```

<div class="danger">
<p>If you get an error message when using select that says
<code>unused argument</code> it means that it is trying to use the wrong
version of the select function. There are two solutions to this, first,
save you work and then restart the R session (click session -restart R)
and then run all your code above again from the start, or replace
<code>select</code> with <code>dplyr::select</code> which tells R
exactly which version of the select function to use. We'd recommend
restarting the session because this will get you in the habit and it's a
useful thing to try for a range of problems</p>
</div>

******

**Pause here and interpret the above code and output**

* How you would translate this code into English 
* What columns have been removed from the data? 

******

## Activity 3: Arrange  

Arrange the data in the variable created above (```summarydata```) by ahiTotal with lowest score first. 

```r
ahi_asc <- arrange(summarydata, by = ahiTotal)
```

******

* How could you arrange this data in **descending** order (highest score first)?  


<div class='webex-solution'><button>Solution</button>


```r
arrange(summarydata, by = desc(ahiTotal))
```

</div>


* What is the smallest ahiTotal score? <input class='webex-solveme nospaces' size='2' data-answer='["32"]'/>

* What is the largest ahiTotal score? <input class='webex-solveme nospaces' size='3' data-answer='["114"]'/>

******

## Activity 4: Filter  

Filter the data ```ahi_asc``` by taking out those who are over 65 years of age.  

```r
age_65max <- filter(ahi_asc, age <= 65)
```

******

* What does `filter()` do? 

<select class='webex-select'><option value='blank'></option><option value=''>splits a column into multiple columns</option><option value=''>transforms existing columns</option><option value=''>takes multiple columns and collapses them together</option><option value='answer'>removes information that we are not interested in</option></select>

* How many observations are left in `age_65max` after running `filter()`? <input class='webex-solveme nospaces' size='3' data-answer='["950"]'/>

******

## Activity 5: Summarise  

Then, use summarise to create a new variable ```data_median```, which calculates the median ahiTotal score in this grouped data and assign it a table head called ```median_score```.

```r
data_median <- summarise(age_65max, median_score = median(ahiTotal))
```

******

* What is the median score? <input class='webex-solveme nospaces' size='2' data-answer='["74"]'/>

* Change the above code to give you the **mean score**. What is the mean score to 2 decimal places? <input class='webex-solveme nospaces' size='5' data-answer='["72.5","72.50"]'/>


<div class='webex-solution'><button>Solution</button>


```r
summarise(age_65max, mean_score = mean(ahiTotal))
```

</div>


******

## Activity 6: Group_by  

Use mutate to create a new column called `Happiness_Category` in `age_65max` which categorises participants based on whether they score above the median `ahiTotal` score for all participants. 

Then, group the data stored in  ```age_65max``` by `Happiness_Category`, and store it in an object named ```happy_dat```. 

Finally, use summarise to calculate the median `cesdTotal` score for participants who scored above and below the median `ahiTotal` score and save it in a new object named `data_median_group`.


```r
age_65max <- mutate(age_65max, Happiness_Category = (ahiTotal > 74))
happy_dat <- group_by(age_65max, Happiness_Category)

data_median_group <- summarise(happy_dat, median_score = median(cesdTotal))
```

<div class="info">
<p>If you get what looks like an error that says
<code>summarise() ungrouping output (override with .groups argument)</code>don't
worry, this isn't an error it's just R telling you what it's done. This
message was included in a very recent update to the
<code>tidyverse</code> which is why it doesn't appear on some of the
walkthrough videos.</p>
</div>

******

**Pause here and interpret the above code and output**

* What does `group_by()` do? 

<div class='webex-radiogroup' id='radio_AUBKPJYVZH'><label><input type="radio" autocomplete="off" name="radio_AUBKPJYVZH" value=""></input> <span>provides summary statistics of an existing dataframe</span></label><label><input type="radio" autocomplete="off" name="radio_AUBKPJYVZH" value=""></input> <span>organises information in ascending or descending order</span></label><label><input type="radio" autocomplete="off" name="radio_AUBKPJYVZH" value=""></input> <span>transforms existing columns</span></label><label><input type="radio" autocomplete="off" name="radio_AUBKPJYVZH" value="answer"></input> <span>groups data frames based on a specific column so that all later operations are carried out on a group basis</span></label></div>


* How would you change the code to group by education rather than `Happiness_Category`?


<div class='webex-solution'><button>Solution</button>


```r
group_by(age_65max, educ)
```

</div>


******

## Activity 7: Data visualisation

Copy, paste and run the below code into a new code chunk to create a plot of depression scores grouped by income level using the `age_65max` data.


```r
ggplot(age_65max, aes(x = as.factor(income), y = cesdTotal, fill = as.factor(income))) +
  geom_violin(trim = FALSE, show.legend = FALSE, alpha = .6) +
  geom_boxplot(width = .2, show.legend = FALSE, alpha = .5) +
  scale_fill_viridis_d(option = "D") +
  scale_x_discrete(name = "Income Level", labels = c("Below Average", "Average", "Above Average")) +
  scale_y_continuous(name = "Depression Score")
```

* Which income group has the highest median depression scores? <select class='webex-select'><option value='blank'></option><option value='answer'>Below Average</option><option value=''>Average</option><option value=''>Above Average</option></select>

* Which group has the highest density of scores at any one point? <select class='webex-select'><option value='blank'></option><option value=''>Below Average</option><option value=''>Average</option><option value='answer'>Above Average</option></select>


<div class='webex-solution'><button>Explain This Answer</button>

Density is represented by the curvy line around the boxplot that looks a little bit like a (drunk) violin. The fatter the violin, the more data points there are at any one point. This means that in the above plot, the Above Average group has the highest density because this has the widest violin, i.e., there are lots of people in the Above Average income group with a score of about 5.

</div>


* Is income group a between-subject or within-subject variable? <select class='webex-select'><option value='blank'></option><option value='answer'>Between-subjects</option><option value=''>Within-subjects</option></select>


<div class='webex-solution'><button>Explain This Answer</button>

Between-subjects designs are where different participants are in different groups. Within-subject designs are when the same participants are in all groups. Income is an example of a between-subject variable because participants can only be in one grouping level of the independent variable

</div>


## Activity 8: Make R your own

Finally, you can customise how R Studio looks to make it feel more like your own personal version. Click `Tools` - `Global Options` - `Apperance`. You can change the default font, font size, and general appearance of R Studio, including using dark mode. Play around with the settings and see which one you prefer - you're going to spend a lot of time with R, it might as well look nice!


## Finished!

Well done! As a final step, try knitting the file to HTML. Remember to save your Markdown in your Data Skills folder and make a note of any mistakes you made and how you fixed them. 
