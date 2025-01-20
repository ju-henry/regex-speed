FROM rocker/r-ver:3.6.3-ubuntu18.04

RUN R -e "install.packages('remotes', repos = 'https://cloud.r-project.org')"

RUN R -e "remotes::install_version('microbenchmark', version = '1.5.0', \
                                   repos = 'https://cloud.r-project.org')"
                                   
WORKDIR /usr/src/app

COPY script.R .

RUN apt-get update && apt-get install -y wget

RUN wget http://www.gutenberg.org/files/3200/old/mtent12.zip

RUN unzip mtent12.zip

CMD ["Rscript", "script.R"]
