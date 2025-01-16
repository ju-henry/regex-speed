FROM rocker/r-ver:4.0.0-ubuntu18.04

RUN R -e "install.packages('remotes', repos = 'https://cloud.r-project.org')"

RUN R -e "remotes::install_version('microbenchmark', version = '1.5.0', \
                                   repos = 'https://cloud.r-project.org')"
                                   
WORKDIR /usr/src/app

COPY script.R .

CMD ["Rscript", "script.R"]
