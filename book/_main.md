--- 
title: "Data Skills"
author: "Heather Cleland-Woods and Emily Nordmann"
date: "2021-09-18"
site: bookdown::bookdown_site
documentclass: book
classoption: oneside # for PDFs
geometry: margin=1in # for PDFs
bibliography:
- book.bib
- packages.bib
csl: include/apa.csl
link-citations: yes
description: |
  Our first-year undergraduate course covers current state of psychological science and what Open Science is as well as its importance. It also aims to make students confident and competent at using RStudio as a tool to achieve good data management skills.
url: https://psyteachr.github.io/data-skills-v1
github-repo: psyteachr/data-skills-v1
cover-image: images/logos/logo.png
apple-touch-icon: images/logos/apple-touch-icon.png
apple-touch-icon-size: 180
favicon: images/logos/favicon.ico
---



# Overview {-}

<div class="small_right"><img src="images/logos/logo.png" 
     alt="Data skills Logo" /></div>

By the end of this book, you will be able to:

* Import data into R
* Manipulate and wrangle data into an appropriate format for analysis
* Calculate summarises of descriptive statistics
* Produce informative data visualisations
* Perform basic probability calculations using simulation

## How to use this book and the walkthrough videos

For most chapters of this book there is an associated walkthrough video. These videos are there to support you as you get comfortable using R, however, it's important that you use them wisely. You should always try to work through each chapter of this book (or if you prefer each activity) on your own and only then watch the video if you get stuck, or for extra information. 

For many of the initial chapters, we will provide the code you need to use. You can copy and paste from the book, however, we strongly encourage you to type out the code by yourself. This will seem much slower and you will make errors, but you will learn much more quickly this way.

Additionally, we also provide the solutions to many of the activities. No-one is going to check whether you tried to figure it out yourself rather than going straight to the solution but remember this: if you copy and paste without thinking, you will learn nothing. 

Finally, on occasion we will make updates to the book such as fixing typos and including additional detail or activities and as such this book should be considered a living document. When substantial changes are made, new walkthrough videos will be recorded, however, it would be impossible to record a new video every time we made a minor change, therefore, sometimes there may be slight differences between the walkthrough videos and the content of this book. Where there are differences between the book and the video, the book should always be considered the definitive version. 



<!--chapter:end:index.Rmd-->


# Getting to know the data

This semester we will use the same dataset each week to develop your skills and knowledge. The dataset is from Woodworth et al. (2018)  and you can find an explanation of the data here <a href="files/woodworth.pdf" download>Web-based Positive Psychology Interventions: A Reexamination of Effectiveness</a>.

There is a [walkthrough video](https://moodle.gla.ac.uk/filter/echo360/lti_launch.php?url=https%3A%2F%2Fecho360.org.uk%2Flti%2F73750256-551c-47b5-9f1b-247567d647c2%3FmediaId%3Db75d33c3-4c7b-4586-b019-ee715f169409%26autoplay%3Dfalse%26automute%3Dfalse&cmid=2529962&width=640&height=420) of this chapter available via Echo360 (UofG Moodle sign-in required).

## Activity 1

Read through the study to familiarise yourself with the data you will be using over the coming weeks and answer the below questions.

When you get the correct answer, the answer box will turn green. Sometimes this doesn't work on Internet Explorer or Edge so be sure to use Chrome or Firefox.

* What does the AHI measure? (Hint, use a single word)

<input class='webex-solveme nospaces' size='9' data-answer='["Happiness","happiness","TRUE"]'/> 

* What does the CES-D measure? (hint, use a single word)

<input class='webex-solveme nospaces' size='10' data-answer='["Depression","depression","TRUE"]'/>

* How many participants were there in this study?

<input class='webex-solveme nospaces' size='3' data-answer='["295"]'/>

* How many questions (items) are there on the AHI?

<input class='webex-solveme nospaces' size='2' data-answer='["24"]'/>

* How many questions (items) are there on the CES-D?

<input class='webex-solveme nospaces' size='2' data-answer='["20"]'/>

## Activity 2

<a href="files/Data_Skills_1A.zip" download>Download the files for Psych 1A here</a>

The files are stored in a **zip file**. A zip file is a folder that contains files that have been compressed to make the file size smaller (like vacuum packed food) and enables you to download multiple files at once, however, before you use the files from a zip folder you first need to extract them.

1. If you haven't already, make a folder on your computer for Psych 1A.
2. Click on the above link to download the folder and save it in your Psych 1A folder. If your computer does not ask you where to save the file, chances are it has saved it in your Downloads folder. If this is the case, once it has downloaded go to your downloads folder and then move it to your Psych 1A folder
3. Navigate to the zip file and open it. You will see all the files it contains but **don't use these** - click **"Extract all"** on the top ribbon. If you are using and Mac and Safari, you may find that it automatically unzips the folder. This can actually cause more problems than it solves and I would recommend [turning it off](https://apple.stackexchange.com/questions/961/how-to-stop-safari-from-unzipping-files-after-download) but also, Safari sometimes causes other issues with downloading some file types so if you're on a Mac, I really would just use Chrome or Firefox.
4. You will be asked to select a location to save the unzipped files. Assuming that you followed step 2, the default option should be your Psych 1A folder
5. You can now use the unzipped files. Save the zip folder for now, we're going to use it again in chapter 3.

## Activity 3

Now that you've unzipped the folder, you should see that you have eight files. Three of these files are the data from Woodworth et al. -  `code-book.pdf`, `ahi-cesd.csv` and `participant-info.csv`. Open and review each of these files and use the code book to figure out what the data in each variable (column) represents.

* How many variables/columns data does `participant-info.csv` have?

<input class='webex-solveme nospaces' size='1' data-answer='["6"]'/>

* How many variables/columns data does `ahi-cesd.csv` have?

<input class='webex-solveme nospaces' size='2' data-answer='["50"]'/>

* What does a response of 1 for sex mean? <select class='webex-select'><option value='blank'></option><option value='answer'>female</option><option value=''>male</option></select>

The remaining five files are "stub files" that you will use as you work through this book, so don't worry about them just now. 

<!--chapter:end:01-data.Rmd-->

# Programming basics

In this chapter, we will cover how to use R and RStudio at the University of Glasgow as well as some basic programming concepts and terminology, common pitfalls, helpful hints, and where to get help. Those of you who have no programming experience should find this chapter particularly helpful, however, even if you've used R before there may be some helpful hints and tips so please make sure you read through this chapter before the moving on.

This is a long chapter but we don't expect you to memorise all the information that is contained in it and some sections of it will not make sense until you start writing your own code - just make sure you know what help is available!

There is a [walkthrough video](https://uofglasgow.zoom.us/rec/play/z4QocMWQL9ExSfHYBaC8C1oISbrEDkOlz8wJwT0oT2y116hgB0yA0O9cTtVdvYWYqO-wq97Xi8_yncLv.1st2ENKayHb21h0S?autoplay=true&startTime=1600084596000) of this chapter available via Zoom.

## R and RStudio

R is a programming language that you will write code in and RStudio is an Integrated Development Environment (IDE) which makes working with R easier. Think of it as knowing English and using a plain text editor like NotePad to write a book versus using a word processor like Microsoft Word. You could do it, but it wouldn't look as good and it would be much harder without things like spell-checking and formatting. In a similar way, you can use R without R Studio but we wouldn't recommend it. The key thing to remember is that although you will do all of your work using RStudio for this course, you are actually using two pieces of software which means that from time-to-time, both of them may have separate updates.

There are two ways you can use R for psychology. First, you can use a online version of R and R through your web browser and we will refer to this as the **R server**. Second, you can download and install R and RStudio for free on your laptop or desktop computer.

**Which version of R should you use?**

The advantage of using the R server is that you do not need to install anything on your machine, you simply access it through your web browser. All  the extra packages and functions you need for this course will already be installed. We recommend using the server if you have a computer that you cannot install R on (e.g., a Chromebook), or if you have serious problems with installing R on your computer. 

The advantage to installing R on your computer is that you do not need to be connected to the internet to use it, it is easier to save and manage your files, and there are no problems caused if the server crashes (which is rare, but does and has happened). 

With the exception of how they save files, both versions are largely identical in how they work, however, after over a year  working remotely, we have concluded that **if you can install R on your computer, you should**. If your computer cannot install R, or if you have technical problems during the installation you cannot resolve, then you should use the server. However, the need to be connected to the internet and the inability to open e.g., assessment files directly on your computer if you use the server mean that it is worth trying to install it if you can.    

### R server

You will find the link to the R server on Moodle. Please note that the R server is only for use by students and staff in the School of Psychology and Neuroscience. Sign in to the R server with your usual GUID and password. 

### Installing R on your computer

To use R on your computer, please see [Installing R](https://psyteachr.github.io/ug1-practical/installing-r.html) which has more detailed instructions and links to the files you need to download, as well as a links to a series of walkthroughs for installing R on different types of computers. 

## Getting to know R Studio

R Studio has a console that you can try out code in (appearing as the bottom left window in Figure \@ref(fig:img-rstudio)), there is a script editor (top left), a window showing functions and objects you have created in the “Environment” tab (top right window in the figure), and a window that shows plots, files packages, and help documentation (bottom right).

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{images/rstudio} 

}

\caption{RStudio interface}(\#fig:img-rstudio)
\end{figure}

You will learn more about how to use the features included in R Studio throughout this course, however, we highly recommend watching [RStudio Essentials 1](https://rstudio.com/resources/webinars/programming-part-1-writing-code-in-rstudio/) from the R Studio team. The video lasts ~30 minutes and gives a tour of the main parts of R Studio. 

## Console vs. scripts

When you first open up R Studio you won't see a script like above, there will just be a single pane on the left, which is the console. You can write code in the console to test it out, but it won't save anywhere. For this chapter, we'll use the console to show you some simple code examples but moving forward you'll save your code in a script file, and you'll see the extra pane appear.

## Functions and arguments

**Functions** in R execute specific tasks and normally take a number of **arguments** (if you're into linguistics you might want to think as these as verbs that require a subject and an object). You can look up all the arguments that a function takes by using the help documentation by using the format `?function`. Some arguments are required, and some are optional. Optional arguments will often use a default (normally specified in the help documentation) if you do not enter any value.

As an example, let’s look at the help documentation for the function `rnorm()` which randomly generates a set of numbers with a normal distribution. 

## Activity 1

* Open up R Studio (either on the server or on your machine) and in the console, type the following code:  


```r
?rnorm
```

The help documentation for `rnorm()` should appear in the bottom right help panel. In the usage section, we see that `rnorm()` takes the following form:


```r
rnorm(n, mean = 0, sd = 1)
```

In the arguments section, there are explanations for each of the arguments. `n` is the number of observations we want to create, `mean` is the mean of the data points we will create and `sd` is the standard deviation of the set. In the details section it notes that if no values are entered for `mean` and `sd` it will use a default of 0 and 1 for these values. Because there is no default value for `n` it must be specified otherwise the code won't run.

Let's try an example and just change the required argument `n` to ask R to produce 5 random numbers. 

## Activity 2

* Copy and paste the following code into the console.  


```r
set.seed(12042016)
rnorm(n = 5)
```

```
## [1] -0.2896163 -0.6428964  0.5829221 -0.3286728 -0.5110101
```

These numbers have a mean of 0 and an SD of 1. Now we can change the additional arguments to produce a different set of numbers.


```r
rnorm(n = 5, mean = 10, sd = 2)
```

```
## [1] 13.320853  9.377956 10.235461  9.811793 13.019102
```

This time R has still produced 5 random numbers, but now this set of numbers has a mean of 10 and an sd of 2 as specified. Always remember to use the help documentation to help you understand what arguments a function requires.


\begin{info}
If you're looking up examples of code online, you may often see code
that starts with the function \texttt{set.seed()}. This function
controls the random number generator - if you're using any functions
that generate numbers randomly (such as \texttt{rnorm()}), running
\texttt{set.seed()} will ensure that you get the same result (in some
cases this may not be what you want to do). We call \texttt{set.seed()}
in this example because it means that you will get the same random
numbers as this book.
\end{info}

## Argument names

In the above examples, we have written out the argument names in our code (e.g., `n`, `mean`, `sd`), however, this is not strictly necessary. The following two lines of code would both produce the same result (although each time you run `rnorm()` it will produce a slightly different set of numbers, because it's random, but they would still have the same mean and SD):


```r
rnorm(n = 6, mean = 3, sd = 1)
rnorm(6, 3, 1)
```

Importantly, if you do not write out the argument names, R will use the default order of arguments, that is for `rnorm` it will assume that the first number you enter is `n`. the second number is `mean` and the third number is `sd`. 

If you write out the argument names then you can write the arguments in whatever order you like:


```r
rnorm(sd = 1, n = 6, mean = 3)
```

When you are first learning R, you may find it useful to write out the argument names as it can help you remember and understand what each part of the function is doing. However, as your skills progress you may find it quicker to omit the argument names and you will also see examples of code online that do not use argument names so it is important to be able to understand which argument each bit of code is referring to (or look up the help documentation to check).

In this course, we will always write out the argument names the first time we use each function, however, in subsequent uses they may be omitted.

## Tab auto-complete

One very useful feature of R Studio is the tab auto-complete for functions (see Figure \@ref(fig:img-autocomplete)). If you write the name of the function and then press the tab key, R Studio will show you the arguments that function takes along with a brief description. If you press enter on the argument name it will fill in the name for you, just like auto-complete on your phone. This is incredibly useful when you are first learning R and you should remember to use this feature frequently. 

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{images/autocomplete} 

}

\caption{Tab auto-complete}(\#fig:img-autocomplete)
\end{figure}

## Base R and packages {#packages}

When you install R you will have access to a range of functions including options for data wrangling and statistical analysis. The functions that are included in the default installation are typically referred to as **Base R** and there is a useful cheat sheet that shows many Base R functions [here](https://www.rstudio.com/wp-content/uploads/2016/05/base-r.pdf).

However, the power of R is that it is extendable and open source - put simply, if a function doesn't exist or doesn't work very well, anyone can create a new **package** that contains data and code to allow you to perform new tasks. You may find it useful to think of Base R as the default apps that come on your phone and packages as additional apps that you need to download separately.

## Activity 3: Install the tidyverse (optional)

In order to use a package, you must first install it. The following code installs the package `tidyverse`, a package we will use very frequently in this course.

* If you are working on your own computer, use the below code to install the tidyverse. **You do not need to do this if you are working on the server or if you are using the computers in the Boyd Orr building**.  


```r
install.packages("tidyverse")
```

You only need to install a package once, however, each time you start R you need to load the packages you want to use, in a similar way that you need to install an app on your phone once, but you need to open it every time you want to use it.

\begin{danger}
If you get an error message that says something like ``WARNING: Rtools
is required to build R packages'' you may need to download and install
an extra bit of software called
\href{https://cran.r-project.org/bin/windows/Rtools/}{Rtools}.
\end{danger}

To load packages we use the function `library()`. Typically you would start any analysis script by loading all of the packages you need, but we will come back to that in the next chapter.

## Activity 4: Load the tidyverse

* Run the below code to load the tidyverse. You can do this regardless of whether you are using your own computer or the server.  


```r
library(tidyverse)
```

You will get what looks like an error message - it's not. It's just R telling you what it's done.

Now that we've loaded the `tidyverse` package we can use any of the functions it contains but remember, you need to run the `library()` function every time you start R.


## Package updates

In addition to updates to R and R Studio, the creators of packages also sometimes update their code. This can be to add functions to a package, or it can be to fix errors. One thing to avoid is unintentionally updating an installed package. When you run `install.packages()` it will always install the latest version of the package and it will overwrite any older versions you may have installed. Sometimes this isn't a problem, however, sometimes you will find that the update means your code no longer works as the package has changed substantially. It is possible to revert back to an older version of a package but try to avoid this anyway.

\begin{danger}
To avoid accidentally overwriting a package with a later version, you
should \textbf{never} include \texttt{install.packages()} in your
analysis scripts in case you, or someone else runs the code by mistake.
Remember, the server will already have all of the packages you need for
this course so you only need to install packages if you are using your
own machine.
\end{danger}

## Package conflicts {#conflicts}

There are thousands of different R packages with even more functions. Unfortunately, sometimes different packages have the same function names. For example, the packages `dplyr` and `MASS` both have a function named `select()`. If you load both of these packages, R will produce a warning telling you that there is a conflict.


```r
library(dplyr)
library(MASS)
```

```
## 
## Attaching package: 'MASS'
```

```
## The following object is masked from 'package:dplyr':
## 
##     select
```

In this case, R is telling you that the function `select()` in the `dplyr` package is being hidden (or 'masked') by another function with the same name. If you were to try and use `select()`, R would use the function from the package that was loaded most recently - in this case it would use the function from `MASS`.

If you want to specify which package you want to use for a particular function you can use code in the format `package::function`, for example:


```r
dplyr::select()
MASS::select()
```

## Objects

A large part of your coding will involve creating and manipulating objects. Objects contain stuff. That stuff can be numbers, words, or the result of operations and analyses.You assign content to an object using `<-`.

## Activity 5: Create some objects

* Copy and paste the following code into the console, change the code so that it uses your own name and age and run it. You should see that `name`, `age`, `today`, `new_year`, and `data` appear in the environment pane.  


```r
name <- "emily"
age <- 16 + 19 
today <-Sys.Date()
new_year <- as.Date("2021-01-01")
data <- rnorm(n = 10, mean = 15, sd = 3)
```

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{images/objects-enviro} 

}

\caption{Objects in the environment}(\#fig:img-objects-enviro)
\end{figure}

Note that in these examples, `name`,`age`, and `new_year` would always contain the values `emily`, `35`, and the date of New Year's Day 2021, however, `today` will draw the date from the operating system and `data` will be a randomly generated set of data so the values of these objects will not be static.

As a side note, if you ever have to teach programming and statistics, don't use your age as an example because every time you have to update your teaching materials you get a reminder of the fragility of existence and your advancing age. 2021 update: I have now given up updating my age, I will remain forever 35. 

Importantly, objects can be involved in calculations and can interact with each other. For example:


```r
age + 10
new_year - today
mean(data)
```

```
## [1] 45
## Time difference of -260 days
## [1] 17.66644
```

Finally, you can store the result of these operations in a new object:


```r
decade <- age + 10
```

\begin{try}
You may find it helpful to read \texttt{\textless{}-} as
\texttt{contains}, e.g., \texttt{name} contains the text \texttt{emily}.
\end{try}

You will constantly be creating objects throughout this course and you will learn more about them and how they behave as we go along, however, for now it is enough to understand that they are a way of saving values, that these values can be numbers, text, or the result of operations, and that they can be used in further operations to create new variables.

\begin{info}
You may also see objects referred to as `variables'. There is a
difference between the two in programming terms, however, they are used
synonymously very frequently.
\end{info}

## Looking after the environment

If you've been writing a lot of code you may find that the environment pane (or workspace) has become cluttered with many objects. This can make it difficult to figure out which object you need and therefore you run the risk of using the wrong data frame. If you're working on a new dataset, or if you've tried lots of different code before getting the final version, it is good practice to remember to clear the environment to avoid using the wrong object. You can do this in several way.

1. To remove individual objects, you can type `rm(object_name)` in the console. Try this now to remove one of the objects you created in the previous section. 
2. To clear all objects from the environment run `rm(list = ls())` in the console.
3. To clear all objects from the environment you can also click the broom icon in the environment pane. 


\begin{figure}

{\centering \includegraphics[width=1\linewidth]{images/broom} 

}

\caption{Clearing the workspace}(\#fig:img-broom)
\end{figure}

## Global options

By default, when you open R Studio it will show you what you were last working on, including your code and any objects you have created. This might sound helpful, but actually it tends to cause more problems than it's worth because it means that you risk accidentally using an old version of an object. We recommend changing the settings so that each time you start R Studio, it opens a fresh copy. You can do this by clicking `Tools` -  `Global Options` and then deselecting boxes so that it looks like the below.

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{images/global_options} 

}

\caption{Global options}(\#fig:img-options)
\end{figure}


## R sessions

When you open up R and start writing code, loading packages, and creating objects, you're doing so in a new **session**. In addition to clearing the workspace, it can sometimes be useful to start a new session. This will happen automatically each time you start R on your computer, although sessions can persist on the server. If you find that your code isn't working and you can't figure out why, it might be worth starting a new session. This will clear the environment and detach all loaded packages - think of it like restarting your phone.

## Activity 6

Click 'Session - Restart R'. 

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{images/new_session} 

}

\caption{The truth about programming}(\#fig:img-session)
\end{figure}

## How to cite R and RStudio

You may be some way off writing a scientific report where you have to cite and reference R, however, when the time comes it is important to do so to the people who built it (most of them for free!) credit. You should provide separate citations for R, RStudio, and the packages you use.

To get the citation for the version of R you are using, simply run the `citation()` function which will always provide you with he most recent citation.


```r
citation()
```

```
## 
## To cite R in publications use:
## 
##   R Core Team (2021). R: A language and environment for statistical
##   computing. R Foundation for Statistical Computing, Vienna, Austria.
##   URL https://www.R-project.org/.
## 
## A BibTeX entry for LaTeX users is
## 
##   @Manual{,
##     title = {R: A Language and Environment for Statistical Computing},
##     author = {{R Core Team}},
##     organization = {R Foundation for Statistical Computing},
##     address = {Vienna, Austria},
##     year = {2021},
##     url = {https://www.R-project.org/},
##   }
## 
## We have invested a lot of time and effort in creating R, please cite it
## when using it for data analysis. See also 'citation("pkgname")' for
## citing R packages.
```

To generate the citation for any packages you are using, you can also use the `citation()` function with the name of the package you wish to cite.


```r
citation("tidyverse")
```

```
## 
##   Wickham et al., (2019). Welcome to the tidyverse. Journal of Open
##   Source Software, 4(43), 1686, https://doi.org/10.21105/joss.01686
## 
## A BibTeX entry for LaTeX users is
## 
##   @Article{,
##     title = {Welcome to the {tidyverse}},
##     author = {Hadley Wickham and Mara Averick and Jennifer Bryan and Winston Chang and Lucy D'Agostino McGowan and Romain François and Garrett Grolemund and Alex Hayes and Lionel Henry and Jim Hester and Max Kuhn and Thomas Lin Pedersen and Evan Miller and Stephan Milton Bache and Kirill Müller and Jeroen Ooms and David Robinson and Dana Paige Seidel and Vitalie Spinu and Kohske Takahashi and Davis Vaughan and Claus Wilke and Kara Woo and Hiroaki Yutani},
##     year = {2019},
##     journal = {Journal of Open Source Software},
##     volume = {4},
##     number = {43},
##     pages = {1686},
##     doi = {10.21105/joss.01686},
##   }
```

To generate the citation for the version of RStudio you are using, you can use the `RStudio.Vesion()` function:


```r
RStudio.Version()
```

Finally, here's an example of how that might look in the write-up of your method section:

> Analysis was conducted using R (R Core Team, 2020), RStudio (Rstudio Team, 2020), and the tidyverse package (Wickham, 2017).

As noted, you may not have to do this for a while, but come back to this when you do as it's important to give the open-source community credit for their work.

## Help and additional resources

<div class="small_right"><img src="images/kitteh.png" /></div>

Getting good at programming really means getting good trying stuff out,  searching for help online, and finding examples of code to copy. If you are having difficulty with any of the exercises contained in this book then you can ask for help on Teams, however, learning to problem-solve effectively is a key skill that you need to develop throughout this course. 

* Use the help documentation. If you're struggling to understand how a function works, remember the `?function` command.
* If you get an error message, copy and paste it in to Google - it's very likely someone else has had the same problem.
* In addition to these course materials there are a number of excellent resources for learning R:
  * [R Cookbook](http://www.cookbook-r.com/)
  * [StackOverflow](https://stackoverflow.com/)
  * [R for Data Science](https://r4ds.had.co.nz/)
  * Search or use the [#rstats](https://twitter.com/search?f=tweets&q=%23rstats&src=typd) hashtag on Twitter


## Debugging tips

A large part of coding is trying to figure why your code doesn't work and this is true whether you are a novice or an expert. As you progress through this course  you should keep a record of mistakes you make and how you fixed them. In each chapter we will provide a number of common mistakes to look out for but you will undoubtedly make (and fix!) new mistakes yourself.

* Have you loaded the correct packages for the functions you are trying to use? One very common mistake is to write the code to load the package, e.g., `library(tidyverse)` but then forget to run it.
* Have you made a typo? Remember `data` is not the same as `DATA` and `t.test` is not the same as `t_test`.
* Is there a package conflict? Have you tried specifying the package and function with `package::function`?
* Is it definitely an error? Not all red text in R means an error - sometimes it is just giving you a message with information. 

## Activity 6: Test yourself

**Question 1.** Why should you never include the code `install.packages()` in your analysis scripts? <select class='webex-select'><option value='blank'></option><option value=''>You should use library() instead</option><option value=''>Packages are already part of Base R</option><option value='answer'>You (or someone else) may accidentally install a package update that stops your code working</option><option value=''>You already have the latest version of the package</option></select> 



<div class='webex-solution'><button>Explain This Answer</button>

Remember, when you run `install.packages()` it will always install the latest version of the package and it will overwrite any older versions of the package you may have installed.

</div>
 
<br>
**Question 2.**What will the following code produce?
  

```r
rnorm(6, 50, 10)
```

<select class='webex-select'><option value='blank'></option><option value=''>A dataset with 10 numbers that has a mean of 6 and an SD of 50</option><option value='answer'>A dataset with 6 numbers that has a mean of 50 and an SD of 10</option><option value=''>A dataset with 50 numbers that has a mean of 10 and an SD of 6</option><option value=''>A dataset with 50 numbers that has a mean of 10 and an SD of 6</option></select>  


<div class='webex-solution'><button>Explain This Answer</button>

The default form for `rnorm()` is `rnorm(n, mean, sd)`. If you need help remembering what each argument of a function does, look up the help documentation by running `?rnorm`

</div>
  
<br>
**Question 3.** If you have two packages that have functions with the same name and you want to specify exactly which package to use, what code would you use? 

<select class='webex-select'><option value='blank'></option><option value='answer'>package::function</option><option value=''>function::package</option><option value=''>library(package)</option><option value=''>install.packages(package)</option></select>  


<div class='webex-solution'><button>Explain This Answer</button>

You should use the form `package::function`, for example `dplyr::select`. Remember that when you first load your packages R will warn you if any functions have the same name - remember to look out for this!

</div>
  

**Question 4.** Which of the following is most likely to be an argument? <select class='webex-select'><option value='blank'></option><option value='answer'>35</option><option value=''>read_csv()</option><option value=''><-</option></select>

**Question 5.** An easy way to spot functions is to look for <select class='webex-select'><option value='blank'></option><option value='answer'>brackets</option><option value=''>numbers</option><option value=''>computers</option></select>.

**Question 6.** The job of `<-` is to send the output from the function to a/an <select class='webex-select'><option value='blank'></option><option value=''>argument</option><option value=''>assignment</option><option value='answer'>object</option></select>.




<!--chapter:end:02-programming-basics.Rmd-->

# Intro to R {#ref1}

There are eight activities in total for this chapter, but don't worry, they are broken down into very small steps!

## Walkthrough video

There is a [walkthrough video](https://uofglasgow.zoom.us/rec/play/uJ_2RvnP_UhUF7jM7hQZzOD6KjqjUm1UmPupTfFHBAftxrpMScYWRxkeuzGG0g0RqeE2UBCSmAO5riBo.6AKR_E01noBaq4-b?autoplay=true&startTime=1600178959000) of this chapter available via Zoom.

* Video notes: this video was recorded in September 2020 when we recommended using the server above installing R on your computer. With more experience of the server, we now strongly encourage you to install R on your computer if you can. The book has also been updated visually but there are no other differences between the video and this book chapter in terms of content.

## Activity 1: Upload data files to the server

The main disadvantage to using the R server is that you need to upload and download any files you are working on to and from the server (if you are using a local installation on your laptop you can skip this step).

In [Getting to know the data](https://psyteachr.github.io/ug1-practical/getting-to-know-the-data.html#activity-2) you downloaded the data files we will be using for this semester. In order to use these files, we need to copy them to the R server. Whilst we're not going to use the data in this chapter, it's a useful step to get ready for next week.

* Log on to the [R server](https://rstudio.psy.gla.ac.uk/)
* In the Files pane, click `New folder` and call it Psych 1A.
* Click `Upload` then `Browse`and choose the Psych 1A folder that you just created.
* Click `Choose file` and go and find the **zip folder** that you downloaded in [Getting to know the data](https://psyteachr.github.io/ug1-practical/getting-to-know-the-data.html#activity-2) (if you deleted it you can download it again). Using the zip folder means you can upload multiple files at once rather than one at a time.
* Once you have uploaded the zip file, the server will automatically unzip the files and you should be able to see all the files you have on your computer.

Please be aware that **there is no link between your computer and the R server**. If you change files on the server, they won't magically appear on your computer and you need to be very careful when you submit your homework files that you're submitting the right thing (last year we had lots of student submit blank files). This is the main reason we recommend installing R on your computer if you can.

## Activity 2: Set the working directory

Once you have uploaded the data, set the working directory by clicking `Session` -> `Set Working Directory` -> `Choose Directory` and then select the Data Skills 1A folder as your working directory. 

You need to do this step regardless of whether you are working from the server or from your laptop. This means that R knows which folder to look in for the data and scripts you might want to use.
## R Markdown for data skills work and homework assignments

For the data skills work and homework you will use a worksheet format called R Markdown (abbreviated as Rmd) which is a great way to create dynamic documents with embedded chunks of code. These documents are self-contained and fully reproducible (if you have the necessary data, you should be able to run someone else's analyses with the click of a button) which makes it very easy to share. This is an important part of your open science training as one of the reasons we are using R and RStudio is that it enables us to share open and reproducible information. Using these worksheets enables you to keep a record of all the code you write, and when it comes time for the portfolio assignments, we can give you a task and you can fill in the required code. 

For more information about R Markdown feel free to have a look at their main webpage http://rmarkdown.rstudio.com. The key advantage of R Markdown is that it allows you to write code into a document, along with regular text, and then **knit** it using the package `knitr` to create your document as either a webpage (HTML), a PDF, or Word document (.docx). 

## Activity 3: Open and save a new R Markdown document

To open a new R Markdown document click the 'new item' icon and then click 'R Markdown'. You will be prompted to give it a title, call it "Intro to R". Also, change the author name to your GUID as this will be good practice for the homework. Keep the output format as HTML.

Once you've opened a new document be sure to save it by clicking `File` -> `Save as`. You should also name this file "Intro to R". If you've set the working directory correctly, you should now see this file appear in your file viewer pane.

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{images/new-markdown} 

}

\caption{Opening a new R Markdown document}(\#fig:img-new-markdown)
\end{figure}

## Activity 4: Create a new code chunk

When you first open a new R Markdown document you will see a bunch of welcome text that looks like this:

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{images/markdown-default} 

}

\caption{New R Markdown text}(\#fig:img-markdown-default)
\end{figure}

Do the following steps:  
* Delete **everything** below line 7  
* On line 8 type "About me"  
* Click `Insert` -> `R`  

Your Markdown document should now look something like this:

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{images/new-chunk} 

}

\caption{New R chunk}(\#fig:img-new-chunk)
\end{figure}

What you have created is a **code chunk**. In R Markdown, anything written in the white space is regarded as normal text, and anything written in a grey code chunk is assumed to be code. This makes it easy to combine both text and code in one document.

\begin{warning}
When you create a new code chunk you should notice that the grey box
starts and ends with three back ticks ```. One common mistake is to
accidentally delete these back ticks. Remember, code chunks are grey and
text entry is white - if the colour of certain parts of your Markdown
doesn't look right, check that you haven't deleted the back ticks.
\end{warning}

## Activity 5: Write some code

Now we're going to use the code examples you read about in Programming Basics to add some simple code to our R Markdown document. 

* In your code chunk write the below code but replace the values of name/age/birthday with your own details).   
* Note that text values and dates need to be contained in quotation marks but numerical values do not. Missing and/or unnecessary quotation marks are a common cause of code not working - remember this!


```r
name <- "Emily" 
age <- 35
today <- Sys.Date()
next_birthday <- as.Date("2021-07-11")
```

## Running code

When you're working in an R Markdown document, there are several ways to run your lines of code.

First, you can highlight the code you want to run and then click `Run` -> `Run Selected Line(s)`, however this is very slow.

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{images/run1} 

}

\caption{Slow method of running code}(\#fig:img-run1)
\end{figure}

Alternatively, you can press the green "play" button at the top-right of the code chunk and this will run **all** lines of code in that chunk.

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{images/run2} 

}

\caption{Slightly better method of running code}(\#fig:img-run2)
\end{figure}

Even better though is to learn some of the keyboard shortcuts for R Studio. To run a single line of code, make sure that the cursor is in the line of code you want to run (it can be anywhere) and press `ctrl + enter`. If you want to run all of the code in the code chunk, press `ctrl + shift + enter`. Learn these shortcuts, they will make your life easier!

## Activity 6: Run your code

Run your code using one of the methods above. You should see the variables `name`, `age`, `today`, and `next_birthday` appear in the environment pane.

## Activity 7: Inline code

An incredibly useful feature of R Markdown is that R can insert values into your writing using **inline code**. If you've ever had to copy and paste a value or text from one file in to another, you'll know how easy it can be to make mistakes. Inline code avoids this. It's easier to show you what inline code does rather than to explain it so let's have a go.

First, copy and paste this text exactly (do not change anything) to the **white space** underneath your code chunk.



```r
My name is `r name` and I am `r age` years old. It is `r next_birthday - today` days until my birthday.
```

## Activity 8: Knitting your file

Nearly finished! As our final step we are going to "knit" our file. This simply means that we're going to compile our code into a document that is more presentable. To do this click `Knit` -> `Knit to HMTL`. R Markdown will create a new HTML document and it will automatically save this file in your working directory. 

As if by magic, that slightly odd bit of text you copied and pasted now appears as a normal sentence with the values pulled in from the objects you created. 

**My name is Emily and I am 35 years old. It is -69 days until my birthday.**

We're not going to use this function very often in the rest of the course but hopefully you can see just how useful this would be when writing up a report with lots of numbers! R Markdown is an incredibly powerful and flexible format - this book was written using it! If you want to push yourself with R, additional functions and features of R Markdown would be a good place to start.

Before we finish, there are a few final things to note about knitting that will be useful for the homework:  

* R Markdown will only knit if your code works - this is a good way of checking for the homework assignments whether you've written legal code!  
* You can choose to knit to a Word document rather than HTML. This can be useful for e.g., sharing with others, however, it may lose some functionality and it probably won't look as good so we'd recommend always knitting to HTML.
* You can choose to knit to PDF, however, unless you're using the server this requires an LaTex installation and is quite complicated. If you don't already know what LaTex is and how to use it, do not knit to PDF. If you do know how to use LaTex, you don't need us to give you instructions! 
* R will automatically open the knitted HTML file in the viewer, however, you can also navigate to the folder it is stored in and open the HTML file in your web browser (e.g., Chrome or Firefox).  

## Activity 9: Make R your own

Finally, you can customise how R Studio looks to make it feel more like your own personal version. Click `Tools` - `Global Options` - `Appearance`. You can change the default font, font size, and general appearance of R Studio, including using dark mode. Play around with the settings and see which one you prefer - you're going to spend a lot of time with R, it might as well look nice!

## Finished

And you're done! On your very first time using R you've not only written functioning code but you've written a reproducible output! You could send someone else your R Markdown document and they would be able to produce exactly the same HTML document as you, just by pressing knit.

The key thing we want you to take away from this chapter is that R isn't scary. It might be very new to a lot of you, but we're going to take you through it step-by-step. You'll be amazed at how quickly you can start producing professional-looking data visualisations and analysis.

If you're using the server, we recommend that you download any files that you have been working on so that you have a backup.


<!--chapter:end:03-intro-to-r.Rmd-->

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




\begin{danger}
There is also a function called \texttt{read.csv()}. Be very careful NOT
to use this function instead of \texttt{read\_csv()} as they have
different ways of naming columns. For the homework, unless your results
match ours \textbf{exactly} you will not get the marks which means you
need to be careful to use the right functions.
\end{danger}

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

\begin{danger}
If you get an error message when using select that says
\texttt{unused\ argument} it means that it is trying to use the wrong
version of the select function. There are two solutions to this, first,
save you work and then restart the R session (click session -restart R)
and then run all your code above again from the start, or replace
\texttt{select} with \texttt{dplyr::select} which tells R exactly which
version of the select function to use. We'd recommend restarting the
session because this will get you in the habit and it's a useful thing
to try for a range of problems
\end{danger}


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


<!--chapter:end:04-loading-data.Rmd-->

# Data wrangling 1

\begin{info}
So far you have been introduced to the R environment (e.g.~setting your
working directory and the difference between .R and .Rmd files). You
also began working with messy data by having a go at loading in datasets
using \texttt{read\_csv()}, joined files together using
\texttt{inner\_join()}, and pulled out variables of interest using
\texttt{select()}.

In this chapter, we'll be moving on to becoming familiar with the
Wickham Six and the functionality of the R package, \texttt{tidyverse}!
\end{info}

Data comes in lots of different formats. One of the most common formats is that of a two-dimensional table (the two dimensions being rows and columns).  Usually, each row stands for a separate observation (e.g. a subject), and each column stands for a different variable (e.g. a response, category, or group). A key benefit of tabular data (i.e., data in a table) is that it allows you to store different types of data-numerical measurements, alphanumeric labels, categorical descriptors-all in one place.

It may surprise you to learn that scientists actually spend far more time cleaning and preparing their data than they spend actually analysing it. This means completing tasks such as cleaning up bad values, changing the structure of tables, merging information stored in separate tables, reducing the data down to a subset of observations, and producing data summaries. Some have estimated that up to 80% of time spent on data analysis involves such data preparation tasks (Dasu & Johnson, 2003)!

Many people seem to operate under the assumption that the only option for data cleaning is the painstaking and time-consuming cutting and pasting of data within a spreadsheet program like Excel. We have witnessed students and colleagues waste days, weeks, and even months manually transforming their data in Excel, cutting, copying, and pasting data. Fixing up your data by hand is not only a terrible use of your time, but it is error-prone and not reproducible. Additionally, in this age where we can easily collect massive datasets online, you will not be able to organise, clean, and prepare these by hand. 

In short, you will not thrive as a psychologist if you do not learn some key data wrangling skills. Although every dataset presents unique challenges, there are some systematic principles you should follow that will make your analyses easier, less error-prone, more efficient, and more reproducible.

In this chapter you will see how data science skills will allow you to efficiently get answers to nearly any question you might want to ask about your data. By learning how to properly make your computer do the hard and boring work for you, you can focus on the bigger issues.

## Tidyverse

Tidyverse (https://www.tidyverse.org/) is a collection of R packages created by world-famous data scientist Hadley Wickham. 

Tidyverse contains six core packages:  `dplyr`, `tidyr`, `readr`, `purrr`,  `ggplot2`, and `tibble`. In the last chapter when you typed `library(tidyverse)` into R, you will have seen that it loads in all of these packages in one go. Within these six core packages, you should be able to find everything you need to wrangle and visualise your data. 

In this chapter, we are going to focus on the `dplyr` package, which contains six important functions: 

* `select()` Include or exclude certain variables (columns)
* `filter()` Include or exclude certain observations (rows)
* `mutate()` Create new variables (columns)
* `arrange()` Change the order of observations (rows)
* `group_by()` Organize the observations into groups
* `summarise()` Derive aggregate variables for groups of observations

These six functions are known as ’single table verbs’ because they only operate on one table at a time. Although the operations of these functions may seem very simplistic, it’s amazing what you can accomplish when you string them together: Hadley Wickham has claimed that 90% of data analysis can be reduced to the operations described by these six functions. 

Again, we don't expect you to remember everything in this chapter - the important thing is that you know where to come and look for help when you need to do particular tasks. Being good at coding really is just being good at knowing what to copy and paste. 


## The `babynames` database

To demonstrate the power of the six `dplyr` verbs, we will use them to work with the babynames data from the `babynames` package (we will return to the AHI and CES-D dataset in the next chapter!). The babynames dataset has historical information about births of babies in the U.S.

## Walkthrough video

There is a [walkthrough video](https://uofglasgow.zoom.us/rec/play/cr3jnI9QXR0stOqd3nBv51BNrQrlkkzBN0_c8-Mtq7JOGrNW2jQEkbJqRMhh5W7lJLSQEfZfFIZJTvL5.-imkxiOU0A-aTdpM?continueMode=true&_x_zm_rtaid=cW5f8v0JQcOlLI1cBpI84g.1628694791961.c3bcc75dbabdfb3f3ac44f8fd7884865&_x_zm_rhtaid=355) of this chapter available via Zoom.

* Video notes: this video was recorded in 2020, it uses the server, and the book has been updated visually.  There are no other differences between the video and this book chapter.

## Activity 1: Set-up

Do the following. If you need help, consult Programming Basics and Intro to R.

* Open R Studio and ensure the environment is clear.  
* Open the `stub-wrangling-1.Rmd` file and ensure that the working directory is set to your Data Skills folder.    
* If you're on the server, avoid a number of issues by restarting the session - click `Session` - `Restart R`  
* If you are working on your own computer, install the package `babynames`. If you are working on the server or a university computer, this package will already be installed.
* Type and run the code that loads the packages `tidyverse` and `babynames` using `library()` in the Activity 1 code chunk.  


```r
library(tidyverse)
library(babynames)
```


## Activity 2: Look at the data

The package `babynames` contains an object of the same name that contains all the data about babynames. 

* View a preview of this dataset by running `head(babynames)`. You should see the following output:


```
## # A tibble: 6 x 5
##    year sex   name          n   prop
##   <dbl> <chr> <chr>     <int>  <dbl>
## 1  1880 F     Mary       7065 0.0724
## 2  1880 F     Anna       2604 0.0267
## 3  1880 F     Emma       2003 0.0205
## 4  1880 F     Elizabeth  1939 0.0199
## 5  1880 F     Minnie     1746 0.0179
## 6  1880 F     Margaret   1578 0.0162
```

A tibble is basically a table of data presenting a two dimensional array of your data. `head()` just shows the first five rows of the dataset which is good when you have a very large dataset - in this case `babynames` contains nearly two million data rows! Interested in analyzing these data by hand? No thanks!

Each row in the table represents data about births for a given name and sex in a given year. The variables are:


variable|type             |description
--------|-----------------|--------------------------------------------
  year  |double (numeric) |year of birth
  sex 	|character 	      |recorded sex of baby (F = female, M = male)
  name 	|character 	      |forename given to baby
  n 	  |integer 	        |number of babies given that name
  prop 	|double (numeric) |	proportion of all babies of that sex


The first row of the table tells us that in the year 1880, there were 7065 baby girls born in the U.S. who were given the name Mary, and this accounted for about 7% of all baby girls.

## Activity 3: Data visualisation

* Type the code below into a new code chunk and run it. 

We're going to cover how to write visualisation code in the next chapter so still don't worry about not understanding the plot code yet. The point is show you how much you can accomplish with very little code. The code creates a graph showing the popularity of four girl baby names - Alexandra, Beverly, Emily, and Kathleen - from 1880 to 2014.  You should see Figure \@ref(fig:babynames-plot) appear, which shows the proportion of each name across different years.


```r
dat <- babynames %>% 
  filter(name %in% c("Emily","Kathleen","Alexandra","Beverly"), sex=="F")

ggplot(data = dat,aes(x = year,y = prop, colour=name))+
  geom_line()  
```

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{05-wrangling-1_files/figure-latex/babynames-plot-1} 

}

\caption{Proportion of four baby names from 1880 to 2014}(\#fig:babynames-plot)
\end{figure}

* Change the names to your own examples and see how the plot changes. You can also change the sex from "F" to "M". Post the photos of your new plots on the Teams Data Skills channel.
* Because in most countries assigned sex at birth is binary, there is no data on intersex, trans or non-binary names. In lieu of that, here's the [Wikipedia page about gender-neutral names and naming laws](https://en.wikipedia.org/wiki/Unisex_name) around the world which will hopefully make you question why on earth we ascribe someone's entire gender identity to a bunch of sounds and letters we use to label them. 


<div class='webex-solution'><button>But I want to display male AND female names!</button>


This is more complicated than you might first imagine so only read on if you're feeling confident. If you  remove the filter for `sex` when creating `dat` and then run the plot code again, it will make a very messy looking plot (try it). This is because for most names there will be two data points because although the numbers might be small for gendered names, there is usually always at least one baby of the non-dominant name gender that has been assigned that name.

You can get around this by adding an additional line of code that produces separate plots by sex. The scale argument tells R that it can use different scales on the y-axis for each plot - when there's a large difference between the two scales this is helpful to allow you to see the data in both sets (run this code and then remove the scales argument and run it again to see the difference) although it does run the risk of people misinterpreting the data if the difference between the scales isn't made clear.


```r
dat2 <- babynames %>% 
  filter(name %in% c("Emily","Kathleen","Alexandra","Beverly"))

ggplot(data = dat2,aes(x = year,y = prop, colour=name))+
  geom_line() +
  facet_wrap(~sex, scales = "free_y", nrow = 2)
```

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{05-wrangling-1_files/figure-latex/unnamed-chunk-4-1} 

}

\caption{Plots by sex with different scales}(\#fig:unnamed-chunk-4)
\end{figure}

On the other hand, if the scales for your two groups are fairly similar, it's better to keep the same scales to aid comparison. This time we will filter the dataset for gender neutral names where it might make more sense to have them on the same scale - again try it with and without the scales argument to see what happens


```r
dat3 <- babynames %>% 
  filter(name %in% c("Sam","Alex","Jordan","Drew"))

ggplot(data = dat3,aes(x = year,y = prop, colour=name))+
  geom_line() +
  facet_wrap(~sex, nrow = 2)
```

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{05-wrangling-1_files/figure-latex/unnamed-chunk-5-1} 

}

\caption{Plots by sex with the same scale}(\#fig:unnamed-chunk-5)
\end{figure}

</div>



## Activity 4: Selecting variables of interest

There are two numeric measurements of name popularity, `prop` (the proportion of all babies with each name) is probably more useful than `n`  (total number of babies with that name), because it takes into account that different numbers of babies are born in different years. 

Just like in Loading Data, if we wanted to create a dataset that only includes certain variables, we can use the `select()` function from the `dplyr` package. Run the below code to only select the columns `year`, `sex`, `name` and `prop`.  


```r
select(.data = babynames, # the object you want to select variables from
       year, sex, name, prop) # the variables you want to select
```

\begin{danger}
If you get an error message when using select that says
\texttt{unused\ argument} it means that it is trying to use the wrong
version of the select function. There are two solutions to this, first,
save you work and then restart the R session (click session -restart R)
and then run all your code above again from the start, or replace
\texttt{select} with \texttt{dplyr::select} which tells R exactly which
version of the select function to use. We'd recommend restarting the
session because this will get you in the habit and it's a useful thing
to try for a range of problems
\end{danger}

Alternatively, you can also tell R which variables you don't want, in this case, rather than telling R to select `year`, `sex`, `name` and `prop`, we can simply tell it to drop the column `n` using the minus sign `-` before the variable name.


```r
select(.data = babynames, -n)
```


Note that `select()` does not change the original tibble, but makes a new tibble with the specified columns. If you don't save this new tibble to an object, it won't be saved. If you want to keep this new dataset, create a new object. When you run this code, you will see your new tibble appear in the environment pane. 


```r
new_dat <- select(.data = babynames, -n)
```

## Activity 5: Arranging the data

The function `arrange()` will sort the rows in the table according to the columns you supply. Try running the following code:


```r
arrange(.data = babynames, # the data you want to sort
        name) # the variable you want to sort by
```

The data are now sorted in ascending alphabetical order by name. The default is to sort in ascending order. If you want it descending, wrap the name of the variable in the `desc()` function. For instance, to sort by year in descending order, run the following code:


```r
arrange(babynames,desc(year)) 
```

You can also sort by more than one column. What do you think the following code will do?


```r
arrange(babynames, desc(year), desc(sex), desc(prop)) 
```

## Activity 6: Using filter to select observations

We have previously used `select()` to select certain variables or columns, however, frequently you will also want to select only certain observations or rows, for example, only babies born after 1999, or only babies named "Mary". You do this using the verb `filter()`. The `filter()` function is a bit more involved than the other verbs, and requires more detailed explanation, but this is because it is also extremely powerful. 

Here is an example of filter, can you guess what it will do?


```r
 filter(.data = babynames, year > 2000)
```

The first part of the code tells the function to use the object `babynames`. The second argument, `year > 2000`, is what is known as a **Boolean expression**: an expression whose evaluation results in a value of TRUE or FALSE. What `filter()` does is include any observations (rows) for which the expression evaluates to TRUE, and exclude any for which it evaluates to FALSE. So in effect, behind the scenes, `filter()` goes through the entire set of 1.8 million observations, row by row, checking the value of year for each row, keeping it if the value is greater than 2000, and rejecting it if it is less than 2000. To see how a boolean expression works, consider the code below:


```r
years <- 1996:2005
years
years > 2000
```

```
##  [1] 1996 1997 1998 1999 2000 2001 2002 2003 2004 2005
##  [1] FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE
```

You can see that the expression `years > 2000` returns a **logical vector** (a vector of TRUE and FALSE values), where each element represents whether the expression is true or false for that element. For the first five elements (1996 to 2000) it is false, and for the last five elements (2001 to 2005) it is true.

Here are the most commonly used Boolean expressions.

Operator	|Name	                 |is TRUE if and only if
----------|----------------------|---------------------------------
A < B 	  |less than 	           |A is less than B
A <= B 	  |less than or equal    |A is less than or equal to B
A > B 	  |greater than 	       |A is greater than B
A >= B 	  |greater than or equal |A is greater than or equal to B
A == B 	  |equivalence 	         |A exactly equals B
A != B 	  |not equal 	           |A does not exactly equal B
A %in% B 	|in 	                 |A is an element of vector B

If you want only those observations for a specific name (e.g., Mary), you use the equivalence operator `==`. Note that you use double equal signs, not a single equal sign.


```r
filter(babynames, name == "Mary")
```

If you wanted all the names except Mary, you use the 'not equals' operator:


```r
filter(babynames, name!="Mary") 
```

And if you wanted names from a defined set - e.g., names of British queens - you can use `%in%`:


```r
filter(babynames, name %in% c("Mary","Elizabeth","Victoria"))
```


This gives you data for the names in the vector on the right hand side of `%in%`. You can always invert an expression to get its opposite. So, for instance, if you instead wanted to get rid of all Marys, Elizabeths, and Victorias you would use the following:


```r
filter(babynames, !(name %in% c("Mary","Elizabeth","Victoria")))
```

You can include as many expressions as you like as additional arguments to `filter()` and it will only pull out the rows for which all of the expressions for that row evaluate to TRUE. For instance, `filter(babynames, year > 2000, prop > .01)` will pull out only those observations beyond the year 2000 that represent greater than 1% of the names for a given sex; any observation where either expression is false will be excluded. This ability to string together criteria makes `filter()` a very powerful member of the Wickham Six.

**Remember that this section exists. It will contain a lot of the answers to problems you face when wrangling data!**

## Activity 7: Creating new variables

Sometimes we need to create a new variable that doesn’t exist in our dataset. For instance, we might want to figure out what decade a particular year belongs to. To create new variables, we use the function `mutate()`. Note that if you want to save this new column, you need to save it to an object. Here, you are mutating a new column and attaching it to the `new_dat` object you created in Activity 4.


```r
new_dat <- mutate(.data = babynames, # the tibble you want to add a column to
                  decade = floor(year/10) *10) # new column name = what you want it to contain
head(new_dat)
```

```
## # A tibble: 6 x 6
##    year sex   name          n   prop decade
##   <dbl> <chr> <chr>     <int>  <dbl>  <dbl>
## 1  1880 F     Mary       7065 0.0724   1880
## 2  1880 F     Anna       2604 0.0267   1880
## 3  1880 F     Emma       2003 0.0205   1880
## 4  1880 F     Elizabeth  1939 0.0199   1880
## 5  1880 F     Minnie     1746 0.0179   1880
## 6  1880 F     Margaret   1578 0.0162   1880
```

In this case, you are creating a new column decade  which has the decade each year appears in. This is calculated using the command `decade = floor(year/10)*10`.

## Activity 8: Grouping and summarising

Most quantitative analyses will require you to summarise your data somehow, for example, by calculating the mean, median or a sum total of your data. You can perform all of these operations using the function `summarise()`.

First, let's use the object `dat` that just has the data for the four girls names, Alexandra, Beverly, Emily, and Kathleen. To start off, we're simply going to calculate the total number of babies across all years that were given one of these four names.

It's useful to get in the habit of translating your code into full sentences to make it easier to figure out what's happening. You can read the below code as "run the function summarise using the data in the object `dat` to create a new variable named `total` that is the result of adding up all the numbers in the column `n`".


```r
summarise(.data = dat, # the data you want to use
          total = sum(n)) # result = operation
```

```
## # A tibble: 1 x 1
##     total
##     <int>
## 1 2161374
```

`summarise()` becomes even more powerful when combined with the final `dplyr` function, `group_by()`. Quite often, you will want to produce your summary statistics broken down by groups, for examples, the scores of participants in different conditions, or the reading time for native and non-native speakers.

There are two ways you can use `group_by()`. First, you can create a new, grouped object.


```r
group_dat <- group_by(.data = dat, # the data you want to group
                      name) # the variable you want to group by
```

If you look at this object in the viewer, it won't look any different to the original `dat`, however, the underlying structure has changed. Let's run the above summarise code again, but now using the grouped data.


```r
summarise(.data = group_dat, 
          total = sum(n)) 
```

```
## # A tibble: 4 x 2
##   name       total
##   <chr>      <int>
## 1 Alexandra 231364
## 2 Beverly   376914
## 3 Emily     841491
## 4 Kathleen  711605
```

`summarise()` has performed exactly the same operation as before - adding up the total number in the column `n` - but this time it has done is separately for each group, which in this case was the variable `name`.

You can request multiple summary calculations to be performed in the same function. For example, the following code calculates the mean and median number of babies given each name every year.


```r
summarise(group_dat,
          mean_year = mean(n),
          median_year = median(n))
```

```
## # A tibble: 4 x 3
##   name      mean_year median_year
##   <chr>         <dbl>       <dbl>
## 1 Alexandra     1977.        192 
## 2 Beverly       3089.        710.
## 3 Emily         6098.       1392.
## 4 Kathleen      5157.       3098
```

You can also add multiple grouping variables. For example, the following code groups `new_dat` by `sex` and `decade` and then calculates the summary statistics to give us the mean and median number of male and female babies in each decade.


```r
group_new_dat <- group_by(new_dat, sex, decade)
summarise(group_new_dat,
          mean_year = mean(n),
          median_year = median(n))
```

```
## `summarise()` has grouped output by 'sex'. You can override using the `.groups` argument.
```

```
## # A tibble: 28 x 4
## # Groups:   sex [2]
##    sex   decade mean_year median_year
##    <chr>  <dbl>     <dbl>       <dbl>
##  1 F       1880      111.          13
##  2 F       1890      128.          13
##  3 F       1900      131.          12
##  4 F       1910      187.          12
##  5 F       1920      211.          12
##  6 F       1930      214.          12
##  7 F       1940      262.          12
##  8 F       1950      288.          13
##  9 F       1960      235.          12
## 10 F       1970      147.          11
## # ... with 18 more rows
```

\begin{info}
If you get what looks like an error that says
\texttt{summarise()\ ungrouping\ output\ (override\ with\ .groups\ argument)}don't
worry, this isn't an error it's just R telling you what it's done. This
message was included in a very recent update to the \texttt{tidyverse}
which is why it doesn't appear on some of the walkthrough vidoes.
\end{info}



## Activity 9: Pipes

The final activity for this chapter essentially repeats what we've already covered but in a slightly different way. In the previous activities, you created new objects with new variables or groupings and then you called `summarise()` on those new objects in separate lines of code. As a result, you had multiple objects in your environment pane and you need to make sure that you keep track of the different names. 

Instead, you can use **pipes**. Pipes are written as `%>%`and they should be read as "and then". Pipes allow you to string together 'sentences' of code into 'paragraphs' so that you don't need to create intermediary objects. Again, it is easier to show than tell.

The below code does **exactly** the same as all the code we wrote above but it only creates one object.



```r
pipe_summary <- mutate(babynames, decade = floor(year/10) *10) %>%
  filter(name %in% c("Emily","Kathleen","Alexandra","Beverly"), sex=="F") %>%
  group_by(name, decade) %>%
  summarise(mean_decade = mean(n))
```

The reason that this function is called a pipe is because it 'pipes' the data through to the next function. When you wrote the code previously, the first argument of each function was the dataset you wanted to work on. When you use pipes it will automatically take the data from the previous line of code so you don't need to specify it again.

\begin{try}
When learning to code it can be a useful practice to read your code `out
loud' in full sentences to help you understand what it is doing. You can
read the code above as ``create a new variable called decade AND THEN
only keep the names Emily, Kathleen, Alexandra and Beverly that belong
to female babies AND THEN group the dataset by name and decade AND THEN
calculate the mean number of babies with each name per decade.'' Try
doing this each time you write a new bit of code.
\end{try}

Some people find pipes a bit tricky to understand from a conceptual point of view, however, it's well worth learning to use them as when your code starts getting longer they are much more efficient and mean you have to write less code which is always a good thing! 

## Finished!

That was a long chapter but remember, you don't need to memorise all of this code. You just need to know where to look for help. Finally, if you're working from the R server, we'd recommend that you download a copy of the changes you've made to `stub-wrangling-1` so that you have a backup.

<!--chapter:end:05-wrangling-1.Rmd-->

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

\begin{danger}
If you get an error message when using select that says
\texttt{unused\ argument} it means that it is trying to use the wrong
version of the select function. There are two solutions to this, first,
save you work and then restart the R session (click session -restart R)
and then run all your code above again from the start, or replace
\texttt{select} with \texttt{dplyr::select} which tells R exactly which
version of the select function to use. We'd recommend restarting the
session because this will get you in the habit and it's a useful thing
to try for a range of problems
\end{danger}

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
age_65max <- filter(ahi_asc, age < 65)
```

******

* What does `filter()` do? 

<select class='webex-select'><option value='blank'></option><option value=''>splits a column into multiple columns</option><option value=''>transforms existing columns</option><option value=''>takes multiple columns and collapses them together</option><option value='answer'>removes information that we are not interested in</option></select>

* How many observations are left in `age_65max` after running `filter()`? <input class='webex-solveme nospaces' size='3' data-answer='["939"]'/>

******

## Activity 5: Summarise  

Then, use summarise to create a new variable ```data_median```, which calculates the median ahiTotal score in this grouped data and assign it a table head called ```median_score```.

```r
data_median <- summarise(age_65max, median_score = median(ahiTotal))
```

******

* What is the median score? <input class='webex-solveme nospaces' size='2' data-answer='["74"]'/>

* Change the above code to give you the **mean score**. What is the mean score to 2 decimal places? <input class='webex-solveme nospaces' size='5' data-answer='["72.48"]'/>


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

\begin{info}
If you get what looks like an error that says
\texttt{summarise()\ ungrouping\ output\ (override\ with\ .groups\ argument)}don't
worry, this isn't an error it's just R telling you what it's done. This
message was included in a very recent update to the \texttt{tidyverse}
which is why it doesn't appear on some of the walkthrough vidoes.
\end{info}

******

**Pause here and interpret the above code and output**

* What does `group_by()` do? 

<select class='webex-select'><option value='blank'></option><option value=''>provides summary statistics of an existing dataframe</option><option value=''>organises information in ascending or descending order</option><option value=''>transforms existing columns</option><option value='answer'>groups data frames based on a specific column so that all later operations are carried out on a group basis</option></select>

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

<!--chapter:end:06-wrangling-2.Rmd-->

# Intro to Data Viz

## Walkthrough video

There is a [walkthrough video](https://uofglasgow.zoom.us/rec/play/Q9BA93fhXCTrTyRF962J8cWI7YDQ1dca0u3sbPstj-ktY4e52jv_b5vtAZMgI6fAM3Cip_L0itlsym8.zF0_1My59xl1MGmG?startTime=1602848670000&_x_zm_rtaid=O3m7PQzzQaOVR8tM0-Br7w.1602858026802.e830dc177e59e2fba3d0bc04b83ddf60&_x_zm_rhtaid=842) of this chapter available via Zoom.

* Video notes: this video was recorded in 2020, it uses the server, and the book has been updated visually.  There are no other differences between the video and this book chapter.

## Activity 1: dplyr recap

In Data Wrangling 1 and 2 we were introduced to the tidyverse package, `dplyr`, and its six important functions. As a recap, which function(s) would you use to approach each of the following problems?

* We have a dataset of 400 adults, but we want to remove anyone with an age of 50 years or more. To do this, we could use the <select class='webex-select'><option value='blank'></option><option value='answer'>filter()</option><option value=''>summarise()</option><option value=''>select()</option><option value=''>mutate()</option><option value=''>arrange()</option><option value=''>group_by()</option></select> function.

* We are interested in overall summary statistics for our data, such as the overall average and total number of observations. To do this, we could use the <select class='webex-select'><option value='blank'></option><option value=''>filter()</option><option value=''>arrange()</option><option value='answer'>summarise()</option><option value=''>select()</option><option value=''>mutate()</option><option value=''>group_by()</option></select> function.

* Our dataset has a column with the number of cats a person has, and a column with the number of dogs. We want to calculate a new column which contains the total number of pets each participant has. To do this, we could use the <select class='webex-select'><option value='blank'></option><option value=''>filter()</option><option value=''>select()</option><option value=''>group_by()</option><option value='answer'>mutate()</option><option value=''>summarise()</option><option value=''>arrange()</option></select> function.

* We want to calculate the average for each participant in our dataset. To do this we could use the <select class='webex-select'><option value='blank'></option><option value=''>arrange() and mutate()</option><option value='answer'>group_by() and summarise()</option><option value=''>group_by() and arrange()</option><option value=''>filter() and select()</option></select> functions.

* We want to order a dataframe of participants by the number of cats that they own, but want our new dataframe to only contain some of our columns. To do this we could use the <select class='webex-select'><option value='blank'></option><option value=''>group_by() and mutate()</option><option value=''>select() and summarise()</option><option value='answer'>mutate() and filter()</option><option value='answer'>arrange() and select()</option></select> functions.

## Data visualisation

As Grolemund and Wickham tell us:

> Visualisation is a fundamentally human activity. A good visualisation will show you things that you did not expect, or raise new questions about the data. A good visualisation might also hint that you’re asking the wrong question, or you need to collect different data. Visualisations can surprise you, but don’t scale particularly well because they require a human to interpret them.

(http://r4ds.had.co.nz/introduction.html)

Being able to visualise our variables, and relationships between our variables, is a very useful skill. Before we do any statistical analyses or present any summary statistics, we should visualise our data as it is:

1. A quick and easy way to check our data make sense, and to identify any unusual trends.

2. A way to honestly present the features of our data to anyone who reads our research.

`ggplot()` builds plots by combining layers (see Figure \@ref(fig:img-layers))). If you're used to making plots in Excel this might seem a bit odd at first, however, it means that you can customise each layer and R is capable of making very complex and beautiful figures ([this website](https://www.data-to-viz.com/) gives you a good sense of what's possible).

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{images/layers} 

}

\caption{ggplot2 layers from Field et al. (2012)}(\#fig:img-layers)
\end{figure}

## Activity 2: Set-up

* Open R Studio and ensure the environment is clear.  
* Open the `stub-data-viz.Rmd` file and ensure that the working directory is set to your Data Skills folder and that the two .csv data files (`participant-info.csv` and `ahi-cesd.csv`) are in your working directory (you should see them in the file pane).  
* If you're on the server, avoid a number of issues by restarting the session - click `Session` - `Restart R`  
* Type and run the below code to load the `tidyverse` package and to load in the data files in to the Activity 2 code chunk. 


```r
library(tidyverse) 

dat <- read_csv('ahi-cesd.csv')
pinfo <- read_csv('participant-info.csv')
all_dat <- inner_join(dat, pinfo, by= c("id", "intervention"))
summarydata <- select(.data = all_dat, 
                      ahiTotal, cesdTotal, sex, age, 
                      educ, income, occasion, elapsed.days) 
```



\begin{danger}
If you get an error message when using select that says
\texttt{unused\ argument} it means that it is trying to use the wrong
version of the select function. There are two solutions to this, first,
save you work and then restart the R session (click session -restart R)
and then run all your code above again from the start, or replace
\texttt{select} with \texttt{dplyr::select} which tells R exactly which
version of the select function to use. We'd recommend restarting the
session because this will get you in the habit and it's a useful thing
to try for a range of problems
\end{danger}

## Activity 3: Factors

Before we go any further we need to perform an additional step of data processing that we have glossed over up until this point. First, run the below code to look at the structure of the dataset:


```r
str(summarydata)
```

```
## tibble [992 x 8] (S3: tbl_df/tbl/data.frame)
##  $ ahiTotal    : num [1:992] 32 34 34 35 36 37 38 38 38 38 ...
##  $ cesdTotal   : num [1:992] 50 49 47 41 36 35 50 55 47 39 ...
##  $ sex         : num [1:992] 1 1 1 1 1 1 2 1 2 2 ...
##  $ age         : num [1:992] 46 37 37 19 40 49 42 57 41 41 ...
##  $ educ        : num [1:992] 4 3 3 2 5 4 4 4 4 4 ...
##  $ income      : num [1:992] 3 2 2 1 2 1 1 2 1 1 ...
##  $ occasion    : num [1:992] 5 2 3 0 5 0 2 2 2 4 ...
##  $ elapsed.days: num [1:992] 182 14.2 33 0 202.1 ...
```

R assumes that all the variables are numeric (represented by `num`) and this is going to be a problem because whilst `sex`, `educ`, and `income` are represented by numerical codes, they aren't actually numbers, they're categories, or **factors**. 

We need to tell R that these variables are factors and we can use `mutate()` to do this by overriding the original variable with the same data but classified as a factor. Type and run the below code to change the categories to factors.


```r
summarydata <- summarydata %>%
  mutate(sex = as.factor(sex),
         educ = as.factor(educ),
         income = as.factor(income))
```

You can read this code as "overwrite the data that is in the column sex with sex as a factor".

**Remember this. It's a really important step and if your graphs are looking weird this might be the reason.**

## Activity 4: Bar plot

For our first example we will recreate the bar plot showing the number of male and female participants from Loading Data by showing you how the layers of code build up (next semester we have data that includes non-binary participants).

* The first line (or layer) sets up the base of the graph: the data to use and the aesthetics (what will go on the x and y axis, how the plot will be grouped).    
* `aes()` can take both an `x` and `y` argument, however, with a bar plot you are just asking R to count the number of data points in each group so you don't need to specify this. 


```r
ggplot(summarydata, aes(x = sex))
```

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{07-data-viz_files/figure-latex/layer1-1} 

}

\caption{First ggplot layer sets the axes}(\#fig:layer1)
\end{figure}

* The next layer adds a **geom** or a shape, in this case we use `geom_bar()` as we want to draw a bar plot.  


```r
ggplot(summarydata, aes(x = sex)) +
  geom_bar()
```

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{07-data-viz_files/figure-latex/unnamed-chunk-3-1} 

}

\caption{Basic barplot}(\#fig:unnamed-chunk-3)
\end{figure}

* Adding `fill` to the first layer will separate the data into each level of the grouping variable and give it a different colour. In this case, there is a different coloured bar for each level of `sex`.


```r
ggplot(summarydata, aes(x = sex, fill = sex)) +
  geom_bar()
```

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{07-data-viz_files/figure-latex/unnamed-chunk-4-1} 

}

\caption{Barplot with colour}(\#fig:unnamed-chunk-4)
\end{figure}

* `fill()` has also produced a plot legend to the right of the graph. When you have multiple grouping variables you need this to know which groups each bit of the plot is referring to, but in this case it is redundant because it doesn't tell us anything that the axis labels don't already. We can get rid of it by adding `show.legend = FALSE` to the `geom_bar()` code.


```r
ggplot(summarydata, aes(x = sex, fill = sex)) +
  geom_bar(show.legend = FALSE)
```

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{07-data-viz_files/figure-latex/unnamed-chunk-5-1} 

}

\caption{Barplot without legend}(\#fig:unnamed-chunk-5)
\end{figure}

We might want to tidy up our plot to make it look a bit nicer. First we can edit the axis labels to be more informative. The most common functions you will use are:

* `scale_x_continuous()` for adjusting the x-axis for a continuous variable
* `scale_y_continuous()` for adjusting the y-axis for a continuous variable
* `scale_x_discrete()` for adjusting the x-axis for a discrete/categorical variable
* `scale_y_discrete()` for adjusting the y-axis for a discrete/categorical variable

And in those functions the two most common arguments you will use are:

* `name` which controls the name of each axis
* `labels` which controls the names of the break points on the axis

There are lots more ways you can customise your axes but we'll stick with these for now. Copy, paste, and run the below code to change the axis labels and change the numeric sex codes into words.


```r
ggplot(summarydata, aes(x = sex, fill = sex)) +
  geom_bar(show.legend = FALSE) +
  scale_x_discrete(name = "Participant Sex", 
                   labels = c("Female", "Male")) +
  scale_y_continuous(name = "Number of participants")
```

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{07-data-viz_files/figure-latex/unnamed-chunk-6-1} 

}

\caption{Barplot with axis labels}(\#fig:unnamed-chunk-6)
\end{figure}

Second, you might want to adjust the colours and the visual style of the plot. `ggplot2` comes with built in themes. Below, we'll use `theme_minimal()` but try typing `theme_` into a code chunk and try all the options that come up to see which one you like best. 


```r
ggplot(summarydata, aes(x = sex, fill = sex)) +
  geom_bar(show.legend = FALSE) +
  scale_x_discrete(name = "Participant Sex", 
                   labels = c("Female", "Male")) +
  scale_y_continuous(name = "Number of participants") +
  theme_minimal()
```

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{07-data-viz_files/figure-latex/unnamed-chunk-7-1} 

}

\caption{Barplot with minimal theme}(\#fig:unnamed-chunk-7)
\end{figure}

There are various options to adjust the colours but a good way to be inclusive is to use a colour-blind friendly palette that can also be read if printed in black-and-white. To do this, we can add on the function `scale_fill_viridis_d()`. This function has 5 colour options, A, B, C, D, and E. I prefer E but you can play around with them and choose the one you prefer.


```r
ggplot(summarydata, aes(x = sex, fill = sex)) +
  geom_bar(show.legend = FALSE) +
  scale_x_discrete(name = "Participant Sex", 
                   labels = c("Female", "Male")) +
  scale_y_continuous(name = "Number of participants") +
  theme_minimal() +
  scale_fill_viridis_d(option = "E")
```

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{07-data-viz_files/figure-latex/unnamed-chunk-8-1} 

}

\caption{Barplot with colour-blind friendly colour scheme}(\#fig:unnamed-chunk-8)
\end{figure}

Finally, you can also adjust the transparency of the bars by adding `alpha` to `geom_bar()`. Play around with the value and see what value you prefer.


```r
ggplot(summarydata, aes(x = sex, fill = sex)) +
  geom_bar(show.legend = FALSE, alpha = .8) +
  scale_x_discrete(name = "Participant Sex", 
                   labels = c("Female", "Male")) +
  scale_y_continuous(name = "Number of participants") +
  theme_minimal() +
  scale_fill_viridis_d(option = "E")
```

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{07-data-viz_files/figure-latex/unnamed-chunk-9-1} 

}

\caption{Barplot with adjusted alpha}(\#fig:unnamed-chunk-9)
\end{figure}


\begin{warning}
In R terms, \texttt{ggplot2} is a fairly old package. As a result, the
use of pipes wasn't included when it was originally written. As you can
see in the code above, the layers of the code are separated by
\texttt{+} rather than \texttt{\%\textgreater{}\%}. In this case,
\texttt{+} is doing essentially the same job as a pipe - be careful not
to confuse them.
\end{warning}

## Activity 5: Violin-boxplot

As our final activity we will also explain the code used to create the violin-boxplot from Loading Data, hopefully now you will be able to see how similar it is in structure to the bar chart code. In fact, there are only three differences:

1. We have added a `y` argument to the first layer because we wanted to represent two variables, not just a count.
2. `geom_violin()` has an additional argument `trim`. Try setting this to `TRUE` to see what happens. 
3. `geom_boxpot()` has an additional argument `width`. Try adjusting the value of this and see what happens. 


```r
ggplot(summarydata, aes(x = income, y = ahiTotal, fill = income)) +
  geom_violin(trim = FALSE, show.legend = FALSE, alpha = .4) +
  geom_boxplot(width = .2, show.legend = FALSE, alpha = .7)+
  scale_x_discrete(name = "Income",
                   labels = c("Below Average", "Average", "Above Average")) +
  scale_y_continuous(name = "Authentic Happiness Inventory Score")+
  theme_minimal() +
  scale_fill_viridis_d()
```

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{07-data-viz_files/figure-latex/unnamed-chunk-11-1} 

}

\caption{Violin-boxplot}(\#fig:unnamed-chunk-11)
\end{figure}

## Activity 6: Layers part 2

The key thing to note about `ggplot` is the use of layers. Whilst we've built this up step-by-step, they are independent and you could remove any of them except for the first layer. Additionally, although they are independent, the order you put them in does matter. Try running the two code examples below and see what happens.


```r
ggplot(summarydata, aes(x = income, y = ahiTotal)) +
  geom_violin() +
  geom_boxplot()

ggplot(summarydata, aes(x = income, y = ahiTotal)) +
  geom_boxplot() +
  geom_violin()
```

#### Finished!

Well done! `ggplot` can be a bit difficult to get your head around at first, particularly if you've been used to making graphs a different way. But once it clicks, you'll be able to make informative and professional visualisations with ease, which, amongst other things, will make your reports look FANCY.

<!--chapter:end:07-data-viz.Rmd-->

# Scatterplots

In this chapter we will work with our data to generate a plot of two variables from the Woodworth et al. dataset. Before we get to generate our plot, we still need to work through the steps to get the data in the shape we need it to be in for our particular question. In particular we need to generate the object `summarydata` that just has the variable we need.You have done these steps before so go back to the relevant Lab and use that to guide you through. 

## Activity 1: Set-up

* Open R Studio and ensure the environment is clear.  
* Open the `stub-scatterplot.Rmd` file and ensure that the working directory is set to your Data Skills folder and that the two .csv data files (`participant-info.csv` and `ahi-cesd.csv`) are in your working directory (you should see them in the file pane).  
* Look through your previous work to find the code that loads the `tidyverse`, reads in the data files and creates an object called `all_dat` that joins the two objects `dat` and `pinfo`.  



## Activity 2: Select

Select the columns `ahiTotal`, `cesdTotal`, `sex`, `age`, `educ` from the `all_dat` and save them in a new object named variable `summarydata`. 




## Activity 3: Simple scatterplots

First, we want to look at whether there seems to be a relationship between happiness and depression scores across all participants. 

In order to visualise two continuous variables, we can use a **scatterplot**. Using the `ggplot` code you learned about in Intro to Data Viz, try and recreate the below plot. 

A few hints:

* Use the `summarydata` data.
* Put `ahiTotal` on the x-axis and `cesdTotal` on the y-axis.
* Rather than using `geom_bar()`, `geom_violin()`, or `geom_boxplot()`, for a scatterplot you need to use `geom_point()`. 
* Rather than using `scale_fill_viridis_d()` to change the colour, add the argument `colour = "red"` to `geom_point` (except replace "red" with whatever colour you'd prefer).
* Remember to edit the axis names.

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{08-scatterplots_files/figure-latex/createplot-1} 

}

\caption{Scatterplot of happiness and depression scores}(\#fig:createplot)
\end{figure}

<br>

How would you describe the relationship between the two variables? <select class='webex-select'><option value='blank'></option><option value=''>As happiness scores increase, depression scores increase</option><option value='answer'>As happiness score increase, depression scores decrease</option><option value=''>As happiness scores decrease, depression scores decrease</option></select>

## Activity 4: Adding a line of best fit

Scatterplots are very useful but it can often help to add a line of best fit to help interpretation. Add the below layer to the scatterplot code from Activity 4:

* This code uses the function `geom_smooth()` to draw the line. There are several different methods but we want a straight, or linear, line so we specify `method = "lm"`.
* This line is really a regression line, which you'll learn more about in level 2. For now, the steeper the slope of the line, the stronger the relationship between the two variables.
* By default the regression line will be extended, beyond the original y-axis limits, if you want to change this so that your plots looks like the below, add `limits = c(0,60)` to `scale_y_continuous()`


```r
geom_smooth(method = "lm")
```

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{08-scatterplots_files/figure-latex/createplot2-1} 

}

\caption{Scatterplot of happiness and depression scores}(\#fig:createplot2)
\end{figure}

## Activity 5: Setting the factors

It seems fairly obvious that there might be a negative relationship between happiness and depression, so instead we want to look at whether this relationship changes depending on different demographic variables.

Just like in the last chapter, we need to ensure that R knows what type of data each variable is. At the moment, `sex`, `educ`, and `income` are all registered as numeric variables, but we know that they're really categories.


```r
str(summarydata)
```

```
## tibble [992 x 6] (S3: tbl_df/tbl/data.frame)
##  $ ahiTotal : num [1:992] 32 34 34 35 36 37 38 38 38 38 ...
##  $ cesdTotal: num [1:992] 50 49 47 41 36 35 50 55 47 39 ...
##  $ sex      : num [1:992] 1 1 1 1 1 1 2 1 2 2 ...
##  $ age      : num [1:992] 46 37 37 19 40 49 42 57 41 41 ...
##  $ educ     : num [1:992] 4 3 3 2 5 4 4 4 4 4 ...
##  $ income   : num [1:992] 3 2 2 1 2 1 1 2 1 1 ...
```



* Using the same method you used in the last chapter, overwrite `sex`, `educ` and `income` in `summarydata` as factors.

## Activity 6: Grouped scatterplots

We can now use our factors to display the data in the scatterplots for each group.

* Rather than adding `colour` to `geom_point()` which sets the colour for all the data points, instead we add `colour = sex` to the aesthetic mapping on the first line. This tells `ggplot()` to produce different colours for each level (or group) in the variable `sex`.
* `scale_color_viridis_d()` works exactly like the other colour blind friendly scale functions you have used, so we can use `name` and `labels` to adjust the legend.


```r
ggplot(summarydata, aes(x = ahiTotal , y = cesdTotal, colour = sex)) + 
  geom_point() +
  scale_x_continuous(name = "Happiness Score") +
  scale_y_continuous(name = "Depression Score",
                     limits = c(0,60)) +
  theme_minimal() +
  geom_smooth(method = "lm", formula = y~x) +
  scale_color_viridis_d(name = "Participant sex", 
                       labels = c("Male", "Female"),
                       option = "E")
```



\begin{center}\includegraphics[width=1\linewidth]{08-scatterplots_files/figure-latex/unnamed-chunk-4-1} \end{center}

It looks like the relationship between happiness and depression is about the same for male and female participants.

* Create two more scatterplots that show the relationship between happiness and depression grouped by a) `income` and b) `educ`. Make sure you update the legend labels (you might need to check the code book).

## Activity 7: Group by a new variable

So, let's be honest, there's not much going on with any of the demographic variables - the relationship between depression and anxiety is pretty much the same for all of the groups. A reasonable hypothesis might be that rather than being connected to any demographic variables, the relationship between happiness and depression changes depending upon your general happiness level.

* Using `mutate` create a new variable named `happiness` in `summarydata` that evaluates whether a participant's happiness score is equal to or higher than the median `ahiTotal` score.
* This is not an easy task as it's not something we've explicitly shown you how to do but it's the last activity for this semester so before you go to the solution, do a bit of trial and error, then look at the hints to see if you can get near the answer.
* If you've done it right, `summarydata` should contain a column named `happiness` with the value `TRUE` if `ahiTotal` is above the overall median and `FALSE` if it is below.


<div class='webex-solution'><button>Hint 1</button>



```r
mutate(data, new_variable = equal_or_more_than_median)
```


</div>



<div class='webex-solution'><button>Hint 2</button>



```r
mutate(data, new_variable = variable >= median(variable))
```


</div>




Now, reproduce the below plot using this new variable:


\begin{center}\includegraphics[width=1\linewidth]{08-scatterplots_files/figure-latex/unnamed-chunk-8-1} \end{center}

What might you conclude from this plot? <select class='webex-select'><option value='blank'></option><option value=''>The relationship between happiness and depression scores is stronger for people who have above average happiness scores</option><option value='answer'>The relationsip between happiness and depression scores is stronger for people who have lower than average happiness scores</option><option value=''>There is no difference in the relationship between depression and happiness scores between the groups</option></select>


<div class='webex-solution'><button>Explain this answer</button>


The line for the "unhappy" group is much steeper than the line for the "happy" group. That is, is you're generally unhappy, then you report a much stronger link between your happiness and depression levels than if you're generally happy. 

If you actually wanted to look at the difference in the relationships statistically, you could compute the correlation coefficients like below, but don't worry about that until Level 2.


```r
dat_above <- filter(summarydata, happiness == TRUE)
dat_below <- filter(summarydata, happiness == FALSE)

cor.test(dat_above$ahiTotal, dat_above$cesdTotal)
cor.test(dat_below$ahiTotal, dat_below$cesdTotal)
```

```
## 
## 	Pearson's product-moment correlation
## 
## data:  dat_above$ahiTotal and dat_above$cesdTotal
## t = -7.6564, df = 491, p-value = 1.024e-13
## alternative hypothesis: true correlation is not equal to 0
## 95 percent confidence interval:
##  -0.4032637 -0.2453473
## sample estimates:
##        cor 
## -0.3265828 
## 
## 
## 	Pearson's product-moment correlation
## 
## data:  dat_below$ahiTotal and dat_below$cesdTotal
## t = -22.474, df = 497, p-value < 2.2e-16
## alternative hypothesis: true correlation is not equal to 0
## 95 percent confidence interval:
##  -0.7509362 -0.6635268
## sample estimates:
##        cor 
## -0.7099551
```


</div>


### Finished!

Great job! As you may have noticed, this chapter tried to push you and test what you've learned - we hope you can see just how far you've come in the space of just a couple of months, it's genuinely amazing what you have achieved and you should feel proud. In Psych 1B we will continue using these wrangling skills on new data and also data that you collect yourself.

## Activity solutions - Scatterplots

### Activity 1


<div class='webex-solution'><button>Solution</button>

```r
library(tidyverse)
dat <- read_csv ('ahi-cesd.csv')
pinfo <- read_csv('participant-info.csv')
all_dat <- inner_join(dat, pinfo, by=c("id", "intervention")
```


</div>


### Activity 2



<div class='webex-solution'><button>Solution</button>

```r
summarydata <- select(all_dat, ahiTotal, cesdTotal, sex, age, educ, income)
```


</div>


### Activity 3


<div class='webex-solution'><button>Solution</button>

```r
ggplot(all_dat, aes(x = ahiTotal , y = cesdTotal)) + 
  geom_point(colour = "red") +
  scale_x_continuous(name = "Happiness Score") +
  scale_y_continuous(name = "Depression Score") +
  theme_minimal()
```



\begin{center}\includegraphics[width=1\linewidth]{08-scatterplots_files/figure-latex/T3-1} \end{center}


</div>


### Activity 4



<div class='webex-solution'><button>Solution</button>

```r
ggplot(all_dat, aes(x = ahiTotal , y = cesdTotal)) + 
  geom_point(colour = "red") +
  scale_x_continuous(name = "Happiness Score") +
  scale_y_continuous(name = "Depression Score",
                     limits = c(0,60)) +
  theme_minimal() +
  geom_smooth(method = "lm", formula = y~x)
```



\begin{center}\includegraphics[width=1\linewidth]{08-scatterplots_files/figure-latex/T4s-1} \end{center}


</div>

### Activity 5



<div class='webex-solution'><button>Solution</button>

```r
summarydata <- summarydata %>%
  mutate(sex = as.factor(sex),
         educ = as.factor(educ),
         income = as.factor(income))
```


</div>


### Activity 6


<div class='webex-solution'><button>Solution</button>



```r
ggplot(summarydata, aes(x = ahiTotal , y = cesdTotal, 
                        colour = educ)) + 
  geom_point() +
  scale_x_continuous(name = "Happiness Score") +
  scale_y_continuous(name = "Depression Score",
                     limits = c(0,60)) +
  theme_minimal() +
  geom_smooth(method = "lm", formula = y~x) +
  scale_color_viridis_d(name = "Education level", 
                       labels = c("Less than Year 12",
                                  "Year 12",
                                  "Vocational training",
                                  "Bachelor’s degree",
                                  "Postgraduate degree"),
                       option = "E")
```



\begin{center}\includegraphics[width=1\linewidth]{08-scatterplots_files/figure-latex/unnamed-chunk-10-1} \end{center}


```r
ggplot(summarydata, aes(x = ahiTotal , y = cesdTotal, 
                        colour = income)) + 
  geom_point() +
  scale_x_continuous(name = "Happiness Score") +
  scale_y_continuous(name = "Depression Score",
                     limits = c(0,60)) +
  theme_minimal() +
  geom_smooth(method = "lm", formula = y~x) +
  scale_color_viridis_d(name = "Income", 
                       labels = c("Below average",
                                  "Average",
                                  "Above average"))
```



\begin{center}\includegraphics[width=1\linewidth]{08-scatterplots_files/figure-latex/unnamed-chunk-11-1} \end{center}


</div>


### Activity 7


<div class='webex-solution'><button>Solution</button>

```r
summarydata <- mutate(summarydata, severity = cesdTotal >= 18)
```


</div>



<!--chapter:end:08-scatterplots.Rmd-->


# AQ data and recap

Welcome back to Psych 1B! This semester we're going to build on the data skills you developed in the first semester by adding in a couple of new data wrangling functions, running probability simulations in preparation for statistics in level 2, and analysing your own data for the group project.

\begin{info}
If you haven't yet installed R on your own machine, we strongly
encourage you to do so as it means that a) you're not reliant on the
server b) you don't need to be connected to the internet to use R and c)
it makes it much easier to check your homework files before you submit
them. There is more info in the
\href{https://psyteachr.github.io/ug1-practical/installing-r-on-your-computer-1.html}{Appendix}
and you can also attend a GTA support session if you need help.
\end{info}

It would be nice to always get data formatted in the way that you want it, but one of the challenges as a scientist is dealing with Other People’s Data. People often structure data in ways that is convenient for data entry, but not very convenient for data analysis, and so, much effort must be expended ’wrangling’ data into shape before you can do more interesting things with it. Additionally, performing analyses often requires pulling together data obtained from different sources: you have done this in semester 1 by combining the participant information with the depression and happiness data. In this semester, we are going to give you some tips on how to structure data, and introduce strategies for transforming and combining data from different sources.

## Autism-quotient data

For Psych 1B we're going to use a different dataset for our exercises based upon data that was collected using SurveyMonkey but that has has simulated variables added for the purposes of these exercises (gender was missing, so we have added this in). For this research project, participants completed the short 10-item version of the Autism-Spectrum Quotient (AQ) (Baron-Cohen, Wheelwright, Skinner, Martin, & Clubley, 2001), which is designed to measure autistic traits in adults. The items for the questionnaire are shown below.

Table 1: The ten items on the AQ-10.


\begin{tabular}{l|l}
\hline
Q\_No & Question\\
\hline
Q 1 & I often notice small sounds when others do not.\\
\hline
Q 2 & I usually concentrate more on the whole picture, rather than small details.\\
\hline
Q 3 & I find it easy to do more than one thing at once.\\
\hline
Q 4 & If there is an interruption, I can switch back to what I was doing very quickly.\\
\hline
Q 5 & I find it easy to read between the lines when someone is talking to me.\\
\hline
Q 6 & I know how to tell if someone listening to me is getting bored.\\
\hline
Q 7 & When I’m reading a story, I find it difficult to work out the characters’ intentions.\\
\hline
Q 8 & I like to collect information about categories of things.\\
\hline
Q 9 & I find it easy to work out what someone is thinking or feeling just by looking at their face.\\
\hline
Q 10 & I find it difficult to work out people’s intentions.\\
\hline
\end{tabular}

Responses to each item were measured on a four-point scale: Definitely Disagree, Slightly Disagree, Slightly Agree, Definitely Agree. One of the issues with conducting research using surveys is that if we don't design them carefully, our data may be affected by response bias. One type of response bias is **acquiescence bias**, which is the finding that people have a tendancy to agree with all statements. To try and minimise the impact of this, many questionnaires will **reverse-code** some of the questions so that a positive response means agreeing with one question but disagreeing with another.

* Read through the questions. Type the number of one of the items where you think **agreeing** with the item would mean the participant displayed autistic traits<input class='webex-solveme nospaces' size='2' data-answer='["1","7","8","10"]'/> 
* Now type the number of one of the items where you think **disagreeing** with the item would mean the participant displayed autistic traits <input class='webex-solveme nospaces' size='1' data-answer='["2","3","4","5","6","9"]'/> 

For those items where agreeing with the item means a higher autistic quotient (AQ) score, participants recieve a score of 1 if they answer "Slightly agree" or "Agree". This is called **forward scoring**. For those items where disagreeing with the item means a higher AQ score, participants recieve a score of 1 if they answer "Slightly disagree" or "Disagree". This is know as **reverse coding**.

The AQ score for each participant is the total score (i.e., the sum) of all 10 questions. The higher the AQ score, the more ’autistic traits’ they are assumed to exhibit and it is this score we are interested in. 


## Activity 1: Download the data

* Download the <a href="files/Psych 1B.zip" download>`Psych 1B`</a> zip file.
* If you're working on your computer, extract the files, and make sure it is saved somewhere sensible. If you're one of those people who has 20 versions of the same file, stop being that person and tidy up your files.
* If you're working on the server, upload the zip file to the server. It will automatically unzip it for you. As above, tidy up your server files if necessary.

## Activity 2: Open a new Markdown document

In Psych 1A, we provided the Markdown documents for you in the form of stub files. From this point on, you're going to create and save your own.

* Open R Studio and set the working directory to your Psych 1B folder. If this has worked, you should see the csv files you just downloaded in the file pane in the bottom right of R Studio.  
* To open a new R Markdown document click the 'new item' icon and then click 'R Markdown'. You will be prompted to give it a title, call it "AQ data and recap". Also, change the author name to your GUID as this will be good practice for the homework. Keep the output format as HTML.
* Once you've opened a new document be sure to save it by clicking `File` -> `Save as`. Name this file "AQ data and recap". If you've set the working directory correctly, you should now see this file appear in your file viewer pane.  

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{images/markdown_new} 

}

\caption{Opening a new R Markdown document}(\#fig:img-new-markdownb)
\end{figure}

## Activity 3: Create a new code chunk

Let's recap how to use Markdown. When you first open a new R Markdown document you will see a bunch of default welcome text. Do the following steps:  

* Delete **everything** below line 7  
* On line 8 type "Activity 3"  
* Click `Insert` -> `R` 

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{images/markdown-code_chunks} 

}

\caption{New R chunk}(\#fig:img-new-chunkb)
\end{figure}

You should create a new code chunk **for each activity** or each analysis step (like there was in the stub files from 1A) and make sure there is a description of what the code is doing. This will make it easier to read your Markdown and find where any errors in the code are. **Do not put all of your code in one big chunk.**

## Activity 4: Load in the data

* Type and run the code that loads the `tidyverse` package.
* Use `read_csv()` to load in the data. you should create three objects `responses`, `scoring` and `qformats` that contain the respective data. If you need help remembering how to load in data files, check Loading Data. 

\begin{info}
The solutions are at the bottom if you need them. However, as you'll
discover in your memory and learning lectures, you'll learn more if you
try and retrieve the code from memory. There were a couple of comments
in the 1A EvaSys that said some of you felt like you were just copying
and pasting - this can only be true if \textbf{you choose} to copy and
paste.
\end{info}

## Activity 5: Look at the data

* View each of the three datasets by clicking on their name in the environment.
* Check each object by using `summary()`, e.g., `summary(qformats)`.

* **responses** contains the actual data from the survey. There is a participant Id column and then the rest of the columns contain the responses associated with that participant for each of the 10 questions (Q1, Q2, Q3, …, Q10).  
* **scoring** contains the scoring information that we described above, that is, whether a question should be given a score of 1 or 0 for forward and reverse coded items for each possible response.  
* **qformats** contains a list of whether each question is forward or reverse coded.  

## Thinking through the problem

In order to get a total AQ score for each participant, we need to combine the information from all three files, that is, we need to know the participants response and then how to score it. We technically _could_ score the data by hand. However, there are 66 participants in this dataset with each participant providing 10 responses. This means we would have to manually tidy up 660 responses. 

Not only would this be a horribly mind-numbing task, it is also one in which you would be prone to make errors. Even if you were 99% accurate, you would still get about 7 of the scores wrong. Worst of all, this approach does not scale beyond small datasets. When you analyse the data from your group project, there will likely be thousands of participants and you don't have time to do these by hand!

******

* Pause here and think about how you might calculate AQ scores for each participant. What are the necessary steps? 


******

Let’s imagine we are doing the task by hand so that we understand the logic. Once that logic is clear, we’ll go through it again and show you how to write the script to make it happen.

Let’s take stock of what we know. First, we know that there are two question formats, and that questions Q1, Q7, Q8, and Q10 are scored according to format F and questions Q2, Q3, Q4, Q5, Q6, and Q9 are scored according to format R. This is the information that is currently stored in `qformats`:


\begin{tabular}{l|l}
\hline
Question & QFormat\\
\hline
Q 1 & F\\
\hline
Q 2 & R\\
\hline
Q 3 & R\\
\hline
Q 4 & R\\
\hline
Q 5 & R\\
\hline
Q 6 & R\\
\hline
Q 7 & F\\
\hline
Q 8 & F\\
\hline
Q 9 & R\\
\hline
Q 10 & F\\
\hline
\end{tabular}

We also know that for format **F**, we award a point for **agree**, zero for **disagree**. For format **R**, a point for **disagree**, zero for **agree**. This is the information that is currently stored in `scoring`:


\begin{tabular}{l|l|r}
\hline
QFormat & Response & Score\\
\hline
F & Definitely Agree & 1\\
\hline
F & Slightly Agree & 1\\
\hline
F & Slightly Disagree & 0\\
\hline
F & Definitely Disagree & 0\\
\hline
R & Definitely Agree & 0\\
\hline
R & Slightly Agree & 0\\
\hline
R & Slightly Disagree & 1\\
\hline
R & Definitely Disagree & 1\\
\hline
\end{tabular}

Finally, we would need to look at the responses from each participant and then give them the correct score for the format of the question. Let’s walk through the example with the first participant. For this participant (Id = 16), we have the following responses:
  

\begin{tabular}{l|l}
\hline
Question & Participant 16 Response\\
\hline
Q 1 & Slightly Disagree\\
\hline
Q 2 & Definitely Agree\\
\hline
Q 3 & Slightly Disagree\\
\hline
Q 4 & Definitely Disagree\\
\hline
Q 5 & Slightly Agree\\
\hline
Q 6 & Slightly Agree\\
\hline
Q 7 & Slightly Agree\\
\hline
Q 8 & Definitely Disagree\\
\hline
Q 9 & Slightly Agree\\
\hline
Q 10 & Slightly Agree\\
\hline
\end{tabular}

Note that we have re-formatted the responses so that each response is in a separate row, rather than having all of the responses in a single row, as they are in `responses`. We have reshaped the data from its original **wide format** to **long format**. This format is called long because instead of having just one row for each participant, we now have one row for each data point and so 10 rows for each participant.

While this format makes it less easy to read the whole dataset in with a single glance, it actually ends up being much easier to deal with, because ’Question’ is a now a single variable whose levels are Q1, Q2, …, Q10, and ’Response’ is also now a single variable. Most functions that you will be working with in R will expect your data to be in long rather than wide format.

Let’s now look up the format for each question:


\begin{tabular}{l|l|l}
\hline
Question & Participant 16 Response & QFormat\\
\hline
Q 1 & Slightly Disagree & F\\
\hline
Q 2 & Definitely Agree & R\\
\hline
Q 3 & Slightly Disagree & R\\
\hline
Q 4 & Definitely Disagree & R\\
\hline
Q 5 & Slightly Agree & R\\
\hline
Q 6 & Slightly Agree & R\\
\hline
Q 7 & Slightly Agree & F\\
\hline
Q 8 & Definitely Disagree & F\\
\hline
Q 9 & Slightly Agree & R\\
\hline
Q 10 & Slightly Agree & F\\
\hline
\end{tabular}

And now that we have the format and the response, we can look up the scores:


\begin{tabular}{l|l|l|r}
\hline
Question & Participant 16 Response & QFormat & Score\\
\hline
Q 1 & Slightly Disagree & F & 0\\
\hline
Q 2 & Definitely Agree & R & 0\\
\hline
Q 3 & Slightly Disagree & R & 1\\
\hline
Q 4 & Definitely Disagree & R & 1\\
\hline
Q 5 & Slightly Agree & R & 0\\
\hline
Q 6 & Slightly Agree & R & 0\\
\hline
Q 7 & Slightly Agree & F & 1\\
\hline
Q 8 & Definitely Disagree & F & 0\\
\hline
Q 9 & Slightly Agree & R & 0\\
\hline
Q 10 & Slightly Agree & F & 1\\
\hline
\end{tabular}

Then we just add up the scores, which yields an AQ score of 4 for participant 16. We would then repeat this logic for the remaining 65 participants. Anyone fancy doing this for a big data set?!

Due to the large margin for error in carrying out this task by hand, it's important to learn how to make the computer do the dirty work. The computer won't make mistakes and will free up your mind to focus on the bigger issues in your research. 

## Activity 5: Recap

Finally, let's refresh your memory of some of the important tidyverse functions before we delve into anything new.

* What function would you use to keep just the columns Q1 and Q2 in `responses`? <select class='webex-select'><option value='blank'></option><option value=''>filter</option><option value='answer'>select</option><option value=''>object</option><option value=''>Q1:Q2</option></select>
* What function would you use to keep just the data from participant 16 in `reponses`? <select class='webex-select'><option value='blank'></option><option value='answer'>filter</option><option value=''>select</option><option value=''>summarise</option><option value=''>observation</option></select>
* What function would you use to add up the total score for participant 16? <select class='webex-select'><option value='blank'></option><option value=''>filter</option><option value=''>inner_join</option><option value='answer'>summarise</option><option value=''>score</option></select>
* What function would you use to join together `qformats` and `scoring`? <select class='webex-select'><option value='blank'></option><option value='answer'>inner_join</option><option value=''>join</option><option value=''>join_inner</option><option value=''>object_join</option></select>

## Activity solutions - AQ data and recap

### Activity 4


<div class='webex-solution'><button>Solution</button>


```r
library(tidyverse)
scoring <- read_csv ("scoring.csv")
responses <- read_csv("responses.csv")
qformats <- read_csv("qformats.csv")
```

</div>



<!--chapter:end:09-aq-data.Rmd-->

# Reshaping data

Let’s continue what we started in AQ Data and Recap by hand but now using R to calculate a score for each participant.



## Activity 1: Load in the data

* Open a new R markdown document, name it "Reshaping Data" and save it in your Data Skills folder.
* Set the working directory to your Data Skills folder.
* Type and run the code that loads the `tidyverse` package.
* Use `read_csv()` to load in the data. you should create three objects `responses`, `scoring` and `qformats` that contain the respective data.

## Activity 2: `pivot_longer()`

The first step is to transform the data from wide format to long format. To do this, we will use the function `pivot_longer()`. `pivot_longer()` takes multiple columns and collapses them so that each unique variable has it’s own column and has four main arguments:

* `data` is the name of the object you want to transform
* `names_to` is the name of the new column that you will create that will contain the names of the original wide format columns
* `values_to` is the name of the column that will contain the existing values.
* `cols` are the original columns you want to collapse.

These functions can seem a bit abstract and it is better to show than tell. Run the below code in a new code chunk and then compare how `rlong` looks compared to `responses` and see if you can figure out what effect each argument had.


```r
rlong <- pivot_longer(data = responses, 
                      names_to = "Question",  
                      values_to = "Response",
                      cols = Q1:Q10)
```

You have now created a tibble with 660 observations and 3 variables; 10 observations per 66 participants and 3 variables. Let's recreate the example from the AQ Data and Recap and only use **one participant**. We can do that by using `filter()` (which you used last semester) to create a new object called `rlong_16.` 

## Activity 3: `filter()`

******

**Pause here and test your knowledge**

* What does `filter()` do? 

<select class='webex-select'><option value='blank'></option><option value=''>Retains or removes variables</option><option value='answer'>Retains or removes observations</option></select>

******

* Create a new object called `rlong_16` that uses `filter()` to keep only the data from participant Id 16.


\begin{danger}
Every year, the biggest problem with these exercises is typos caused by
not paying attention to the exact spelling and capitalisation. Remember,
\texttt{Question} is not the same as \texttt{question},
\texttt{Response} is not the same as \texttt{response}, and \texttt{Id}
is not the same as \texttt{ID.}
\end{danger}

## Activity 4: `inner_join()`

The next step is to match each question with its format (F or R) that is stored in **qformats**. That is, we need to join together the two objects using `inner_join()` like we did in Psych 1A. 

* Create a new object called `rlong_16_join` that uses `inner_join()` to join together `rlong_16` and `qformats`by their common column.
* If you get the error `Error: by can't contain join column XXXX which is missing from LHS` it means that you have made a typo. Check the exact spelling and capitalisation of the variable names.

****************************

`inner_join()` matches up rows in the two tables where both tables have the same value for the variable named in the third argument, “Question”. It then combines the columns from the two tables, copying rows where necessary. 

To state it more simply, what it does is the following: For each row in `rlong`, it checks the value of the column `Question`, and looks for rows with the same value in `qformats`, and then essentially combines all of the other columns in the two tables for these matching rows. If there are values that don't match, the rows get dropped. The `inner_join()` function is one of the most useful and time-saving operations in data wrangling so keep practising as it will keep reappearing time after time.  

## Activity 5: Another `inner_join()` 

Now that we have matched up each question with its corresponding format, we can now “look up” the corresponding scores in the scoring table based on the format and the response. This means we have to use `inner_join()` once again to join `rlong_16_join` with `scoring`**

* Create a new object named `scores_16` that joins together `rlong_16_join` with `scoring`.
* Be careful to tell R **all** the columns the two objects have in common. Remember that when you need to specify multiple variables you will need to use the syntax `by = c("var1", "var2)`.
* The reason we have to do two separate `inner_joins()` is because they can only join two tables at once and we have three, so it requires two steps.


## Activity 6: Calculating the AQ score 

Now you need to calculate the total AQ score for participant 16.

* Create a new object called `AQ_16`. Use `summarise()` and `sum()`to add up the numbers in the column `Score` from `scores_16` and call the result of this calculation `AQ_score`.
* This is a difficult task to do from memory but try it anyway - if you get anywhere near the right solution you're doing extremely well!

## Activity 7: Calculating all scores

Next we're going to do the same thing but for **all** participants. The first two steps are the same but we just use the full data `rlong` rather than the filtered dataset.

* Run the below code in a new code chunk.


```r
rlong_join <- inner_join(rlong, qformats, "Question")
scores <- inner_join(rlong_join, scoring, c("QFormat", "Response"))
```

The final part of calculating the scores requires an extra step because now we don't just want to calculate one score, we want to calculate a score **for each participant** which means that we need to use `group_by()` to group by `Id`. We're not going to use it in this chapter but we also want our object to show us the participant's gender so we will also add `gender` to the grouping. If you want to refresh your memory about how `group_by()` works, revise Data Wrangling 1.


```r
scores_grouped <- group_by(scores, Id, gender)
AQ_all <- summarise(scores_grouped, total_score = sum(Score))
```

## Activity 8: Visualisation

Finally, use `ggplot()` and `geom_histogram()` to make a histogram of all the total AQ scores. Try and make it look pretty by changing the axis labels and the theme. You can check the solution code to see how the below example was made, but you can make yours look different.

* Hint 1: `ggplot(data, aes(x)) + geom_histogram()`
* Hint 2: Add `binwidth = 1` to `geom_histogram()` to change the width of the bars.

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{10-reshaping-data_files/figure-latex/unnamed-chunk-5-1} 

}

\caption{Histogram of total AQ scores}(\#fig:unnamed-chunk-5)
\end{figure}

## Activity solutions - Reshping data

### Activity 1



<div class='webex-solution'><button>Solution</button>

```r
library(tidyverse)
scoring <- read_csv ("scoring.csv")
responses <- read_csv("responses.csv")
qformats <- read_csv("qformats.csv")
```


</div>


### Activity 3


<div class='webex-solution'><button>Solution</button>

```r
rlong_16 <- filter(rlong, Id == 16)
```


</div>

### Activity 4


<div class='webex-solution'><button>Solution</button>

```r
rlong_16_join <- inner_join(rlong_16, qformats, "Question")
```


</div>


### Activity 5


<div class='webex-solution'><button>Solution</button>

```r
scores_16 <- inner_join(rlong_16_join, scoring, c("QFormat", "Response"))
```


</div>



### Activity 6


<div class='webex-solution'><button>Solution</button>

```r
AQ_16 <- summarise(scores_16, AQ_score = sum(Score))
```


</div>


### Activity 8



<div class='webex-solution'><button>Solution</button>

```r
ggplot(AQ_all, aes(x = total_score)) +
  geom_histogram(binwidth = 1, colour = "black", fill = "grey") +
  theme_minimal()+
  scale_x_continuous(name = "Total AQ Score", breaks = c(0,1,2,3,4,5,6,7,8,9,10)) +
  scale_y_continuous(name = "Count")
```


</div>


<!--chapter:end:10-reshaping-data.Rmd-->

# Pipes

## Activity 1: Recap

In Psych 1A we briefly introduced the concept of **pipes**, if you'd like to recap what you did, you can [find it here](https://emilynordmann.github.io/ug1-practical/data-wrangling-1.html#activity-9-pipes). 

Pipes look like this: `%>%`. Pipes allow you to send the output from one function straight into another function. Specifically, they send the result of the function before `%>%` to be the first argument of the function after `%>%`. As usual, it's easier to show, rather than tell so let's look at an example.

In the below example we want to perform some common wrangling steps:

1. Read in the data
2. Select the columns we want to retain
3. Join together our data files
4. Filter out participants so that we just use data from people who are aged 18 years or older

So far, when you've done these steps you've created a new object for each part of the process. The code below should look familiar - once you've loaded in the data to `demographic` and `raw_data`, you then create a new object named `sel_data` that stores the output of the `select()` operation, then you create a new object named `joined_data` that uses `sel_data` as its input and then finally you create another object called `final_data` that uses `joined_data` as its input.

Note that the below code is just an example, we don't have any data called `my_data` so don't try and run this code, it's just for reading.

<div class = 'left-float'>

```r
demographic <- read_csv("demographic.csv")
raw_data <- read_csv("my_data.csv")

sel_data <- select(raw_data, id, score)
joined_data <- inner_join(sel_data, demographic, by = "id")
final_data <- filter(joined_data, age >= 18)
```

</div>

This code will work, however, there's a more efficient way of doing all of these steps that needs far less typing which means fewer chances to make typos. Additionally, if you create lots of objects, it increases the chances that you might accidentally use the wrong one (e.g., `rlong` instead of `rlong2`).

By using pipes, we can reduce the amount of code we write and the number of objects we create. 

* Remember, pipes allow you to send the output from one function straight into another function where they are used as the first argument.
* Try and translate the below code into plain English. You can read the `%>%` as **then**.


<div class = 'right-float'>

```r
demographic <- read_csv("demographic.csv")
raw_data <- read_csv("my_data.csv")

final_data <- raw_data %>%
  select(id, score) %>%
  inner_join(demographic, by = "id")
  filter(age >= 18) 
```

</div>


<div class='webex-solution'><button>Solution</button>


Take the object `raw_data` **then** select the columns `id` and `score` **then** join it with the data in `demographic` by `id` **then** filter to only include ages of 18 or greater and save this in an object named `final_data`.


</div>


<br>
Importantly, you don't need to write the entire pipe at once, in fact, it's useful to check that each line works as you intended and then add on the next one to make it easier to spot where errors have come in to your code. 

For example you might start with:


```r
final_data <- raw_data %>%
  select(id, score)
```

Then check the output of `final_data` to make sure that it contains the columns you intended to select. Then you would add on another line of the pipe:


```r
final_data <- raw_data %>%
  select(id, score) %>%
  inner_join(demographic, by = "id")
```

And check the output again to make sure that the join had worked properly before adding on the final line.


```r
final_data <- raw_data %>%
  select(id, score) %>%
  inner_join(demographic, by = "id")
  filter(age >= 18) 
```


<br>
\begin{danger}
As great as pipes are, there are two main cases when it probably makes
sense to write your code without pipes, and save the results from each
step to separate objects:

\begin{enumerate}
\def\labelenumi{\arabic{enumi}.}
\item
  When the output from a step partway through your pipeline is somehow
  useful. For example, you might want to check that a step worked as
  expected, or the information might be useful again later on.
\item
  When you're completing assessments and we want you to save the output
  from a certain step to a specific variable name (we want to check that
  the step worked properly to be able to give you the mark!).
\end{enumerate}
\end{danger}

Which of the following is a pipe? <select class='webex-select'><option value='blank'></option><option value='answer'>%>%</option><option value=''><-</option><option value=''>%<%</option></select>

Where do pipes send the result of the function that precedes the pipe? <select class='webex-select'><option value='blank'></option><option value=''>To the third argument of the 18th function.</option><option value='answer'>To the first argument of the next function.</option><option value=''>To the last argument of the next function.</option></select>

## Activity 2: Set-up

We're going to load in the AQ data to practice some examples.

* Open a new R Markdown document, name it "Pipes" and save it in your Data Skills folder.
* Make sure the working directory is set to your Data Skills folder that has the three AQ .csv files.
* Delete the welcome text and insert a new code chunk.
* Copy, paste, and run the below code into the new code chunk.


```r
library(tidyverse)
scoring <- read_csv ("scoring.csv")
responses <- read_csv("responses.csv")
qformats <- read_csv("qformats.csv")
```

## Activity 3: Example pipe 1

Rewrite the below code to use pipes. The solutions are at the bottom but try and work through it on your own - it can be a bit confusing at first but there will be a moment where it suddenly makes sense and you will find it much easier to write code. Remember that if something is difficult it probably means you're learning more.

**Hint 1:** You're not creating new objects so you can delete the intermediate object names and save the output straight into the final object name `scores`.  
**Hint 2:** The point of using pipes is that they pipe the output into the first argument of the next function, in other words, you can delete the first argument of the new function.  
**Hint 3:** Build the pipe up line-by-line and check it at each stage. The output of the first line of the pipe should look like `rlong`, the output of the second line should look like `rlong_join` and so on.


```r
rlong <- pivot_longer(data = responses, 
                      names_to = "Question",  
                      values_to = "Response",
                      cols = Q1:Q10)

rlong_join <- inner_join(rlong, qformats, "Question")

scores <- inner_join(rlong_join, scoring, c("QFormat", "Response"))
```


## Activity 4: Example pipe 2

Rewrite the below code to use pipes. 


```r
data1 <- select(scores, -QFormat)
data2 <- filter(data1, Question == "Q1")
example_2 <- summarise(data2, total_score = sum(Score))
```

## Activity 5: Example pipe 3

You can also pipe into `ggplot()`. The below example calculates the total score for each question (not each participant) by grouping it, then using summarise on the grouped data, then making a graph of these scores so that we can see which question participants were most likely to give an answer indicating autistic traits. Rewrite the below code using pipes.

**Hint 1:** You do not need to save this output to an object.  
**Hint 2:** First, write the code that calculates the scores and then pipe into `ggplot()`  
**Hint 3:** The pipe works exactly the same with `ggplot()`, you can delete the first argument.   


```r
data_group <- group_by(scores, Question)
question_scores <- summarise(data_group, item_scores = sum(Score))

ggplot(question_scores, aes(x = Question, y = item_scores)) +
  geom_col() +
  theme_minimal()
```

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{11-pipes_files/figure-latex/unnamed-chunk-10-1} 

}

\caption{Total scores for each AQ question}(\#fig:unnamed-chunk-10)
\end{figure}

## Activity solutions - Pipes

### Activity 3


<div class='webex-solution'><button>Solution</button>

```r
scores <- pivot_longer(data = responses, 
                      names_to = "Question",  
                      values_to = "Response",
                      cols = Q1:Q10) %>%
  inner_join(qformats, "Question") %>%
  inner_join(scoring, c("QFormat", "Response"))

# this also does the same thing but the first line is slightly different

scores <- responses %>%
  pivot_longer(names_to = "Question",  
               values_to = "Response",
               cols = Q1:Q10) %>%
  inner_join(qformats, "Question") %>%
  inner_join(scoring, c("QFormat", "Response"))
```


</div>


### Activity 4


<div class='webex-solution'><button>Solution</button>

```r
example_2 <- select(scores, -QFormat) %>%
  filter(Question == "Q1") %>%
  summarise(total_score = sum(Score))
```


</div>

### Activity 5


<div class='webex-solution'><button>Solution</button>

```r
scores %>%
  group_by(Question) %>%
  summarise(item_scores = sum(Score)) %>%
  ggplot(aes(x = Question, y = item_scores)) +
  geom_col() +
  theme_minimal()
```


</div>


<!--chapter:end:11-pipes.Rmd-->



# Mega pipe

## Activity  1: Set-up 

* Open a new R markdown document, name it "Mega pipe" and save it in your Data Skills folder.
* Set the working directory to your Data Skills folder.
* Type and run the code that loads the `tidyverse` package.
* Use `read_csv()` to load in the data. you should create three objects `responses`, `scoring` and `qformats` that contain the respective data.

## Activity 2: Mega pipe

We're going to build on what you learned in Pipes and rewrite all of the code we did in Reshaping Data (which you can see below) using a pipe. As a reminder, the code:

* Transforms the data from wide-form to long-form
* Joins together the three objects by their common columns
* Calculates a total AQ score for each participant


```r
rlong <- pivot_longer(data = responses, 
                      names_to = "Question",  
                      values_to = "Response",
                      cols = Q1:Q10)

rlong_join <- inner_join(rlong, qformats, by = "Question")

scores <- inner_join(rlong_join, scoring, by = c("QFormat", "Response"))

scores_grouped <- group_by(scores, Id, gender)

AQ_all <- summarise(scores_grouped, total_score = sum(Score))
```

* Rewrite the above code using pipes `%>%`. Make sure you have completed Pipes before you attempt this.

## Activity 3: Pipe plot

Now we've got our total AQ scores, let's use the pipe to make a graph. 

* Take `AQ_all` **then** filter it leaving only female participants **then** use `ggplot()` to create a histogram of the total scores (you did this in Reshaping Data). If you've done it correctly, it should look like the below (you can change the colours if you like).

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{12-more-pipes_files/figure-latex/unnamed-chunk-2-1} 

}

\caption{Histogram of scores for female participants}(\#fig:unnamed-chunk-2)
\end{figure}

Remember this for your group project - rather than creating new objects for each graph you want to make you can just pipe the data you want to display straight into `ggplot()`.

## Activity 4: AQ score by gender

[More men and boys are currently diagnosed as autistic than women and girls](https://www.autism.org.uk/about/what-is/gender.aspx) and there is increasing evidence that there is an over-representation of [transgender and nonbinary people](https://www.ncbi.nlm.nih.gov/pubmed/31260907) in those with autism spectrum disorder (ASD) or who meet the AQ cut-off score for ASD, therefore, it seems sensible to visualise AQ scores by gender (note that this dataset is simulated and that whilst the pattern of results is based on what we would expect from the evidence, these are not real data).

* Using the data in `AQ_all`, create a violin-boxplot of the total AQ scores by gender.
* Hint: `gender` should be on the x-axis, `total_score` should be on the y-axis.
* You can use a pipe if you want, but it doesn't make much difference in this activity.

Look at the graph and answer the following questions:

* Which group has the lowest median total AQ score? <select class='webex-select'><option value='blank'></option><option value='answer'>female</option><option value=''>male</option><option value=''>nonbinary</option></select>
* Which group has an outlier? <select class='webex-select'><option value='blank'></option><option value=''>female</option><option value='answer'>male</option><option value=''>nonbinary</option></select>

* Which of the following do you think would be an accurate conclusion to draw from the plot? <div class='webex-radiogroup' id='radio_EVVIXIRPKO'><label><input type="radio" autocomplete="off" name="radio_EVVIXIRPKO" value="x"></input> <span>Women had higher AQ scores than men or nonbinary people</span></label><label><input type="radio" autocomplete="off" name="radio_EVVIXIRPKO" value="answer"></input> <span>Men and nonbinary people&apos;s scores did not differ much and both had higher AQ scores than women</span></label><label><input type="radio" autocomplete="off" name="radio_EVVIXIRPKO" value="x"></input> <span>Men had higher AQ scores than nonbinary people who had higher scores than women</span></label></div>

## Activity 5: Bad bar plots

In the research methods lectures for Psych 1A, we talked about the importance of data visualisation and how different graphs might lead you to make very different conclusions about your data. For this reason, we've taught you how to make violin-boxplots because these show the true distribution of the data, however, it's useful to know how to make bad bar plots so that you can see the difference they make to your own data (but never use them as your only method of visualisation!).

* Copy, paste and run the below code in a new code chunk
* Making a bar chart works a little differently to the other graphs you have made so far. Previously, `ggplot()` has just visualised the raw data, however, for a bar chart you actually want to visualise a **summary** of the data, e.g., the mean.
* You can read the `stat_summary` code as "draw a summary of the data, use a bar chart to do so and the function to display on the y-axis should be the mean. Then, draw another summary but this time use an errorbar and the function to apply to the data is standard error of the mean".


```r
AQ_all %>%
  ggplot(aes(x = gender, y = total_score)) +
  stat_summary(geom = "bar", fun = "mean") +
  stat_summary(geom = "errorbar", fun.data = "mean_se", width = .2) +
  theme_minimal()
```

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{12-more-pipes_files/figure-latex/unnamed-chunk-4-1} 

}

\caption{Bad bar chart of means}(\#fig:unnamed-chunk-4)
\end{figure}

Think back to your interpretation of the violin-boxplot, that men and nonbinary people's scores did not differ much and both had higher AQ scores than women. Would you have concluded the same thing if you had looked at the bar chart? 

In this dataset, the outlier in the male group results in the mean score being much higher than the nonbinary mean, it's only through looking at the full distribution with the violin-boxplot that you can accurately intepret the data.

## Activity 6: Density plots

The final type of visualiation we're going to show you are density plots as they are a useful way of visualising how the distributions of different groups compare to each other. You've actually already seen a density plot - it's the base of a violin plot, however, it can be useful to overlap them.

* Copy, paste, and run the below code in a new code chunk.
* A lot of this code should be familiar to you, most of it is editing the axis labels and the theme.
* Adding `fill = gender` tells `ggplot` to produce different coloured geoms for each level of `gender`. Try removing `fill = gender` and see what happens to the plot.
* `geom_density()` is our new geom and tells R to draw the density curve. The argument `alpha` controls the transparency of the colours, try adjusting this value.


```r
ggplot(AQ_all, aes(x = total_score, fill = gender)) +
  geom_density(alpha = .3) +
  theme_minimal() +
  scale_fill_viridis_d(option = "D") +
  scale_x_continuous(name = "Total AQ Score", breaks = c(1,2,3,4,5,6,7,8,9,10)) +
  scale_y_continuous(name = "Density")
```

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{12-more-pipes_files/figure-latex/unnamed-chunk-5-1} 

}

\caption{Grouped density plot}(\#fig:unnamed-chunk-5)
\end{figure}

The y-axis displays density, i.e., what proportion of the data points fall at each point on the x-axis.

* Approximately what percent of female participants had a total AQ of 2? <select class='webex-select'><option value='blank'></option><option value=''>.3%</option><option value=''>3%</option><option value='answer'>30%</option></select>


<div class='webex-solution'><button>Solution</button>


It's important to be able to translate between proportions and percentages, it will make your understanding of statistics and p-values much easier. To translate a proportion into a percentage, you multiply by 100 or move the decimal place two places to the right so a proportion of .5 = 50%, a proportion of .03 = 3% and so on. 

</div>


## Activity 7: Saving plots

Finally, it's useful to be able to save a copy of your plots as an image file so that you can use it in a presentation or word document and to do this we can use the function `ggsave()`.

There are two ways you can use `ggsave()`. If you don't tell `ggsave()` which plot you want to save, by default it will save a copy of **the last plot you created**. If you've been following this chapter in order, the last plot you created should have been the density plot from Activity 6. 

All that `ggsave()` requires is for you to tell it what file name it should save the plot to and the type of image file you want to create (the below example uses .png but you could also use e.g., .jpeg and other image types).

* Copy, paste and run the below code into a new code chunk.
* Check your Data Skills folder, you should now see the saved image file.


```r
ggsave("density.png")
```

The default size for an image is 7 x 7, you can change this manually if you think that the dimensions of the plot are not correct or if you need a particular size.

* Copy paste and run the below code to overwrite the image file with new dimensions.


```r
ggsave("density.png", width = 10, height = 8)
```

The second way of using `ggsave()` is to save your plot as an object and then tell it which object to write to a file. The below code saves the pipe plot from Activity 3 into an object named `AQ_histogram` and then saves it to an image file "AQ_histogram.png". 

Note that when you save a plot to an object, it won't display in R Studio. To get it to display you need to type the object name in the console (i.e., `AQ_histogram`). The benefit of doing it this way is that if you are making lots of plots, you can't accidentally save the wrong one because you are explicitly specifying which plot to save rather than just saving the last one.

* Copy, paste and run the below code and then check your Data Skills folder for the image file. Resize the plot if you think it needs it.


```r
AQ_histogram <- AQ_all %>%
  filter(gender == "female") %>%
  ggplot(aes(x = total_score)) +
  geom_histogram(binwidth = 1, colour = "black", fill = "grey") +
  theme_minimal()+
  scale_x_continuous(name = "Total AQ Score (female participants)", breaks = c(0,1,2,3,4,5,6,7,8,9,10)) +
  scale_y_continuous(name = "Count")

ggsave("AQ_histogram.png", plot = AQ_histogram)
```

## Activity solutions - Mega pipe


### Activity 1


<div class='webex-solution'><button>Solution</button>


```r
library(tidyverse)
scoring <- read_csv ("scoring.csv")
responses <- read_csv("responses.csv")
qformats <- read_csv("qformats.csv")
```

</div>


### Activity 2


<div class='webex-solution'><button>Solution</button>


```r
AQ_all <- pivot_longer(data = responses, 
                      names_to = "Question",  
                      values_to = "Response",
                      cols = Q1:Q10) %>%
  inner_join(qformats, by = "Question") %>%
  inner_join(scoring, by = c("QFormat", "Response")) %>%
  group_by(Id, gender) %>% 
  summarise(total_score = sum(Score))
```

</div>


### Activity 3


<div class='webex-solution'><button>Solution</button>


```r
AQ_all %>%
  filter(gender == "female") %>%
  ggplot(aes(x = total_score)) +
  geom_histogram(binwidth = 1, colour = "black", fill = "grey") +
  theme_minimal()+
  scale_x_continuous(name = "Total AQ Score (female participants)", breaks = c(0,1,2,3,4,5,6,7,8,9,10)) +
  scale_y_continuous(name = "Count")
```

</div>


### Activity 4


<div class='webex-solution'><button>Solution</button>


```r
ggplot(AQ_all, aes(gender, total_score)) +
  geom_violin(trim = FALSE) +
  geom_boxplot(width = .2) +
  theme_minimal()
```

</div>


<!--chapter:end:12-more-pipes.Rmd-->

# Intro to Probability

In the Psych 1A Research Methods lectures, we talked a lot about p-values and statistical significance. P-values are the probability that you would get the observed results if the null hypothesis was true (i.e., if there really was no effect of your experiment). In psychology, the standard cut-off for statistical significance is p < .05, that is, if the probability that we would observe our results under the null hypothesis is less than 5%, we conclude that our experiment has had an effect and there is a difference between our groups. In this chapter, we're going to go into a bit more detail about exactly what we mean by probability.

## Activity 1: Prep

* Read [Statistical thinking (Noba Project)](https://nobaproject.com/modules/statistical-thinking#content)
* Watch [Normal Distribution - Explained Simply](https://www.youtube.com/watch?v=tDLcBrLzBos) (10 mins) 
* Watch [Probability explained](https://www.youtube.com/watch?v=uzkc-qNVoOk&list=PLC58778F28211FA19) (8 mins)
* Watch [Binomial distribution](https://www.youtube.com/watch?v=WWv0RUxDfbs) (12 minutes)

## What is probability? 

Probability (*p*) is the extent to which an event is likely to occur and is represented by a number between 0 and 1. For example, the probability of flipping a coin and it landing on 'heads' would be estimated at *p = .5*, i.e., there is a 50% chance of getting a head when you flip a coin. Calculating the probability of any discrete event occurring can be formulated as:

$$p = \frac{number \  of  \ ways \ the \ event \ could \  arise}{number \ of \ possible \ outcomes}$$
For example, what is the probability of randomly drawing your name out of a hat of 12 names where one name is definitely yours?


```r
1/12
```

```
## [1] 0.08333333
```

The probability is .08, or to put it another way, there is an 8.3% chance that you would pull your name out of the hat.

## Types of data

How you tackle probability depends on the type of data/variables you are working with  (i.e. discrete or continuous). This is also referred to as `Level of Measurements`.  

**Discrete** data can only take integer values (whole numbers). For example, the number of  participants in an experiment would be discrete - we can't have half a participant! Discrete variables can also be further broken down into **nominal** and **ordinal** variables.

**Ordinal** data is a set of ordered categories; you know which is the top/best and which is the worst/lowest, but not the difference between categories. For example, you could ask participants to rate the attractiveness of different faces based on a 5-item Likert scale (very unattractive, unattractive, neutral, attractive, very attractive). You know that very attractive is better than attractive but we can't say for certain that the difference between neutral and attractive is the same size as the distance between very unattractive and unattractive.

**Nominal** data is also based on a set of categories but the ordering doesn't matter (e.g. left or right handed). Nominal is sometimes simply referred to as `categorical` data. 

**Continuous** data on the other hand can take any value. For example, we can measure age on a continuous scale (e.g. we can have an age of 26.55 years), other examples include reaction time or the distance you travel to university every day. Continuous data can be broken down into **interval** or **ratio** data. 

**Interval** data is data which comes in the form of a numerical value where the difference between points is standardised and meaningful. For example temperature, the difference in temperature between 10-20 degrees is the same as the difference in temperature between 20-30 degrees. 

**Ratio** data is very like interval but has a true zero point. With our interval temperature example above, we have been experiencing negative temperatures (-1,-2 degrees) in Glasgow but with ratio data you don't see negative values such as these i.e. you can't be -10 cm tall. 

## Activity 2: Types of data

What types of data are the below measurements?

* Time taken to run a marathon (in seconds): <select class='webex-select'><option value='blank'></option><option value=''>ordinal</option><option value='answer'>ratio</option><option value=''>categorical</option><option value=''>interval</option></select>
* Finishing position in marathon (e.g. 1st, 2nd, 3rd): <select class='webex-select'><option value='blank'></option><option value=''>categorical</option><option value=''>interval</option><option value=''>ratio</option><option value='answer'>ordinal</option></select>
* Which Sesame Street character a runner was dressed as: <select class='webex-select'><option value='blank'></option><option value='answer'>categorical</option><option value=''>ratio</option><option value=''>interval</option><option value=''>ordinal</option></select>
* Temperature of a runner dressed in a cookie monster outfit (in degrees Celsius): <select class='webex-select'><option value='blank'></option><option value=''>ratio</option><option value='answer'>interval</option><option value=''>ordinal</option><option value=''>categorical</option></select>

## Probability distributions

Probability distribution is a term from mathematics. Suppose there are many events with random outcomes (e.g., flipping a coin). A probability distribution is the theoretical counterpart to the observed frequency distribution. A frequency distribution simply shows how many times a certain event actually occurred. A probability distribution says how many times it should have occurred. 

Mathematicians have discovered a number of different probability distributions, that is, we know that different types of data will tend to naturally fall into a known distribution and we can use them to help us calculate probability.

## The uniform distribution

The uniform distribution is when each possible outcome has an equal chance of occurring. Let's take the example from above, pulling your name out of a hat of 12 names. Each name has an equal chance of being drawn (p = .08). If we visualised this distribution, it would look like this - each outcome has the same chance of occurring:

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{13-probability-1_files/figure-latex/unnamed-chunk-1-1} 

}

\caption{Uniform distribution}(\#fig:unnamed-chunk-1)
\end{figure}

## The binomial distribution

The binomial (bi = two, nominal = categories) distribution is a frequency distribution which calculates probabilities of success for situations where there are two possible outcomes e.g., flipping a coin. A binomial distribution models the probability of any number of successes being observed, given the probability of a success and the number of observations. Binomial distributions represent **discrete** data.

Describing the probability of single events, such as a single coin flip or rolling a six is easy, but more often than not we are interested in the probability of a collection of events, such as the number of heads out of 10 coin flips. To work this out, we can use the binomial distribution and functions in R.

Let’s say we flip a coin 10 times. Assuming the coin is fair (probability of heads = .5), how many heads should we expect to get? The below figure shows the results of a simulation for 10,000 coin flips (if you'd like to do this simulation yourself in R, you can see the code by clicking "Solution"). What this means is that we can use what we know about our data and the binomial distribution to work out the probability of different outcomes (e.g., what's the probability of getting at least 3 heads if you flip a coin 10 times?) and this is what we'll do in the next chapter

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{13-probability-1_files/figure-latex/unnamed-chunk-2-1} 

}

\caption{Probability of no. of heads from 10 coin tosses}(\#fig:unnamed-chunk-2)
\end{figure}


<div class='webex-solution'><button>Solution</button>



```r
heads10000 <- replicate(n = 10000, expr = sample(0:1, 10, TRUE) %>% sum())

data10000 <- tibble(heads = heads10000) %>%   # convert to a tibble
                group_by(heads) %>%     # group by number of possibilities 
                summarise(n = n(), # count occurances of each possibility,
                          p=n/10000) # & calculate probability (p) of each

ggplot(data10000, aes(x = heads,y = p)) + 
  geom_bar(stat = "identity") + 
  labs(x = "Number of Heads", y = "Probability of Heads in 10 flips (p)") +
  theme_bw() +
  scale_x_continuous(breaks = c(0,1,2,3,4,5,6,7,8,9,10))
```


</div>



## The normal distribution

The final probability distribution you need to know about is the normal distribution. The **normal distribution**, reflects the probability of any value occurring for a *continuous* variable. Examples of continuous variables include height or age, where a single person can score anywhere along a continuum. For example, a person could be 21.5 years old and 176cm tall.

As the normal distribution models the probability of a continuous variable, we plot the probability using a density plot. A normal distribution looks like this:

\begin{figure}

{\centering \includegraphics[width=1\linewidth,height=1\textheight]{./images/norm_dist_height} 

}

\caption{Normal Distribution of height. $\mu$ = the mean (average), $\sigma$ = standard deviation}(\#fig:unnamed-chunk-4)
\end{figure}

Normal distributions are symmetrical, meaning there is an equal probability of observations occurring above and below the mean. This means that, if the mean in figure 1 is 170, we could expect the number of people who have a height of 160 to equal the number of people who have a height of 180. This also means that the mean, median, and mode are all expected to be equal in a normal distribution.

In the same way that we could with the coin flips, we can then use what we know about our data and the normal distribution to estimate the probability of certain outcomes (e.g., what's the probability that someone would be taller than 190cm?) and we'll do this in the lab.

As with any probabilities, real-world data will come close to the normal distribution, but will (almost certainly) never match it exactly. As we collect more observations from normally-distributed data, our data will get increasingly closer to a normal distribution. As an example, here's a simulation of an experiment in which we collect heights from 5000 participants. As you can see, as we add more observations, our data starts to look more and more like the normal distribution in the previous figure.

\begin{figure}

{\centering \includegraphics[width=0.75\linewidth,height=0.75\textheight]{./images/normal_dist} 

}

\caption{A simulation of an experiment collecting height data from 2000 participants}(\#fig:unnamed-chunk-5)
\end{figure}

## Activity 3: Normal distribution

Complete the sentences so that they are correct.

* In a normal distribution, the mean, median, and mode <select class='webex-select'><option value='blank'></option><option value=''>are always different</option><option value=''>sum to zero</option><option value='answer'>are all equal</option></select>.
* In a normal distribution, the further away from the mean an observation is <select class='webex-select'><option value='blank'></option><option value=''>the higher its probability of occuring</option><option value='answer'>the lower its probability of occuring</option></select>.
* Whereas the binomial distribution is based on situations in which there are two possible outcomes, the normal distribution is based on situations in which the data <select class='webex-select'><option value='blank'></option><option value='answer'>is a continuous variable</option><option value=''>has three possible values</option><option value=''>is a categorical variable</option></select>.

## Activity 4: Distribution test

Which distribution is likely to be associated with the following?

* Scores on an IQ test <select class='webex-select'><option value='blank'></option><option value=''>Uniform distribution</option><option value=''>Binomial distribution</option><option value='answer'>Normal distribution</option></select>
* Whether a country has won or lost the Eurovision song contest <select class='webex-select'><option value='blank'></option><option value=''>Uniform distribution</option><option value='answer'>Binomial distribution</option><option value=''>Normal distribution</option></select>
* Picking a spade card out of a normal pack of playing cards<select class='webex-select'><option value='blank'></option><option value='answer'>Uniform distribution</option><option value=''>Binomial distribution</option><option value=''>Normal distribution</option></select>

In the next chapter we're going to continue looking at distributions and probability. Whilst you won't start conducting statistical tests until level 2, by the end of the next chapter you should be able to understand the core principles of probability and how we can use what we know about distributions to calculate whether a particular outcome is likely. 


<!--chapter:end:13-probability-1.Rmd-->

# Probability continued

First, we're going to calculate probabilities based on the binomial distribution. In this chapter, for the first time we don't need to load the tidyverse. All the functions we need are contained in Base R. If you want a refresher on the difference between Base R and packages, see [Programming Basics](https://psyteachr.github.io/ug1-practical/programming-basics.html#packages).

* Open a new R Markdown document, call it "Probability" and save it in your Data Skills folder.

We're going to use three Base R functions to work with the binomial distribution:

`dbinom()` - the density function: gives you the probability of x successes given the number of trials and the probability of success on a single trial (e.g., what's the probability of flipping 8/10 heads with a fair coin?).

`pbinom()` - the probability distribution function: gives you the cumulative probability of getting a number of successes below a certain cut-off point (e.g. probability of getting 0 to 5 heads out of 10 flips), given the size and the probability. This is known as the cumulative probability distribution function or the cumulative density function.

`qbinom()` - the quantile function: is the opposite of `pbinom()` in that it gives you the x axis value for a given probability p, plus given the size and prob, that is if the probability of flipping a head is .5, how many heads would you expect to get with 10 flips?

So let's try these functions out to answer two questions:

1. What is the probability of getting exactly 5 heads on 10 flips?
2. What is the probability of getting at most 2 heads on 10 flips?

## Activity 2: `dbinom()`

Let's start with question 1, what is the probability of getting exactly 5 heads on 10 flips? 

We want to predict the **probability** of getting 5 heads in 10 trials (coin flips) and the probability of success is 0.5 (it'll either be heads or tails so you have a 50/50 chance which we write as 0.5). We will use `dbinom()` to work this out: 

The `dbinom()` (density) function has three arguments:  

* `x`: the number of ‘heads’ we want to know the probability of. Either a single one, 3 or a series 0:10. In this case it's 5.

* `size`: the number of trials (flips) we are simulating; in this case, 10 flips.

* `prob`: the probability of ‘heads’ on one trial. Here chance is 50-50 which as a probability we state as 0.5 or .5

Copy, paste and run the below code in a new code chunk:


```r
dbinom(x = 5, size = 10, prob = 0.5)
```

* What is the probability of getting 5 heads out of 10 coin flips to 2 decimal places? <input class='webex-solveme nospaces' size='4' data-answer='["0.25",".25"]'/>  
* What is this probability expressed in percent? <select class='webex-select'><option value='blank'></option><option value=''>0.25%</option><option value=''>2.5%</option><option value='answer'>25%</option></select>

## Activity 3: `pbinom()`

OK, question  number 2. What is the probability of getting at most 2 heads on 10 flips? 

This time we use `pbinom()` as we want to know the **cumulative probability** of getting a maximum of 2 heads from 10 coin flips. so we have set a cut-off point of 2 but we still have a probability of getting a heads of 0.5.

**Note:** `pbinom()` takes the arguments `size` and `prob` argument just like `dbinom()`. However, the first input argument is `q` rather than `x`. This is because in dbinom `x` is a fixed number, whereas `q` is all the possibilities **up to** a given number (e.g. 0, 1, 2). 

Copy, paste and run the below code in a new code chunk:


```r
pbinom(q = 2, size = 10, prob = 0.5)
```

* What is the probability of getting a maximum of 2 heads on 10 coin flips to 2 decimal places? <input class='webex-solveme nospaces' size='4' data-answer='["0.05",".05"]'/>  
* What is this probability expressed in percent? <select class='webex-select'><option value='blank'></option><option value=''>0.05%</option><option value=''>0.5%</option><option value='answer'>5%</option></select>

## Activity 4: `pbinom()` 2

Let's try one more scenario with a cut-off point to make sure you have understood this. What is the probability of getting 7 or more heads on 10 flips?

We can use the same function as in the previous example, however, there's an extra argument if we want to get the correct answer. Let's try running the code we used above but change `q = 2` to `q = 7`.


```r
pbinom(q = 7, size = 10, prob = .5) 
```

```
## [1] 0.9453125
```

This tells us that the probability is .95 or 95% - that doesn't seem right does it? The default behaviour for `pbinom()` is to calculate cumulative probability for the lower tail of the curve, i.e., if you specify `q = 2` it calculates the probability of all outcomes below 2. We specified `q = 7` which means that it's calculated the probability of getting an outcome of 0, 1, 2, 3, 4, 5, 6, and 7, the blue area in the below figure - which is obviously very high.

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{14-probability-2_files/figure-latex/unnamed-chunk-1-1} 

}

\caption{Lower and upper tails}(\#fig:unnamed-chunk-1)
\end{figure}

To get the right answer, we have to add `lower.tail = FALSE` as we are interested in the upper tail of the distribution. Because we want the cumulative probability to include 7, we set `q = 6`. This will now calculate the cumulative probability of getting 7, 8, 9, or 10 heads out of 10 coin flips.

Copy, paste and run the below code in a new code chunk:


```r
pbinom(q = 6, size = 10, prob = .5, lower.tail = FALSE) 
```

* What is the probability of getting between 7 and 10 heads from 10 coin flips to 2 decimal places? <input class='webex-solveme nospaces' size='4' data-answer='["0.17",".17"]'/>  
* What is this probability expressed in percent? <select class='webex-select'><option value='blank'></option><option value=''>0.017%</option><option value=''>0.17</option><option value='answer'>17%</option></select> 

## Activity 5: `qbinom()`

OK, now let's consider a scenario in which you'd use the quantile function `qbinom`. Imagine that you've been accosted by a street magician and they want to bet you that they can predict whether the coin will land on heads or tails. You suspect that they've done something to the coin so that it's not fair and that the probability of the coin landing on a head is no longer .5 or 50/50, it's now more likely to land on tails. Your null hypothesis is that the coin is not dodgy and that the probability should be even (P(heads)=.5).You are going to run a single experiment to test your hypothesis, with 10 trials. What is the minimum number of heads that is acceptable if p really does equal .5?

You have used the argument `prob` in the previous two functions, `dbinom` and `pbinom`, and it represents the probability of success on a single trial (here it is the probability of 'heads' in one coin flip, .5). For `qbinom`, `prob` still represents the probability of success in one trial, whereas `p` represents the overall probability of success across all trials. When you run `pbinom`, it calculates the number of heads that would give that probability. 

We know from looking at the binomial distribution above that sometimes even when the coin is fair, we won't get exactly 5/10 heads. Instead, we want to set a cut-off and in this example we will use the default cut-off for statistical significance in psychology, .05, or 5%.

In other words, you ask it for the minimum number of successes (e.g. heads) to maintain an overall probability of .05, in 10 flips, when the probability of a success on any one flip is .5.


```r
qbinom(p = .05, size = 10, prob = .5)
```

```
## [1] 2
```

And it tells you the answer is 2. If the magician flipped fewer than two heads out of ten, you could conclude that there is a less than 5% probability that would happen if the coin was fair and you would reject the null hypothesis that the coin was unbiased against heads and tell the magician to do one.

`qbinom` also uses the lower.tail argument and it works in a similar fashion to pbinom.
 
However, ten trials is probably far too few if you want to accuse the magician of being a bit dodge. Run the below code and then answer the following questions:

* What would your cut-off be if you ran 100 trials? <input class='webex-solveme nospaces' size='2' data-answer='["42"]'/>
* What would your cut-off be if you ran 1000 trials? <input class='webex-solveme nospaces' size='3' data-answer='["474"]'/>
* What would your cut-off be if you ran 10,000 trials? <input class='webex-solveme nospaces' size='4' data-answer='["4918"]'/>


```r
qbinom(p = .05, size = c(100, 1000, 10000), prob = .5)
```

Notice that the more trials you run, the more precise the estimates become, that is, the closer they are to the probability of success on a single flip (.5). Again this is a simplification, but think about how this relates to sample size in research studies, the more participants you have, the more precise your estimate will be.

******

**Visualise it!**

Have a go at playing around with different numbers of coin flips and probabilities in our `dbinom()` and `pbinom()` app!

\begin{figure}

{\centering \href{https://shannon-mcnee19.shinyapps.io/binomial_shiny/}{\includegraphics[width=1\linewidth]{14-probability-2_files/figure-latex/unnamed-chunk-2-1} }

}

\caption{Binomial distribution app}(\#fig:unnamed-chunk-2)
\end{figure}

******

## Normal distribution

A similar set of functions exist to help us work with other distributions, including the normal distribution and we're going to use three of these:

`dnorm()`-the density function, for calculating the probability of a specific value

`pnorm()`-the probability or distribution function, for calculating the probability of getting at least or at most a specific value

`qnorm()`-the quantile function, for calculating the specific value associated with a given probability

As you can probably see, these functions are very similar to the functions we've already come across, that are used to work with the binomial distribution.

## Probability of heights

Data from the [Scottish Health Survey (2008)](http://www.scotland.gov.uk/Resource/Doc/286063/0087158.pdf) shows that:

* The average height of a 16-24 year old Scottish man is 176.2 centimetres, with a standard deviation of 6.748.
* The average height of a 16-24 year old Scottish woman is 163.8 cm, with a standard deviation of 6.931.
* There are currently no data on Scottish trans and non-binary people.

The below figure is a simulation of this data - you can see the code used to run this simulation by clicking the solution button.


<div class='webex-solution'><button>Solution</button>


```r
men <- rnorm(n = 100000, mean = 176.2, sd = 6.748)
women <- rnorm(n = 100000, mean = 163.8, sd = 6.931)

heights <- tibble(men, women) %>%
  pivot_longer(names_to = "sex", values_to = "height", men:women)

ggplot(heights, aes(x = height, fill = sex)) +
  geom_density(alpha = .6) +
  scale_fill_viridis_d(option = "E") +
  theme_minimal()
```

</div>


\begin{figure}

{\centering \includegraphics[width=1\linewidth]{14-probability-2_files/figure-latex/unnamed-chunk-4-1} 

}

\caption{Simulation of Scottish height data}(\#fig:unnamed-chunk-4)
\end{figure}

In this chapter we will use this information to calculate the probability of observing at least or at most a specific height with `pnorm()`, and the heights that are associated with specific probabilities with `qnorm()`.

## Activity 6:`pnorm()`

`pnorm()` requires three arguments:

* `q` is the value that you want to calculate the probability of
* `mean` is the mean of the data
* `sd` is the standard deviation of the data
* `lower.tail` works as above and depends on whether you are interested in the upper or lower tail


```r
pnorm(q = NULL, mean = NULL, sd = NULL, lower.tail = NULL)
```

Replace the NULLs in the above code to calculate the probability of meeting a 16-24 y.o. Scottish woman who is taller than the average 16-24 y.o. Scottish man.

* What is the probability of meeting a 16-24 y.o. Scottish woman who is taller than the average 16-24 y.o. Scottish man? <input class='webex-solveme nospaces' size='4' data-answer='["0.04",".04"]'/>  
* What is this probability expressed in percent? <select class='webex-select'><option value='blank'></option><option value=''>0.04%</option><option value=''>0.4%</option><option value='answer'>4%</option></select>

## Activity 7: `pnorm` 2

Fiona is a very tall Scottish woman (181.12\nbsp{}cm) in the 16-24 y.o. range who will only date men who are taller than her.  

* Using `pnorm()` again, what is the proportion of Scottish men Fiona would be willing to date to 2 decimal places? <input class='webex-solveme nospaces' size='4' data-answer='["0.23",".23"]'/>  
* What is this probability expressed in percent? <select class='webex-select'><option value='blank'></option><option value=''>0.23%</option><option value=''>2.3%</option><option value='answer'>23%</option></select>

## Activity 8: `pnorm` 3

On the other hand, Fiona will only date women who are shorter than her. 

* What is the proportion of Scottish women would Fiona be willing to date to 2 decimal places? <input class='webex-solveme nospaces' size='4' data-answer='["0.99",".99"]'/>  
* What is this probability expressed in percent? <select class='webex-select'><option value='blank'></option><option value=''>0.99%</option><option value=''>9.9%</option><option value='answer'>99%</option></select>

## Activity 9: `qnorm()`

In the previous examples we calculated the probability of a particular outcome. Now we want to calculate what outcome would be associated with a particular probability and we can use `qnorm()` to do this.

`qnorm()` is very similar to `pnorm()` with one exception, rather than specifying `q` our known observation or quantile, instead we have to specify `p`, our known probability.


```r
qnorm(p = NULL, mean = NULL, sd = NULL, lower.tail = NULL)
```

Replace the NULLs in the above code to calculate how tall a 16-24 y.o. Scottish man would have to be in order to be in the top 5% (i.e., p = .05) of the height distribution for Scottish men in his age group.

**Visualise it!**

Have a go at playing around with different distributions in our `dnorm()` and `pnorm()` app - [access it here](http://shiny.psy.gla.ac.uk/jackt/ShinyPsyTeachR/ug1/normal-distributions/)

******

And that's it! The key concepts to take away from this chapter are that different types of data tend to follow known distributions, and that we can use these distributions to calculate the probability of particular outcomes. This is the foundation of many of the statistical tests that you will learn about in level 2. For example, if you want to compare whether the scores from two groups are different, that is, whether they come from different distributions, you can calculate the probability that the scores from group 2 would be in the same distribution as group 1. If this probability is less than 5% (p = .05), you might conclude that the scores were significantly different. That's an oversimplification obviously, but if you can develop a good understanding of probability distributions it will stand you in good stead for level 2. 

## Activity solutions - Probability

### Activity 2


<div class='webex-solution'><button>Solution</button>


```r
.25
```

</div>


### Activity 3


<div class='webex-solution'><button>Solution</button>


```r
.06
```

</div>


### Activity 4


<div class='webex-solution'><button>Solution</button>


```r
.17
```

</div>



### Activity 5


<div class='webex-solution'><button>Solution</button>


```r
42
474
4918
```

</div>


### Activity 6


<div class='webex-solution'><button>Solution</button>


```r
pnorm(q = 176.2, mean = 163.8, sd = 6.931, lower.tail = FALSE)
```

</div>


### Activity 7


<div class='webex-solution'><button>Solution</button>


```r
pnorm(q = 181.12, mean = 176.2, sd = 6.748, lower.tail = FALSE)
```

</div>


### Activity 8


<div class='webex-solution'><button>Solution</button>


```r
pnorm(q = 181.12, mean = 163.8, sd = 6.931, lower.tail = TRUE)
```

</div>


### Activity 9


<div class='webex-solution'><button>Solution</button>


```r
qnorm(p = .05, mean = 176.2, sd = 6.748, lower.tail = FALSE)
```

</div>




<!--chapter:end:14-probability-2.Rmd-->

# Simulation

Before we finish up by analysing your project data, we're going to introduce a few new functions to show you some other things that R can do and that will also reinforce your understanding of probability. 

## Simulation

One of the most powerful features of R is that you can use it for data simulation. Data simulation is the act of generating random numbers that follow a certain distribution or have known properties. This might not sound particularly impressive, but simulating data means that you can do things such as plan your statistical analyses, understand and demonstrate how probability works, or estimate how many participants you need to test in your experiment based upon what you think the data will look like. Data simulation uses the different types of distributions that we covered in Probability to generate data, so make sure that you're happy with the probability chapter before you move on. 

## Activity 1: `sample()`

Just like Probability, all the functions we need for simulation are contained in Base R, however, we'll also load the `tidyverse` so that we can wrangle our simulated data.

Let’s start by introducing the `sample()` function, which samples elements (data points) from a vector (a collection of things that are of the same type, like numbers or words). We can use `sample()` to simulate flipping a coin and build some of the graphs you saw in the probability chapter. `sample()` is used when we want to simulate discrete data, i.e., (nominal or ordinal data). 

`sample()` requires you to define three arguments:  

* `x` = a vector of elements, i.e., all of the possible outcomes. For our current example, this would be HEADS and TAILS.  
* `size` = how many samples do you want to take, i.e., how many times do you want R to flip the coin?  
* `replace` = specifies whether we should sample with replacement or not. In the last lab we used the example of pulling names out of a hat. If you put the name back in the hat each time you pulled one out this would be with replacement, if you don't put the name back in this would be sampling without replacement. Basically, do you want to be able to get the same outcome on different samples? For a coin flip, it should be possible to get the same outcome more than once, so we specify `TRUE`. If we specified `FALSE` you could only draw as many samples as there were unique values, so in our case we could only flip the coin twice: once it would land on heads, once on tails, and then we would run out of outcomes.  

* Open a new R Markdown document, name it "Simulation" and save it in your Data Skills folder.
* Copy, paste, and run the below code in a new code chunk to simulate flipping a coin 4 times (and load the `tidyverse`). 


```r
# Notice that because our event labels are strings (text), 
# we need to enter them into the function in "quotes" 
library(tidyverse)
sample(x = c("HEADS", "TAILS"), size = 4, replace = TRUE) 
```

```
## [1] "TAILS" "HEADS" "TAILS" "HEADS"
```

How many heads did you get? Don't worry if it's different to our example. Run the code again. How many heads did you get this time? How many do you get on each turn if you run the code five more times? 

When you perform data simulation, you're unlikely to get the same outcome each time you take a sample, just like if you flipped a coin 4 times on 5 separate occasions you would be unlikely to get the same number of heads each time. What's so useful about data simulation is that we can use the outcomes from lots of different sampling attempts to calculate the probability of a particular outcome, e.g., getting 4 heads from 4 flips of a coin.

So that we can add up the number of heads and tails more easily, let's simulate those coin flips again, but using numerical codes, 1 = HEADS, 0 = TAILS.

* Now that the outcomes are numeric, we don't need the combine function `c`  
* 0:1 means all numbers from 0 to 1 in steps of 1. So basically, 0 and 1. If you wanted to simulate rolling a die, you would write `1:6` which would give you all the whole numbers from 1 to 6.  


```r
sample(x = 0:1, size = 4, replace = TRUE)
```

```
## [1] 0 1 1 0
```

## Activity 2: `sum()`

Now that we're using ones and zeroes we can count the number of heads by summing the values of the outcomes. The below code will sample our coin flips as above, and then count up the outcomes. Because we've coded heads = 1 and tails = 0, we can interpret the sum of all the outcomes as the number of heads.

* Copy, paste and run the code below in a new code chunk.


```r
# This code pipes the output of sample() into sum() which counts up the number of heads/1s.

sample(x = 0:1, size = 4, replace = TRUE) %>% sum()
```

```
## [1] 1
```
 
Run this function multiple times (you can use the green markdown play arrow at the top right of the code chunk to make this easy). In our simulation of five sets of four flips we got 1, 3, 2, 2, and 3 heads. So in only one out of the five simulations did we get exactly one heads, i.e., a proportion of .2 or 20% of the time.

## Activity 3: `replicate()` 1

Let’s repeat the experiment a whole bunch more times. We can have R do this over and over again using the `replicate()` function. `replicate()` requires two arguments (although there are other optional arguments if you want to do more complicated tasks):

* `n` = the number of times you want to repeat your code   
* `expr` = the expression, or code, you want to repeat  

Copy, paste and run the below code into a new code chunk to run the sample function and sum up the outcomes 20 times.


```r
replicate(n = 20, expr = sample(0:1, 4, TRUE) %>% sum())
```

```
##  [1] 3 3 2 1 2 3 1 2 3 2 2 4 2 3 3 2 2 3 1 1
```


## Monte Carlo simulation
Every year, the city of Monte Carlo is the site of innumerable games of chance played in its casinos by people from all over the world. This notoriety is reflected in the use of the term “Monte Carlo simulation” among statisticians to refer to using a computer simulation to estimate statistical properties of a random process. In a Monte Carlo simulations, the random process is repeated over and over again in order to assess its performance over a very large number of trials. It is usually used in situations where mathematical solutions are unknown or hard to compute. Now we are ready to use Monte Carlo simulation to demonstrate the probability of various outcomes. 

## Activity 4: `replicate()` 2

We are going to run our coin flip experiment again but this time we are going to run the experiment 50 times (each including 4 coin tosses), and use the same principles to predict the number of heads we will get.

* Copy, paste, and run the below code to run the simulation and store the result in an object `heads50** using the code below:


```r
heads50 <- replicate(50, sample(0:1, 4, TRUE) %>% sum())   
heads50
```

```
##  [1] 3 3 2 3 2 2 1 1 2 2 3 3 1 2 1 0 3 3 1 1 1 1 2 3 2 3 1 3 2 0 4 3 2 3 1 1 2 3
## [39] 2 2 0 1 1 2 2 1 3 3 2 2
```

## Activity 5: probability

We can estimate the probability of each of the outcomes (0, 1, 2, 3, 4 heads after 4 coin tosses) by counting them up and dividing by the number of experiments. We will do this by putting the results of the replications in a tibble() and then using count().


```r
data50 <- tibble(heads = heads50) %>%   # convert to a table
                group_by(heads) %>%   # group by number of possibilities (0,1,2,3,4)
                summarise(n = n(), # count occurances of each possibility,
                          p=n/50) # & calculate probability (p) of each
```
  

\begin{tabular}{r|r|r}
\hline
heads & n & p\\
\hline
0 & 3 & 0.06\\
\hline
1 & 14 & 0.28\\
\hline
2 & 17 & 0.34\\
\hline
3 & 15 & 0.30\\
\hline
4 & 1 & 0.02\\
\hline
\end{tabular}

Your numbers may be slightly different to the ones presented in this book - remember that by default, each time you run a simulation, you will get a different random sample.

## Activity 6: visualisation

We can then plot a histogram of the outcomes using `geom_bar()`.


```r
# Note: stat = "identity" tells  ggplot to use the values of the y-axis variable (p) as the height of the bars in our histogram (as opposed to counting the number of occurances of those values)

ggplot(data50, aes(x = heads,y = p)) + 
  geom_bar(stat = "identity", fill = "purple") + 
  labs(x = "Number of Heads", y = "Probability of Heads in 4 flips (p)") +
  theme_minimal()
```

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{15-simulation_files/figure-latex/data50hist-1} 

}

\caption{No. of heads from 4 coin tosses probability outcomes.}(\#fig:data50hist)
\end{figure}

******

**Pause here and interpret the above figure**

* What is the estimated probability for flipping 0/4 heads? 1/4 heads? 2/4 heads? 3/4 heads? 4/4 heads?

******

Unfortunately sometimes this calculation will estimate that the probability of an outcome is zero since this outcome never came up when the simulation is run. If you want reliable estimates, you need a **bigger sample** to minimise the probability that a possible outcome won't occur.

## Activity 7: big data

Let's repeat the Monte Carlo simulation, but with 10,000 trials instead of just 50. All we need to do is change `n` from 50 to 10000. 


```r
heads10K <- replicate(n = 10000, expr = sample(0:1, 4, TRUE) %>% sum())   
```

Again, we'll put the outcome into a table using `tibble` and calculate counts and probabilities of each outcome using `group_by()` and `summarise()`. Remember to try reading your code in full sentences to help you understand what multiple lines of code connected by pipes are doing. How would you read the below code?


```r
data10K <- tibble(heads = heads10K) %>%   
                group_by(heads) %>%           
                summarise(n = n(), p=n/10000) 
```

Finally, we can visualise this as we did earlier.


```r
ggplot(data10K, aes(heads,p)) + 
  geom_bar(stat = "identity", fill = "purple") + 
  labs(x = "Number of Heads", y = "Probability of Heads in 4 flips (p)") +
  theme_minimal()
```

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{15-simulation_files/figure-latex/data10Khist-1} 

}

\caption{10K coin toss probability outcomes.}(\#fig:data10Khist)
\end{figure}

Using Monte Carlo simulation, we estimate that the probability of getting exactly one head on four throws is about 0.25. The above result represents a probability distribution for all the possible outcomes in our experiments. We can derive lots of useful information from this.

For instance, what is the probability of getting two or more heads in four throws? This is easy: the outcomes meeting the criterion are 2, 3, or 4 heads. We can just add these probabilities together like so:

```r
data10K %>%
  filter(heads >= 2) %>%
  summarise(p2 = sum(p))
```

```
## # A tibble: 1 x 1
##      p2
##   <dbl>
## 1 0.689
```

You can add probabilities for various outcomes together as long as the outcomes are mutually exclusive, that is, when one outcome occurs, the others can't occur. For this coin flipping example, this is obviously the case: you can't simultaneously get exactly two and exactly three heads as the outcome of a single experiment. However, be aware that you can't simply add probabilities together when the events in question are not mutually exclusive: for example, the probability of the coin landing heads up, and it landing with the image of the head being in a particular orientation are not mutually exclusive, and can't be simply added together.

This is the basis of how we can calculate the probability of an outcome using a known distribution - by simulating a large number of trials we can use this as an estimate for how our data will look in the real world.

## Activity 8: `rnorm()`

We can also use R to simulate continuous data that follow a normal distribution using `rnorm()`. You've actually used `rnorm()` before, all the way back in Intro to R from Psych 1A but we'll go over it again. 

* `n` is the number of data points you wish to simulate which is the only required argument for `rnorm()`
* `mean` is the mean that you want your data to have. If you don't provide this argument, `rnorm()` will use a default value of `mean = 0`. 
* `sd` is the standard deviation you want your data to have. If you don't provide this argument, `rnorm()` will use a default value of `sd = 1`.

Copy, paste and run the below code in a new code chunk. This will randomly generate 50 numbers that collectively have a mean of 10 and a SD of 2 and then store it in the object `normal`.


```r
normal <- rnorm(n = 50, mean = 10, sd = 2)
```

You can check that the data you have generated are as you expected by calculating the mean and SD of this new variable - you shouldn't expect the values to be exactly 10 and 2 (remember, it's randomly generated), but they should be reasonably close.


```r
mean(normal)
sd(normal)
```

```
## [1] 9.9299
## [1] 2.256631
```

Finally, you can visualise your data with a density plot. Try changing the number of data points generated by `rnorm()` from 50 to 500 to 5000 and then see how the shape of the distribution changes.


```r
tibble(normal = normal) %>% #turn the variable normal into a table and then
  ggplot(aes(normal)) + # create a density plot
  geom_density(fill = "red") +
  theme_minimal()
```

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{15-simulation_files/figure-latex/unnamed-chunk-3-1} 

}

\caption{Distribution of variable created by rnorm}(\#fig:unnamed-chunk-3)
\end{figure}


## Activity 9: Simulate a dataset

Finally, we can put all of this together to simulate a full dataset. Let's imagine that we're going to run an experiment to see whether 120 people will roll a higher number on a die if their IQ is higher. This is obviously a stupid experiment but psychology does occasionally do stupid things.

* First, let's create a variable that has all of our subject IDs. We're just going to assign our participants numerical codes.


```r
subject_id <- 1:120 # create a variable called subject_id that has the numbers 1 to 120 in it
```

Then we're going to create a column for gender using a new but simple function `rep` which stands for "repeat". The below code will create a variable that repeats "man" 40 times, then "women" 40 times, then "non-binary" 40 times.


```r
gender <- rep(x = c("man", "woman", "nonbinary"), each = 40)
```

Next, let's simulate them all rolling a die once using `sample()`.


```r
rolls <- sample(x = 1:6, size = 120, replace = TRUE)
```

Then, let's simulate their IQ scores. IQ scores are standardised so that overall, the population has an average IQ of 100 and a SD of 15 so we can use this information to simulate the data with `rnorm()`.


```r
iq <- rnorm(n = 120, mean = 100, sd = 15)
```

Finally, we can stitch all these variables together into a table.


```r
sim_data <- tibble(subject_id, gender, rolls, iq)
```

Now that we've got our simulated data we could write code to analyse it even before we've collected any real data which will not only save us time in the future, but will help us plan our analyses and we could include this code in a pre-registration document. 

For example, you could create a plot of IQ scores for each dice roll (remember these are not real data...)


```r
sim_data %>%
  mutate(rolls = as.factor(rolls)) %>%
  ggplot(aes(x = rolls, y = iq, fill = rolls)) +
  geom_violin(trim = FALSE, alpha = .6, show.legend = FALSE) +
  geom_boxplot(width = .2, show.legend = FALSE) +
  scale_fill_viridis_d(option = "E") +
  theme_minimal() +
  labs(x = "Outcome of dice roll")
```

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{15-simulation_files/figure-latex/unnamed-chunk-9-1} 

}

\caption{Boxplot of IQ scores grouped by what each person rolled on the die}(\#fig:unnamed-chunk-9)
\end{figure}

## Finished!

The final Data Skills activity is to analyse your group project data which means in terms of new stuff to learn, we're done! In Psych 1A and 1B, we've tried to give you a solid introduction to common data skills you'll need in order to conduct your own research. Even if you don't intend to continue with psychology or quantitative research in the future, we hope that you're proud of the skills you've learned. For some of you, R might not have been your favourite bit of the course, but you should be very proud of what you've achieved and with such a diverse class we hope you can see that programming isn't an innate skill that only certain people can learn. It just take a a bit of work, some (hopefully) helpful teaching materials, and a lot of swearing at the error messages. 


<!--chapter:end:15-simulation.Rmd-->

# Project analysis

We've spent the last 6 months giving you the skills you need to be able to deal with your own data. Now's the time to show us what you've learned. In this chapter we're going to describe the steps you will need to go through when analysing your data but, aside from a few lines that will help you deal with the questionnaire data that the Experimentum platform spits out, we're not going to give you any code solutions. 

Everything you need to do you've done before, so use this book to help you. Remember, you don't need to write the code from memory, you just need to find the relevant examples and then copy and paste and change what needs changing to make it work for you.

We suggest that you problem-solve the code as a group, however, make sure that you all have a separate copy of the final working code. You can book into GTA sessions in week 9 and 10 to help you as well.

## Step 1: Load in packages and data

The data file `final_data.csv` is on Moodle in the Group Poster section.

Don't change ANY of the code from step 1. Just copy and paste it into R EXACTLY as it is below. 

This code will clean up the Experimentum data a little bit to help you on your way. You will get a message saying `NAs introduced by coercion`. Ignore this message, it's a result of converting the employment hours to a numeric variable. 

It's also worth noting that this is a MUCH larger dataset than any you've worked with so far and you might find that R takes a little longer to complete each task - this is perfectly normal.


```r
library(tidyverse)

dat <- read_csv("final_data.csv", 
                col_types = cols(team = col_factor(), 
                                 dv = col_character()))

demo <-  dat %>%
  filter(quest_id == "1448") %>%
  select(user_id, user_sex, user_age, q_name, dv, covid) %>%
  pivot_wider(names_from = "q_name", values_from = "dv") %>%
  select(-"NA") %>%
  mutate(employment = as.numeric(employment))

teams <-  dat %>%
  filter(q_name == "team_name") %>%
  select(user_id, team)

mslq <-  dat %>%
  filter(quest_id == "1449") %>%
  select(user_id, q_name, dv) %>%
  mutate(dv = as.numeric(dv)) %>%
  arrange(q_name) %>%
  pivot_wider(names_from = "q_name", values_from = "dv")

final_dat <- left_join(demo, teams) %>%
  inner_join(mslq)
```

Right. Your turn. You may find it helpful to use the search function in this book to find examples of the code you need.

\begin{figure}

{\centering \includegraphics[width=0.75\linewidth,height=0.75\textheight]{./images/searching} 

}

\caption{Searching for functions}(\#fig:unnamed-chunk-2)
\end{figure}


## Step 2: Look at the data 

`final_dat` should have 91 columns which means that R won't show you them all if you just click on the object, you'll need to run `summary()`. Have a look at what all the variables are, you will find it helpful to refer to the Survey Variables Overview document.

## Step 3. Select your variables

Use `select()` to retain only the variables you need for your chosen research design and analysis, i.e. the responses to the sub-scale you're interested in as well as the user id, sex, age, team number, and any variables you're going to use as criteria for inclusion. Again, you might find it helpful to consult the survey variables overview document to get the variable names.

## Step 4: Factors

Using `summary()` again if you need it, check what type of variable each column is. Recode any variables that you want to use as categorical variables as factors and then run summary again to see how many you have in each group. You will find the code book you downloaded with the data files from Moodle helpful for this task. You may find the [Data Visualisation activity about factors](https://psyteachr.github.io/ug1-practical/intro-to-data-viz.html#activity-3-factors) helpful for this.

## Step 5: Filter

If necessary, use `filter()` to retain only the observations you need, for example, you might need to delete participants above a certain age, or only use mature students or undergraduate students (and make sure you kept all these columns in step 3). Do not filter the data for your team yet. You will find the code book you downloaded with the data files from Moodle helpful for this task.

If your grouping variable is whether students undertake paid employment, you will need to create a new variable using mutate that categorises participants into employed (> 0 hours worked per week) and not employed (0 hours per week) categories.

An additional bit of syntax you might find useful for this is the `%in%` notation which allows you to filter by multiple values. For example, the following code will retain all rows where `user_sex` equals male OR female and nothing else (i.e., it would get rid of non-binary participants, prefer not to says, and missing values).


```r
dat %>%
  filter(user_sex %in% c("male", "female"))
```

You can also do it by exclusion with `!`. The below code would retain everything where `user_sex` DOESN'T equal male or female.


```r
dat %>%
  filter(!user_sex %in% c("male", "female"))
```

If you were feeling really fancy you could do steps 2 - 5 in a single pipeline of code.

## Step 6: Sub-scale scores

Calculate the mean score for each participant for your chosen sub-scale. There are a few ways you can do this but helpfully the [Experimentum documentation](https://gla-my.sharepoint.com/:w:/g/personal/2087153l_student_gla_ac_uk/EfFPtssPMV9HkrZALfdln8wBBJKClQ0eAXzrrHxa0nOo7g?e=SNIhSt) provides example code to make this easier, you just need to adapt it for the variables you need. You may also want to change the `na.rm = TRUE` for the calculation of means depending on whether you want to only include participants who completed all questions.

* Change `data` to the name of the object you created in step 6
* Change `question_1:question_5` to the relevant variables for your subscale e.g., `help_1:help_4`
* Change `scale_mean` to the name of your sub-scale e.g., `anxiety_mean`
* If you want to calculate the mean scores for participants who have missing data, e.g., if they only completed three out of four questions for your sub-scale, then `na.rm = TRUE`. If you only want to calculate scores for participants who answered all questions for your sub-scale, then `na.rm = FALSE`.
* Change NOTHING else

You may get the message `summarise() regrouping output by....` this is fine.


```r
dat_means <- data %>% 
  pivot_longer(names_to = "var", values_to = "val", question_1:question_5) %>% 
  group_by_at(vars(-val, -var)) %>% 
  summarise(scale_mean = mean(val, na.rm = TRUE)) %>% 
  ungroup() 
```

Optional: If you want a dataset that just has complete cases, then you can run the below code. This will remove any participants who have an `NA` for scale-score due to missing data.


```r
dat_means_complete <- dat_means %>%
  drop_na(scale_mean)
```

## Step 7: Split the dataset

Use the codebook to find which `team` number corresponds to your team. Next, use `filter()`  to create a new dataset that only contains the data from participants who contributed to your team and call it `dat_means_team`. Once this is complete, you  will have a final large dataset that contains the sub-scale scores for all participants, and a smaller dataset that just has data from the participants you recruited for your team. 

## Step 8: Demographic information 

That should be the really hard bit done, now you've got the data in the right format for analysis. 

First, calculate the demographic information you need: number of participants, gender split, grouping variable split (if you're using a variable that's not gender), mean age and SD. 

You can calculate mean age and SD using `summarise()` like you've done before. There's several different ways that you can count the number of participants in each group, we haven't explicitly shown you how to do this yet so we'll give you example code for this below. The code is fairly simple, you just need to plug in the variables you need.

Do this separately for the full dataset and your team dataset.


```r
# count the total number of participants in the dataset

dat_means %>%
  count()

# count the number of responses to each level of user_sex (for gender)
dat_means %>%
  group_by(user_sex) %>%
  count()

# count the number of responses to each level of covid status (change this variable to the one you're using if necessary)
dat_means %>%
  group_by(covid) %>%
  count()

# count the number of responses across two categories (you might not need or want to do this)
dat_means %>%
  group_by(user_sex,covid) %>%
  count()
```

Once you've done this you might realise that you have participants in the dataset that shouldn't be there. For example, you might have people who have answered "Not applicable" to the mature student question, or you might have some NAs (missing data from when people didn't respond). 

You need to think about whether you need to get rid of any observations from your dataset. For example, if you're looking at gender differences, then you can't have people who are missing gender information. You may have said in your pre-reg that you would only include non-binary people if they made up a certain proportion of the data. If you're looking at mature student status, you can't have people who didn't answer the question or who said not applicable (i.e., postgrad students). You need to decide whether any of this is a problem, and potentially go back and add in an extra filter to step 6.

## Step 9: Descriptive statistics

Use `summarise()` and `group_by()` to calculate the mean, median, and standard deviation of the sub-scale scores for each group. Do this separately for the full dataset and your team dataset.

## Step 10: visualisation

You now need to create a bar chart with error bars and a violin-boxplot for both the full dataset and your team dataset. You've done all of these before, just find a previous example code and change the variables and axis labels. If you are comparing pre and post-covid, then you team plot will only have data from the post-covid group, this is ok, you can still compare it to the larger sample. 
















<!--chapter:end:16-project.Rmd-->

# (APPENDIX) Appendices {-} 





<!--chapter:end:appendix-0.Rmd-->

# Installing `R` {#installing-r}

## Why should I install R on my computer?

The R Server cuts down on a lot of installation problems and it means that you have all the packages and functions you need already installed. However, it requires an internet connection to use and additional when it comes time to submit your R assessments, if you don't have R on your computer it means that you won't be able to open the files you download from the server to check they're ok before you submit them.

There are some great detailed walkthrough videos by [Danielle Narvarro on YouTube](https://www.youtube.com/playlist?list=PLRPB0ZzEYegOZivdelOuEn-R-XUN-DOjd) re: how to install R on both Windows and Mac.

## Windows

If you are using Windows, you should download and install the following:

* [R](https://cran.r-project.org/bin/windows/base/)
* [R Studio](https://rstudio.com/products/rstudio/download/#download)
* [RTools](https://cran.r-project.org/bin/windows/Rtools/)

Once you've installed all three programs, restart your computer. Then, open RStudio (not R) and run the below code:


```r
install.packages("tidyverse")
```

This will install the `tidyverse` package on your computer. If you have any problems installing R, please book into a GTA session as they should be able to help you with any installation problems.

## Mac

If you are using a Mac, you should download and install the following:

* [R](https://www.stats.bris.ac.uk/R/)  
* [R Studio](https://rstudio.com/products/rstudio/download/#download)  
* [XQuartz](https://www.xquartz.org/)  

If you have any issues installing R on your Mac, first, we recommend that you watch the [walkthrough by Danielle Navarro](https://www.youtube.com/watch?v=ay25o485YXs&list=PLRPB0ZzEYegOZivdelOuEn-R-XUN-DOjd&index=1&t=113s). 

If you have further issues on Mac, you may find this video helpful [walkthrough video](https://www.youtube.com/watch?v=90IdULVGmYY). Additionally, if you are using a Mac with the Catalina OS, we also recommend you read this [troubleshooting guide](https://psyteachr.github.io/FAQ/installing-r-and-rstudio.html#i-am-using-macos-10.15-catalina)

Once you've installed all three programs, restart your computer. Then, open RStudio (not R) and run the below code:


```r
install.packages("tidyverse")
```

This will install the `tidyverse` package on your computer. If you have any problems installing R, please book into a GTA session as they should be able to help you with any installation problems.

## Chromebooks

Please note that you cannot currently install R on a Chromebook, please use the R Server.

## RStudio Settings

There are a few settings you should fix immediately after updating RStudio. Go to **`Global Options...`** under the **`Tools`** menu (&#8984;,), and in the General tab, uncheck the box that says **`Restore .RData into workspace at startup`**.  If you keep things around in your workspace, things will get messy, and unexpected things will happen. You should always start with a clear workspace. This also means that you never want to save your workspace when you exit, so set this to **`Never`**. The only thing you want to save are your scripts.

You may also want to change the appearance of your code. Different fonts and themes can sometimes help with visual difficulties or [dyslexia](https://datacarpentry.org/blog/2017/09/coding-and-dyslexia){target="_blank"}. 

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{images/rstudio_settings_general_appearance} 

}

\caption{RStudio General and Appearance settings}(\#fig:settings-general)
\end{figure}

You may also want to change the settings in the Code tab. Foe example, Lisa prefers two spaces instead of tabs for my code and likes to be able to see the <a class='glossary' target='_blank' title='Spaces, tabs and line breaks' href='https://psyteachr.github.io/glossary/w#whitespace'>whitespace</a> characters. But these are all a matter of personal preference.

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{images/rstudio_settings_code} 

}

\caption{RStudio Code settings}(\#fig:settings-code)
\end{figure}


## Installing LaTeX

You can install the LaTeX typesetting system to produce PDF reports from RStudio. Without this additional installation, you will be able to produce reports in HTML but not PDF. This course will not require you to make PDFs. To generate PDF reports, you will additionally need to install <code class='package'>tinytex</code> [@R-tinytex] and run the following code:


```r
tinytex::install_tinytex()
```

<!--chapter:end:appendix-a-installing-r.Rmd-->

# Updating R, RStudio, and packages

From time-to-time, updated version of R, RStudio, and the packages you use (e.g., ggplot) will become available. Remember that each of these are separate, so they each have a different process and come with different considerations. We recommend updating to the latest version of all three at the start of each academic year.

## Updating RStudio

RStudio is the easiest component to update. Typically, updates to RStudio won't affect your code, instead they add in new features, like spell-check or upgrades to what RStudio can do. There's usually very little downside to updating RStudio and it's easy to do.

Click `Help - Check for updates`

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{images/update_rstudio} 

}

\caption{Updating RStudio}(\#fig:img-updaterstudio)
\end{figure}

If an update is available, it will prompt you to download it and you can install it as usual.

## Updating packages

Package developers will occasionally release updates to their packages. This is typically to add in new functions to the package, or to fix or amend existing functions. **Be aware that some package updates may cause your previous code to stop working**. This does not tend to happen with minor updates to packages, but occasionally with major updates, you can have serious issues if the developer has made fundamental changes to how the code works. For this reason, we recommend updating all your packages once at the beginning of each academic year (or semester) - don't do it before an assessment or deadline just in case!

To update an individual package, the easiest way is to use the `install.packages()` function, as this always installs the most recent version of the package.


```r
install.packages("tidyverse")
```

To update multiple packages, or indeed all packages, RStudio provides helpful tools. Click `Tools - Check for Package Updates`. A dialogue box will appear and you can select the packages you wish to update. Be aware that if you select all packages, this may take some time and you will be unable to use R whilst the process completes.

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{images/update_packages} 

}

\caption{Updating packages with RStudio}(\#fig:img-updateall)
\end{figure}

Occasionally, you might have a few problem packages that seemingly refuse to update, for me, `rlang` and `vctrs` cause me no end of trouble. These aren't packages that you will likely every explicitly load, but they're required beneath the surface for R to do things like knit your Markdown files etc.

If you try to update a package and get an error message that says something like `Warning in install.packages : installation of package ‘vctrs’ had non-zero exit status` or perhaps `Error in loadNamespace(i, c(lib.loc, .libPaths()), versionCheck = vI[[i]]) :  namespace 'rlang' 0.4.9 is being loaded, but >= 0.4.10 is required` one solution I have found is to manually uninstall the package, restart R, and then install the package new, rather than trying to update an existing version. The `installr` package also has a useful function for uninstalling packages.


```r
# Load installr
library(installr)

# Uninstall the problem package
uninstall.packages("package_name")

# Then restart R using session - restart R
# Then install the package fresh

install.packages("package")
```

## Updating R

Finally, you may also wish to update R itself. The key thing to be aware of is that when you update R, if you just download the latest version from the website, you will lose all your packages. The easiest way to update R and not cause yourself a huge headache is to use the `installr` package. When you use the `updateR()` function, a series of dialogue boxes will appear. These should be fairly self-explanatory but there is a [full step-by-step guide available](https://www.r-statistics.com/2015/06/a-step-by-step-screenshots-tutorial-for-upgrading-r-on-windows/) for how to use `installr`, the important bit is to select "Yes" when it asked if you would like to copy your packages from the older version of R.


```r
# Install the installr package
install.packages("installr")

# Load installr
library(installr)

# Run the update function
updateR()
```

As always, if you're having issues, please ask on Teams or book into a GTA session.

<!--chapter:end:appendix-b-updating-r.Rmd-->

# Exporting files from the server

If you are using the R server, you may need to export files to share them with other people or submit them for your assignments.

* First, make sure you have saved any changes you have made to the file. Do this by clicking "File - Save", Ctrl + S, or clicking the save icon. If all your changes have been saved, the save icon will be greyed out. If there are new unsaved changes, you will be able to click the icon.
* Select the file you and to download in the files pane (bottom right) by ticking the box next to it, then click "More - Export" and save the file to your computer.
* If you do not have R installed, DO NOT try to open it on your computer. If you do, it will open in Word, Endnote or similar, and it may corrupt your code. Only open the file if you have R and R Studio installed.
* If you want to double check that this file is definitely the right one to submit for an assignment, you can re-upload it to the server and open it again to make sure it has the answers in it.

<!--chapter:end:appendix-c-exporting-server.Rmd-->

# Symbols {#symbols}

| Symbol | psyTeachR Term    | Also Known As     |
|:------:|:------------------|:------------------|
| ()     | (round) brackets  | parentheses       |
| []     | square brackets   | brackets          |
| {}     | curly brackets    | squiggly brackets |
| <>     | chevrons          | angled brackets / guillemets |
| <      | less than         |                   |
| >      | greater than      |                   |
| &      | ampersand         | "and" symbol      |
| #      | hash              | pound / octothorpe|
| /      | slash             | forward slash     |
| \\     | backslash         |                   |
| -      | dash              | hyphen / minus    |
| _      | underscore        |                   |
| *      | asterisk          | star              |
| ^      | caret             | power symbol      |
| ~      | tilde             | twiddle / squiggle|
| =      | equal sign        |                   |
| ==     | double equal sign |                   |
| .      | full stop         | period / point    |
| !      | exclamation mark  | bang / not        |
| ?      | question mark     |                   |
| '      | single quote      | quote / apostrophe|
| "      | double quote      | quote             |
| %>%    | pipe              | magrittr pipe     |
| \|     | vertical bar      | pipe              |
| ,      | comma             |                   |
| ;      | semi-colon        |                   |
| :      | colon             |                   |
| @      | "at" symbol       | [various hilarious regional terms](https://www.theguardian.com/notesandqueries/query/0,5753,-1773,00.html) |
| ...    | `glossary("ellipsis")`| dots     |


\begin{figure}

{\centering \includegraphics[width=1\linewidth]{images/soundimals_hash} 

}

\caption{[Image by James Chapman/Soundimals](https://soundimals.tumblr.com/post/167354564886/chapmangamo-the-symbol-has-too-many-names)}(\#fig:img-soundimals-hash)
\end{figure}





<!--chapter:end:appendix-d-symbols.Rmd-->

# License {-}

This book is licensed under Creative Commons Attribution-ShareAlike 4.0 International License [(CC-BY-SA 4.0)](https://creativecommons.org/licenses/by-sa/4.0/){target="_blank"}. You are free to share and adapt this book. You must give appropriate credit, provide a link to the license, and indicate if changes were made. If you adapt the material, you must distribute your contributions under the same license as the original. 

<!--chapter:end:appendix-y-license.Rmd-->




<!--chapter:end:appendix-z-refs.Rmd-->

