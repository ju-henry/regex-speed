

begin_str <- paste0("{", paste0(rep('a', 99), collapse = ""), collapse = "")
end_str <- paste0(paste0(rep('a', 99), collapse = ""), "}", collapse = "")
final_str <- paste0(paste0(rep(begin_str, times = 1000), collapse = ""), paste0(rep(end_str, times = 1000), collapse = ""), collapse = "")

library(microbenchmark)
res <- microbenchmark(regexpr(pattern = '\\{(?>[^{}]*|(?R))*\\}', text = final_str, perl = T), 
                      times = 1000)

saveRDS(res, "/output/results.rds")


