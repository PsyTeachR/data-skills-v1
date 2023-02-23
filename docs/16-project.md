# Project analysis

We've spent the last 6 months giving you the skills you need to be able to deal with your own data. Now's the time to show us what you've learned. In this chapter we're going to describe the steps you will need to go through when analysing your data but, aside from a few lines that will help you deal with the questionnaire data and a couple of things you haven't done before we're not going to give you any code solutions. 

For everything else, you have done it before, so use this book to help you. Remember, you don't need to write the code from memory, you just need to find the relevant examples and then copy and paste and change what needs changing to make it work for you.

We suggest that you problem-solve the code as a group, however, make sure that you all have a separate copy of the final working code. You can attend into GTA sessions in week 9 and 10 to help you as well.

## Step 1: Import and initial data wrangling


To help get you on your way, we've done a bit of the initial wrangling for you. Download the data files into your working directory, create a new Markdown, then run all the below code without changing anything. I would also encourage you to open up the Excel files to see what's in them as it will help your understanding of the analysis.


```r
library(tidyverse)

library(tidyverse)

# read in data but skip rows 2 and 3
col_names <- names(read_csv("big5_data.csv", n_max = 0))
dat <- read_csv("big5_data.csv", col_names = col_names, skip = 3) %>%
  filter(Progress == 100, # only keep data from participants who progressed to end of survey
         DistributionChannel != "preview")  # Remove Emily's preview data

# read in scoring and codebook data
scoring <- read_csv("scoring.csv")
codebook <- read_csv("code_book.csv")

# create dataset of just big 5 data then join with codebook and scoring
big5 <- select(dat, ResponseId, Q4_1:Q4_60) %>%
  pivot_longer(cols = Q4_1:Q4_60, names_to = "item", values_to = "response") %>%
  inner_join(codebook, by = "item") %>%
  inner_join(scoring, by = c("response", "direction"))

# clean up the neurodivergent data
# this code is a bit hacky, if you want to suggest a cleaner version, get in touch!

nd_dat <- dat %>%
  select(ResponseId, Q11) %>%
  separate(Q11, c("col1", "col2", "col3", "col4"), sep = "", convert = TRUE) %>%
  pivot_longer(cols = 3:5, names_to = "response", values_to = "condition") %>%
  mutate(condition = case_when(condition == 2 ~ "Autism_spectrum",
                               condition == 3 ~ "ADHD",
                               condition == 4 ~ "Dyslexia",
                               condition == 5 ~ "Dyscalculia",
                               condition == 6 ~ "Dyspraxia",
                               condition == 7 ~ "Other_ND",
                               condition == 8 ~ "Neurotypical"),
         value = condition) %>%
  select(ResponseId, condition, value) %>%
  drop_na() %>%
  pivot_wider(id_cols = "ResponseId", names_from = "condition", values_from = "value") %>%
  select(1:3,5:8,4) %>%
  mutate(across(everything(), ~ ifelse(is.na(.), "No", .)))
  

# create dataset that just has the demographic questions

demographic <- select(dat, ResponseId, 
                      "age" = Q6, 
                      "gender" = Q7, 
                      "sexual_orientation" = Q8,
                      "team_name" = Q16) %>%
  mutate(gender = factor(gender, labels = c("Man", 
                                            "Woman", 
                                            "Non-binary", 
                                            "Prefer not to say")),
         sexual_orientation = factor(sexual_orientation, labels = c("Straight/ Heterosexual",
                                                                    "Bisexual/pansexual", 
                                                                    "Gay or Lesbian", 
                                                                    "Asexual", 
                                                                    "Other", 
                                                                    "Prefer not to say")),
         team_name = factor(team_name)
         ) %>%
  inner_join(nd_dat)

# get rid of objects we don't need
rm(dat, scoring, codebook, nd_dat)
```

## Step 2: BFI-2 scores

First, let's deal with the Big 5 scores and just focus on the whole dataset rather than your team data.

Create an object named `trait_dat` (where `trait` is the name of the Big 5 trait you are using as your DV) that just has the data from the trait you are interested in. Your starting dataset should be `big5`.

Hint: `filter()`

Then, use `trait_dat` to calculate the mean trait `score` for each participant (`ResponseId`). Store these scores in an object named `trait_scores`. The table you create in this step should have as many rows as there are participants because there should be one score for each participant once you've calculated the average. 

Hint: `group_by()` and then `summarise()`.

## Step 3: IV

Now, let's deal with the demographic information you're using as your IV. We want to wrangle the dataset according to the decisions you made in your registered report. You can save each of the below steps to a different object, or you can use the `%>%`. However you do it, make the final object named `my_demo`. 

You may also not need all of these steps, it's going to depend on what choices you made. Welcome to research :)

This is the most difficult step in this analysis, once you get past step 3, it's all very similar to what you've done before. We have provided two examples of step 3 you can adapt to help you on your way. 

### Exclusion criteria

If you set exclusion criteria, filter out any participants you don't want in your dataset (e.g., if you have an age limit, or only don't want only children). You may also choose to remove people who answered "Prefer not to say" for your IV at this point.

Hint: `filter()`

### Selecting columns

To make the dataset easier to work with, create an object that just has the columns you need. You all need the participant's id, age, gender, team name, but you may need other columns that contain information about your IV.

Hint: `select()`

### New categories

Some of you decided that you were going to collapse some of the categories, for example, combine all queer people into a single queer category, or look at e.g., people with autism, people with ADHD, people with autism and ADHD. This is slightly complicated so we'll give you two examples of the code you would use to do this which you should be able to adapt to your needs. Be very careful with the spelling, it needs to be exact for `recode` to work.

### Cleaning up your datasets

Finally, you need to add `drop_na(IV)` and `droplevels()` to your code where IV is the variable that you're using as your IV. This will get rid of anyone who didn't respond to your IV question (because obviously you can't include them in your analysis). `droplevels` removes any factors that don't have any data points (if you don't do this your plots will still show the prefer not to say category even if there's no data in this category).

### Example code

Example 1


```r
my_demo <- demographic %>%
  # remove anyone who answered "prefer not to say"
  filter(sexual_orientation != "Prefer not to say") %>%
  # just select the columns we need
  select(ResponseId, age, gender, team_name, sexual_orientation) %>%
  # create a new column "sexual_orientation_recoded" that collapses responses into two categories
  mutate(sexual_orientation_recoded = recode(sexual_orientation, 
                                             "Straight/ Heterosexual" = "Heterosexual",
                                             "Gay or Lesbian" = "Queer",
                                             "Bisexual/pansexual" = "Queer",
                                             "Asexual" = "Queer",
                                             "Other" = "Queer")) %>%
  # remove any participants who have missing data for the IV question 
  drop_na(sexual_orientation) %>%
  # remove any categories we've gotten rid of from the underlying data structure
  droplevels()
```

Example 2


```r
my_demo <- demographic %>%
  # only keep participants between 18 and 35 years old
  filter(age >= 18 & age <= 35) %>%
  # just select the columns we need
  select(ResponseId, age, gender, team_name, Neurotypical, ADHD, Autism_spectrum) %>%
  # create a new column "ND_status" 
  mutate(ND_status = case_when(ADHD == "ADHD" & Autism_spectrum == "No" ~ "ADHD",
                              Autism_spectrum == "Autism_spectrum" & ADHD == "No" ~ "Autism_spectrum",
                              ADHD == "ADHD" & Autism_spectrum == "Autism_spectrum" ~ "ADHD_ASC",
                              TRUE ~ "Neurotypical")) %>%
  # remove any participants who have missing data for the IV question 
  drop_na(Neurotypical) %>%
  # remove any categories we've gotten rid of from the underlying data structure
  droplevels()
```


## Step 4: Joining it all together

Getting there.

The hard bit is done - the rest should be very familiar from the data skills homework and book.

Now, create a dataset named `all_dat` that joins together the dataset that has all your demographic information from step 3, and the dataset that has your trait scores so that you have a single dataset that contains all the data you need from participants who are present in both datasets.

Hint: `inner_join()`

## Step 5: Sample information

Count the number of participants in the data set. This is the overall sample size. Depending on what exclusion and inclusion criteria you used, you may have a different sample size to other groups (which is why it is so important to report how you conducted your data analysis transparently). You haven't done this very often so we'll give you the code.


```r
all_dat %>%
  count()
```

For the poster, you need to report the number of participants in each group. You can also create a column of percentages. You haven't done this very often so we'll give you the code.


```r
all_dat %>%
  count(gender) %>% # replace gender with your grouping variable
  mutate(percent = n/sum(n)*100)
```

You also need to report the age statistics for the sample. Calculate the mean age and SD. If there is missing data, you may need to use `na.rm = TRUE`.

Hint: `summarise()`


## Step 6: Group differences in scores

Calculate the mean and SD trait score for each of your groups. If there is missing data, you may need to use `na.rm = TRUE`.

The table this produces should have three columns, one with the grouping variable, one with the mean scores for each group, and one with the SD for each group. The number of rows will depend on how many groups are in your variable, e.g., if you were looking at gender, it would have three rows for male, female, and non-binary scores.

Hint: `group_by()` then `summarise()`

## Step 7: Visualisations

Create a bar chart of means for your DV by IV with error bars that display standard error (`mean_se`). 

Create a violin-boxplot for your DV by IV. 

Ensure that your visualisations are appropriately labelled and try to make them look visually appealing.

## Step 8: Team data

Almost done. Now, create a dataset that just contains the data from your team. To find out which number your team is, open up the "team_name.csv" file (just on your computer, you don't have to do this in R) and find your team name and number. 


```r
team_dat <- all_dat %>%
  filter(team_name == 5)
```

Then repeat Steps 5 - 7 but use `team_dat` instead of `all_dat`. You should be able to reuse all of code, and just plug in the different dataset. 

## Finished

And you're done! I wish that I could adequately convey how impressive what you've just done is. I wish that I could show you how amazing your skills are compared to most other psychology undergraduates in the UK and across the world. But no-one ever believe me so I'm going to [leave you with this](https://www.tiktok.com/@chelseaparlettpelleriti/video/7016838746108710149?_r=1&_t=8ZtxKOe3sHe)
