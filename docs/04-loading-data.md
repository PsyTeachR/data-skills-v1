# Loading data

Part of becoming a psychologist is asking questions and gathering data to enable you to answer these questions effectively. It is very important that you understand all aspects of the research process such as experimental design, ethics, data management and visualisation. 

In this chapter, you will continue to develop reproducible scripts. This means scripts that completely and transparently perform an analysis from start to finish in a way that yields the same result for different people using the same software on different computers. And transparency is a key value of science, as embodied in the “trust but verify” motto. When you do things reproducibly, others can understand and check your work. 

This benefits science, but there is a selfish reason, too: the most important person who will benefit from a reproducible script is your future self. When you return to an analysis after two weeks of vacation, you will thank your earlier self for doing things in a transparent, reproducible way, as you can easily pick up right where you left off.

As part of your skill development, it is important that you work with data so that you can become confident and competent in your management and analysis of data. In all of your psychology data skills courses, we will work with real data that has been shared by other researchers. 

## Getting data ready to work with

In this chapter you will learn how to load the packages required to work with our data. You'll then load the data into R Studio before getting it organised into a sensible format that relates to our research question. If you can't remember what packages are, go back and revise \@ref(packages). 

## Walkthrough video

There is a [walkthrough video](https://uofglasgow.zoom.us/rec/play/teIkYYMpGx6UZyRmnp6oFP9a0oR1pkAdyKDtrOS19PMrPzWFD6UM8kf1JPOA8BUCvdTjDD1TL0BY7fst.UJ5avFdQMYGeSE-b?startTime=1600350969000&_x_zm_rtaid=tV6tnLfOQS6SzFo0htAAPg.1600855466001.bb934ef09570772957442af0f1cfb9b5&_x_zm_rhtaid=682) of this chapter available via Zoom.

* Video notes: this video was recorded in  2020 when we recommended using the server above installing R on your computer. With more experience of the server, we now strongly encourage you to install R on your computer if you can. There are no other differences between the video and this book chapter.

## Stub files

When you downloaded the data in Getting to know the data, you will have noticed that there were five Rmd files that all started with `stub-`. These stub files are set-up with code chunks for each activity of the chapter to help make your life a bit easier as you are first learning to code. We will take these away in Psych 1B but for this semester, you don't need to set up your own file, just open the relevant stub file for each chapter.

## Activity 1: Set-up

Before we begin working with the data we need to do some set-up. If you need help with any of these steps, you should refer to Chapter \@ref(ref1): 

* You should have already downloaded the data files and, if you are using the server, uploaded them to the R server as part of [Intro to R](https://psyteachr.github.io/ug1-practical/ref1.html), if you haven't done this, go back and work through that chapter now.
* Open R and ensure the environment is clear.
* If you're on the server, avoid a number of issues by restarting the session - click `Session` - `Restart R`  
* Set the working directory to your Data Skills folder.  
* Open the `stub-loading-data` file and ensure that the working directory is set to your Data Skills folder and that the two .csv data files are in your working directory (you should see them in the file pane).    

## Activity 2: Load in the package

Today we need to use the `tidyverse` package. You will use this package in almost every single chapter on this course as the functions it contains are those we use for data wrangling, descriptive statistics, and visualisation.

* To load the `tidyverse` type the following code into your **code chunk** (not the console) and then run it. 


```r
library(tidyverse)
```

## Open data

For this chapter we are going to be using the real dataset that you looked at in Getting to Know the Data. Click the below link if you want a refresher of what the dataset contains.

[Woodworth, R.J., O'Brien-Malone, A., Diamond, M.R. and Schüz, B., 2018. Data from, ‘Web-based Positive Psychology Interventions: A Reexamination of Effectiveness’. Journal of Open Psychology Data, 6(1).](https://openpsychologydata.metajnl.com/articles/10.5334/jopd.35/)

## Activity 3: Read in data

Now we can read in the data. To do this we will use the function `read_csv()` that allows us to read in .csv files. There are also functions that allow you to read in .xlsx files and other formats, however in this course we will only use .csv files.

* First, we will create an object called `dat` that contains the data in the `ahi-cesd.csv` file. Then, we will create an object called `info` that contains the data in the `participant-info.csv`.


```r
dat <- read_csv ("ahi-cesd.csv")
pinfo <- read_csv("participant-info.csv")
```




<div class="danger">
<p>There is also a function called <code>read.csv()</code>. Be very careful NOT to use this function instead of <code>read_csv()</code> as they have different ways of naming columns. For the homework, unless your results match ours <strong>exactly</strong> you will not get the marks which means you need to be careful to use the right functions.</p>
</div>

## Activity 4: Check your data

You should now see that the objects `dat` and `pinfo` have appeared in the environment pane. Whenever you read data into R you should always do an initial check to see that your data looks like you expected. There are several ways you can do this, try them all out to see how the results differ.

* In the environment pane, click on `dat` and `pinfo`. This will open the data to give you a spreadsheet-like view (although you can't edit it like in Excel)
* In the environment pane, click the small blue play button to the left of `dat` and `pinfo`. This will show you the structure of the object information including the names of all the variables in that object and what type they are (also see `str(pinfo)`) 
* Use `summary(pinfo)`
* Use `head(pinfo)`
* Just type the name of the object you want to view, e.g., `dat`.

## Activity 5: Join the files together

We have two files, `dat` and `info` but what we really want is a single file that has both the data and the demographic information about the participants. R makes this very easy by using the function `inner_join()`.

Remember to use the help function `?inner_join` if you want more information about how to use a function and to use tab auto-complete to help you write your code.

The below code will create a new object `all_dat` that has the data from both `dat` and `pinfo` and it will use the columns `id` and `intervention` to match the participants' data. If you want to join tables that have multiple columns in common, you need to use `c()` to list them all (I think of it as c for combine, or collection).

* Run this code and then view the new dataset using one of the methods from Activity 4.


```r
all_dat <- inner_join(x = dat, # the first table you want to join
                      y = pinfo, # the second table you want to join
                      by = c("id", "intervention")) # columns the two tables have in common
```

## Activity 6: Pull out variables of interest

Our final step is to pull our variables of interest. Very frequently, datasets will have more variables and data than you actually want to use and it can make life easier to create a new object with just the data you need.

In this case, the file contains the responses to each individual question on both the AHI scale and the CESD scale as well as the total score (i.e., the sum of all the individual responses). For our analysis, all we care about is the total scores, as well as the demographic information about participants.

To do this we use the `select()` function to create a new object named `summarydata`.


```r
summarydata <- select(.data = all_dat, # name of the object to take data from
                      ahiTotal, cesdTotal, sex, age, educ, income, occasion,elapsed.days) # all the columns you want to keep
```

<div class="danger">
<p>If you get an error message when using select that says <code>unused argument</code> it means that it is trying to use the wrong version of the select function. There are two solutions to this, first, save you work and then restart the R session (click session -restart R) and then run all your code above again from the start, or replace <code>select</code> with <code>dplyr::select</code> which tells R exactly which version of the select function to use. We'd recommend restarting the session because this will get you in the habit and it's a useful thing to try for a range of problems</p>
</div>


* Run the above code and then run `head(summarydata)`. If everything has gone to plan it should look something like this:



## Activity 7: Visualise the data

As you're going to learn about more over this course, data visualisation is extremely important. Visualisations can be used to give you more information about your dataset, but they can also be used to mislead. 

We're going to look at how to write the code to produce simple visualisations in a few weeks, for now, we want to focus on how to read and interpret different kinds of graphs. Please feel free to play around with the code and change `TRUE` to `FALSE` and adjust the values and labels and see what happens but do not worry about understanding the code. Just copy and paste it. 

Copy, paste and run the below code to produce a bar graph that shows the number of female and male participants in the dataset. 


```r
ggplot(summarydata, aes(x = as.factor(sex), fill = as.factor(sex))) +
  geom_bar(show.legend = FALSE, alpha = .8) +
  scale_x_discrete(name = "Sex") +
  scale_fill_viridis_d(option = "E") +
  scale_y_continuous(name = "Number of participants")+
  theme_minimal()
```

Are there more male or more female participants (you will need to check the codebook to find out what 1 and 2 mean to answer this)? <select class='webex-select'><option value='blank'></option><option value='answer'>More female participants</option><option value=''>More male participants</option></select>

Copy, paste, and run the below code to create violin-boxplots of happiness scores for each income group.


```r
ggplot(summarydata, aes(x = as.factor(income), y = ahiTotal, fill = as.factor(income))) +
  geom_violin(trim = FALSE, show.legend = FALSE, alpha = .4) +
  geom_boxplot(width = .2, show.legend = FALSE, alpha = .7)+
  scale_x_discrete(name = "Income", labels = c("Below Average", "Average", "Above Average")) +
  scale_y_continuous(name = "Authentic Happiness Inventory Score")+
  theme_minimal() +
  scale_fill_viridis_d()
```

* The violin (the wavy line) shows density. Basically, the fatter the wavy shape, the more data points there are at that point. It's called a violin plot because it very often looks (kinda) like a violin. 
* The boxplot is the box in the middle. The black line shows the median score in each group. The median is calculated by arranging the scores in order from the smallest to the largest and then selecting the middle score.
* The other lines on the boxplot show the interquartile range. There is a really good explanation of [how to read a boxplot here](https://medium.com/dayem-siddiqui/understanding-and-interpreting-box-plots-d07aab9d1b6c). 
* The black dots are outliers, i.e., extreme values.

Which income group has the highest median happiness score? <select class='webex-select'><option value='blank'></option><option value=''>Below average</option><option value=''>Average</option><option value='answer'>Above average</option></select>

Which income group has the lowest median happiness score? <select class='webex-select'><option value='blank'></option><option value='answer'>Below average</option><option value=''>Average</option></select>

How many outliers does the Average income group have? <input class='webex-solveme nospaces' size='1' data-answer='["2"]'/>

Finally, try knitting the file to HTML. And that's it, well done! Remember to save your Markdown in your Data Skills folder and make a note of any mistakes you made and how you fixed them. 

### Finished!

Well done! You have started on your journey to become a confident and competent member of the open science community! To show us how competent you are you should now complete the homework for this week which follows the same instructions as this in-class activity but asks you to work with different variables. Always use the data skills materials and videos to help you complete the assessments! 

Finally, if you're working from the R server, we'd recommend that you download a copy of the changes you've made to `stub-loading-data` so that you have a backup.

## Debugging tips

* When you downloaded and uploaded the files did you save the file names **exactly** as they were originally? If you download the file more than once you will find your computer may automatically add a number to the end of the file name. `data.csv` is not the same as `data(1).csv`. Pay close attention to names!
* Have you used the **exact** same object names as we did in each activity? Remember, `name` is different to `Name`. In order to make sure you can follow along with this book, pay special attention to ensuring you use the same object names as we do.  
* Have you used quotation marks where needed?  
* Have you accidentally deleted any back ticks (```) from the beginning or end of code chunks?

## Debugging exercises

These exercises will produce errors. Try to solve the errors yourself, and then make a note of what the error message was and how you solved it - you might find it helpful to create a new file just for error solving notes. You will find that you make the same errors in R over and over again so whilst this might slow you down initially, it will greatly speed you up in the long-run. 

1. Restart the R session (`Session - Restart R`). This should unload any packages you had loaded and also clear the environment. Make sure that the working directory is set to the right folder and then run the below code:


```r
dat <- read_csv ("ahi-cesd.csv")
```

This will produce the error `could not find function "read_csv"`. Once you figure out how to fix this error, make a note of it.


<div class='webex-solution'><button>Solution</button>

When you restarted the session, you unloaded all the packages you previously had loaded. The function `read_csv()` is part of the `tidyverse` package which means that in order for the code to run, you need to run `library(tidyverse)` to reload the package so that you can use the function.

</div>
 

2. Make sure that the working directory is set to the right folder and then run the below code:


```r
library(tidyverse)
dat <- read_csv("ahi-cesd")
```

This will produce the error `Error: 'ahi-cesd' does not exist in current working directory`. Once you figure out how to fix this error, make a note of it.


<div class='webex-solution'><button>Solution</button>

When loading data, you need to provide the full file name, including the file extension. In this case, the error was caused by writing `ahi-cesd` instead of `ahi-cesd.csv`. As far as R is concerned, these are two completely different files and only one of them exists in the working directory.

</div>
 

3. Make sure that the working directory is set to the right folder and then run the below code:


```r
library(tidyverse)
dat <- read_csv ("ahi-cesd.csv")
pinfo <- read_csv("participant-info.csv")
all_dat <- inner_join(x = dat, 
                      y = pinfo, 
                      by = "id", "intervention") 
summary(all_dat)
```


Look at the summary for `all_dat`. You will see that R has duplicated the `intervention` variable, so that there is now an `intervention.x` and an `intervention.y` that contain the same data. Once you figure out how to fix this error, make a note of it.



<div class='webex-solution'><button>Solution</button>

If you want to join two tables that have mulitple columns in common, you need to use the `c()` command to list all of the variables. The code above hasn't done this, it's just listed `id` and `intervention` without enclosing them with `c()`.

</div>
 


## Test yourself

1. When loading in a .csv file, which function should you use? 

<select class='webex-select'><option value='blank'></option><option value='answer'>read_csv()</option><option value=''>read.csv()</option></select>


<div class='webex-solution'><button>Explain this answer</button>

Remember, in this course we use `read_csv()` and it is important for the homework that you use this function otherwise you may find that the variable names are slightly different and you won't get the marks

</div>
 

<br>

2. The function `inner_join()` takes the arguments `x`, `y`, `by`. What does `by` do?

<select class='webex-select'><option value='blank'></option><option value=''>Specifies the first table to join</option><option value=''>Specifies the second table to join</option><option value='answer'>Specifies the column to join by that both tables have in common</option></select>

3. What does the function `select()` do? 
<br>
<select class='webex-select'><option value='blank'></option><option value=''>Keeps only the observations you specify</option><option value='answer'>Keeps only the variables you specify</option><option value=''>Keeps only the objects you specify</option></select>

*****

