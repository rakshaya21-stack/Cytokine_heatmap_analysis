# Cytokine Heatmap Analysis

Reproduces heatmaps from Refractory Infantile IPEX with Treg-restricted FOXP3null Expression Caused by A Novel Variant in FOXP3.

## Usage

1. **Install R Packages**:
   ```r
   install.packages(c("pheatmap", "dplyr", "ggplot2", "tidyr"))
   ```

2. **Prepare Data**:
   - CSV with samples as rows, cytokines as columns.
   - Name healthy donor samples with `HD` in their ID (e.g., `HD_1`).

3. **Run Analysis**:
   ```r
   source("scripts/heatmap_analysis.R")
   ```

## Output
- Heatmaps saved to `figures/`.
