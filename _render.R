# render the book
xfun::in_dir("book", bookdown::render_book("index.Rmd", "bookdown::bs4_book"))

# view the book in a web browser
browseURL("docs/index.html")


