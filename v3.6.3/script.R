

library(microbenchmark)
text_file <- 'mtent12.txt'
file_str <- readChar(text_file, file.info(text_file)$size)
file_str <- iconv(file_str, "UTF-8", "UTF-8", sub = "")

patterns <- c(
  "Twain",
  "Huck[[:alpha:]]+",
  "[[:alpha:]]+ing",
  "^[^ ]*?Twain",
  "Tom|Sawyer|Huckleberry|Finn",
  " (Tom|Sawyer|Huckleberry|Finn).{0,30}river|river.{0,30}(Tom|Sawyer|Huckleberry|Finn)"
)

lres <- list()
for (p in patterns) {
  
  lres[[p]] <- microbenchmark(
    gregexpr(pattern = p, text = file_str, perl = T),
    times = 100, 
    unit = "milliseconds"
  )
  
}

saveRDS(lres, "/output/results.rds")


