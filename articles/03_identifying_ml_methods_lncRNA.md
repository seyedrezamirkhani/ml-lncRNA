## Identifying Machine Learning Methods in lncRNA Research

### Introduction

Long non-coding RNAs (lncRNAs) are critical players in biological processes, and their study has increasingly turned to machine learning (ML) for insights. Identifying the ML methods applied in lncRNA research can reveal valuable patterns, highlight methodological trends, and provide a foundation for future innovation.

In this third part of the series, **Exploring Machine Learning and lncRNA Research**, we focus on identifying specific ML methods used in published research papers. By using natural language processing (NLP) techniques to analyze the text of these papers, we uncover the range of ML methods applied in lncRNA studies.

---

### The Motivation

Understanding which ML methods are used in lncRNA research offers several advantages:
- **Trend Analysis**: Recognizing the most popular ML approaches.
- **Gap Identification**: Spotting underexplored methodologies.

By automating the identification of ML methods, this approach saves time and ensures comprehensive coverage across a large body of literature.

---

### The Approach

Our methodology involves the following steps:
1. **Paper Collection**: Using the papers identified in Part 1, focusing on their full-text content or supplementary materials.
2. **Creating a Method List**: Compiling a comprehensive list of common ML techniques and patterns for detection.
3. **Building an EntityRuler**: Developing a rule-based NLP model using spaCy’s `EntityRuler` to match ML methods in text.
4. **Text Matching and Analysis**: Applying the model to identify ML methods across the collected papers.
5. **Visualization**: Summarizing the findings using interactive and static visualizations.

---

### Technical Walkthrough

#### 1. Paper Collection
We extracted the full-text content of the papers identified in Part 1 when:
- The url from Google scholar pointed directly to a file that could be downloaded
- The file was in the PDF format
- The file was in English

PDFs were converted to text using libraries like `PyPDF2`.  Using `langdetect` the language of the file was inspected, to ensure it is in English. 
Sections such as "Methods," "Results," and "Discussion" were prioritized for analysis. 
Other sections such as "References" and "Appendix" where ignored to speed up processing and avoid detracting from the focus of the paper.

#### 2. Creating a Method List
To identify ML methods, a list of 15 categories were defined for which associated ML methods were found.These include:

- **Regression Models**: Linear Regression, Polynomial Regression, Ridge Regression, etc.
- **Classification Models**: Support Vector Machines (SVM), Random Forest, Gradient Boosted Trees, etc.
- **Clustering Models**: k-Means Clustering, Hierarchical Clustering, Density-Based Spatial Clustering, etc.


This list was expanded through domain expertise and iterative refinement.

#### 3. Building an EntityRuler
Using spaCy, we developed an `EntityRuler` that matches ML methods in text based on:
- **Keywords**: Predefined terms e.g. "Support Vector Machines"
- **Patterns**: Variations of terms using case insensitivity, alternate words and regular expressions
- **Grouping of Patterns**: Multiple patterns can use the same value for their `id` field as a means of grouping them

An example of these rules created for Support Vector Machines is given below.

```
{'label': 'ML_METHOD', 'id': 'SUPPORT_VECTOR_MACHINES', 'pattern': [{'LOWER': 'support'}, {'LOWER': 'vector'}, {'LOWER': {'REGEX': 'machines?'}}]} ,

{'label': 'ML_METHOD', 'id': 'SUPPORT_VECTOR_MACHINES', 'pattern': 'SVM'} ,
```

The `EntityRuler` was tested and refined to maximize precision and recall.

#### 4. Text Matching and Analysis
The `EntityRuler` was applied to the text of the papers, identifying occurrences of ML methods. 
Each identified method was logged with its context for validation and further analysis.

#### 5. Visualization
Results were visualized at ML method and category level to highlight:
- **Frequency**: Bar charts of the most commonly mentioned terms.
![alt](./img/top_20_ml_methods.png)
- **Trends**: Time-series analysis of terms over publication years.
![alt](./img/top_20_ml_methods_trend.png)
- **Co-occurrence**: Network graphs showing relationships between terms.
![alt](./img/top_20_ml_methods_co-occurrence.png)
---

### Results

Our analysis revealed several key insights:
- **Popular Methods**: SVM and Random Forest emerged as the most frequently mentioned algorithms.
- **Emerging Techniques**: Deep learning frameworks like TensorFlow and PyTorch showed a sharp increase in recent years.
- **Method Trends**: Clustering and Dimensionality Reduction remain foundational techniques in lncRNA studies.

These findings not only provide an overview of current practices but also highlight shifts in methodological preferences over time.

---

### Insights and Observations

- **Adoption of Deep Learning**: The rapid adoption of deep learning frameworks indicates a shift toward more complex models.
- **Importance of Feature Selection**: Many papers emphasized feature selection methods, underscoring the high-dimensional nature of lncRNA datasets.
- **Collaboration Opportunities**: The co-occurrence network suggests interdisciplinary collaboration opportunities between ML specialists and lncRNA researchers.

---

### Conclusion

By identifying ML methods in lncRNA research, we gain a clearer understanding of the tools and techniques driving the field forward. This analysis not only highlights current trends but also provides a foundation for future exploration and innovation.

In the next part of this series, we will build on this work by creating a neural network model to enhance the identification of ML methods and compare its performance against rule-based approaches.

---

What are your thoughts on these findings? Are there additional ML methods you’d like us to explore? Let us know in the comments below!
