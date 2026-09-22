#Define gene names and their expression values
gene_names <- c("BRCA1", "TP53", "EGFR", "MYC", "PTEN", "KRAS")
control    <- c(5.2, 7.8, 3.1, 9.4, 6.0, 4.5)
treated    <- c(8.9, 7.6, 6.7, 12.1, 2.3, 9.8)

# Assign names to the vectors to create Named Vectors
names(control) <- gene_names
names(treated) <- gene_names

#Calculate Fold Change (treated / control)
fold_change <- treated / control

#Classify genes
# Use nested ifelse to check both conditions
classification <- ifelse(fold_change > 1.2, "upregulated",
                         ifelse(fold_change < 0.8, "downregulated", "stable"))

classification_factor <- factor(classification, 
                                levels = c("upregulated", "downregulated", "stable"))

# Combine classification with fold change data into a data frame for easy printing
results_df <- data.frame(Gene = gene_names, 
                         Fold_Change = fold_change, 
                         Classification = classification_factor)

#Subset genes with fold_change > 1.5
# Put the condition inside square brackets
high_fold_genes <- fold_change[fold_change > 1.5]
print("Genes with Fold Change > 1.5:")
print(high_fold_genes)

#Combine data into a Matrix
expr_matrix <- cbind(control, treated)

# Add row names (gene names) and column names (conditions)
rownames(expr_matrix) <- gene_names
colnames(expr_matrix) <- c("control", "treated")

print("Final Matrix:")
print(expr_matrix)

# Calculate average per gene
# The average is calculated as (control value + treated value) / 2
row_means <- rowMeans(expr_matrix)
print("Average Gene Expression per Gene:")
print(row_means)

#Save the results
write.table(results_df, file = "results.txt", sep = "\t", quote = FALSE, row.names = FALSE)
print("Results saved successfully to results.txt")


#Bar Plot for Fold Change
barplot(fold_change, 
        main = "Fold Change of Genes (Treated vs Control)",  # Title
        xlab = "Gene Names",                                 # X-axis label
        ylab = "Fold Change",                                # Y-axis label
        col = c("#FF6B6B", "#4ECDC4", "#45B7D1", "#96CEB4", "#FFEEAD", "#D4A5A5"), # Unique colors
        las = 2,                                             # Vertical gene names
        border = "black")

# Add horizontal line at 1.5 (upregulated threshold)
abline(h = 1.5, col = "red", lty = 2, lwd = 2)

# Add horizontal line at 0.8 (downregulated threshold)
abline(h = 0.8, col = "blue", lty = 2, lwd = 2)


#Box Plot for Gene Expression
boxplot(expr_matrix, 
        main = "Boxplot of Gene Expression",   # Title
        col = c("#4ECDC4", "#FF6B6B"),         # Colors for Control & Treated
        ylab = "Expression Level")             # Y-axis label


# Save Plot as Image
png("gene_expression_plot.png", width = 800, height = 600)  # Open image file
barplot(fold_change, 
        main = "Fold Change of Genes", 
        xlab = "Genes", 
        ylab = "Fold Change", 
        col = "steelblue", 
        las = 2)
abline(h = 1.5, col = "red", lty = 2)
abline(h = 0.8, col = "blue", lty = 2)
dev.off()  # Close image file (important to save the plot)
