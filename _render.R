# render the book

browseURL(
  xfun::in_dir("book", bookdown::render_book("index.Rmd", "bookdown::bs4_book"))
)

browseURL(
  xfun::in_dir("book", bookdown::preview_chapter("index.Rmd"))
)
