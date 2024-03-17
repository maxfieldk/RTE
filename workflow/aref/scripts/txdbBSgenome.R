source("~/data/common/myDefaults.r")
library(igvR)
library(knitr)
library(rmarkdown)
library(circlize)
library(ComplexHeatmap)
library("ggplot2")
library("RColorBrewer")
library("magrittr")
library("cowplot")
library("ggVennDiagram")
library("org.Hs.eg.db")
library("ggrepel")
library("grid")
library("readr")
library("stringr")
library("dplyr")
library("tibble")
library("tidyr")
library(plotly)
library(DT)
library(ggExtra)
library(rstatix)
library(purrr)
library(ggpubr)
library(GenomicFeatures)
library(rtracklayer)

grs_refseq <- import(snakemake@input$refseq)
grs_repeatmasker <- import(snakemake@input$repeatmasker)
grs <- c(grs_refseq, grs_repeatmasker)
txdb <- makeTxDbFromGRanges(grs)
txdbrepeatmasker <- makeTxDbFromGRanges(grs_repeatmasker)
txdbrefseq <- makeTxDbFromGRanges(grs_refseq)
saveDb(txdb, file = snakemake@output$txdb)
saveDb(txdbrefseq, file = snakemake@output$txdbrefseq)
saveDb(txdbrepeatmasker, file = snakemake@output$txdbrepeatmasker)


# library(Biostrings)
# library(BSgenome)


# seed_files <- system.file("extdata", "GentlemanLab", package = "BSgenome")
# t2tseed <- grep("T2T.*seed", list.files(seed_files, full.names = TRUE), value = TRUE)
# t2tseedlines <- cat(readLines(t2tseed), sep = "\n") %>% as.character()
# gsub("Package: ", "Package: CustomBSgenome Ignore details below")

# keylist <- list(
#     "Package" = "BSgenome.Hsapiens."
# )