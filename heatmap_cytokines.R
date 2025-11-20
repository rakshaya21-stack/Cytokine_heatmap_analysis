# Load Libraries ----------------------------------------------------------
library(pheatmap)
library(dplyr)
library(ggplot2)
library(tidyr)

# Read Data ---------------------------------------------------------------
data <- read.csv("data/filtered_data.csv", row.names = 1)
matrix_data <- data.matrix(data)

# Calculate HD Reference Stats --------------------------------------------
hd_data <- matrix_data[grepl("HD", rownames(matrix_data)), ]
hd_median <- apply(hd_data, 2, median)
hd_mad <- apply(hd_data, 2, mad, constant = 1)

# Compute Z-Scores --------------------------------------------------------
pt_data <- matrix_data[!grepl("HD", rownames(matrix_data)), ]
z_scores <- t(apply(pt_data, 1, function(x) (x - hd_median) / hd_mad))

# Generate Heatmap --------------------------------------------------------
pheatmap(
  z_scores,
  color = colorRampPalette(c("#08519C", "white", "#A50F15"))(100),
  cluster_cols = TRUE,
  main = "Cytokine Z-Scores vs HD Reference"
)