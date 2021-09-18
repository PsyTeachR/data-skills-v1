# render the book as HTML and open in a browser
set.seed(8675309) # so random stuff doesn't keep making new figures
xfun::in_dir("book", bookdown::render_book("index.Rmd", "bookdown::bs4_book"))
browseURL("docs/index.html")

