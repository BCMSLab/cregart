# cregart

A manuscript about the [cRegulome](http://github.com/ropensci/cRegulome) R package which is part of the [rOpenSci](https://ropensci.org) now.

## Setting up the docker environment

The analysis was run on a [docker](https://hub.docker.com/r/bcmslab/cregart/) image based on the the latest **rocker/verse**. Other R packages were added to the image and were made available as an image that can be obtained and launched on any local machine running [docker](https://hub.docker.com/r/bcmslab/cregart/).

```bash
$ docker pull bcmslab/cregart:20181219
$ docker run -it bcmslab/cregart:20181219 bash
```

## Obtaining the source code

The source code is hosted publicly on this repository in a form of research compendium. This includes the scripts to reproduce the figures and tables in this manuscript. From within the container, [git](https://git-scm.com) can be used to clone the source code.

The following code clones the repository containing the source code.

```bash
$ git clone http://github.com/MahShaaban/cregart
```

## Running the analysis

The analysis scripts is organized to be ran using a single [make](https://www.gnu.org/software/make/) command. This will first extract and save the data in R objects. This will be used to generate the figures and tables. In addition, a log file is generated in the sub-folder 'log/' for each script which can be used for troubleshooting.

To do that, the `make` command should be invoked from within the cloned repo.

```bash
$ cd cregart
$ make
```

## Details of the R environment
The version of **R** that was used to perform this analysis is the 3.5.0 (2018-04-23) on `x86\_64-pc-linux-gnu`. The `DESCRIPTION` file in the main repository contains further details about the dependencies and the license of this work.

## More
