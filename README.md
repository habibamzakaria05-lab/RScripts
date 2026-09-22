# RScripts
# Gene Expression Filtering Script (R)

#Overview
A simple R script for analyzing gene expression data between two conditions: *Control* and *Treated*. It calculates the *Fold Change*, classifies genes as *Upregulated*, *Downregulated*, or *Stable*, and computes the average expression per gene. It also generates plots for visualization. Results are saved automatically to a text file.

# Files Included
| File | Description 
| gene_analysis.R | The main R script containing all the analysis code. |
| results.txt | The output file generated after running the script. |
| gene_expression_plot.png | The saved bar plot image of the fold change. |
| README.md | This documentation file. |

# How to Run
Follow these simple steps:

1. *Open RStudio.*
2. *Open the script:* File > Open File > gene_analysis.R
3. *Run the script:* Select all code (Ctrl + A) and press Ctrl + Enter , or click the *Run* button.
4. *Check the output:* A file named results.txt and an image named gene_expression_plot.png will be created in your working directory.

> *Note:* If you want to change the input genes or values, edit the gene_names, control, and treated vectors at the top of the script.

# What the Script Does (Step-by-Step)
1. *Creates Named Vectors* for control and treated using gene names.
2. *Calculates Fold Change* using the formula: treated / control 
3. *Classifies Genes* using ifelse():
   - > 1.2 → *Upregulated*
   - < 0.8 → *Downregulated*
   - Otherwise → *Stable*
4. *Converts Classification to a Factor* with specific levels.
5. *Creates a Matrix* combining both conditions and calculates rowMeans
6. *Saves results* to results.txt using write.table().
7. *Generates Plots:*
   - *Bar Plot* of Fold Change for each gene.
   - *Box Plot* comparing Control vs Treated expression levels.
   - Adds threshold lines at 1.5 (upregulated) and 0.8 (downregulated).
8. *Saves the Bar Plot* as gene_expression_plot.png

# Example Output (results.txt)
