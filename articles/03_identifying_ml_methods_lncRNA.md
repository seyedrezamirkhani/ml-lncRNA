## Identifying Machine Learning Methods in lncRNA Research

### Introduction

Long non-coding RNAs (lncRNAs) are critical players in biological processes, and their study has increasingly turned to machine learning (ML) for insights. Identifying the ML methods applied in lncRNA research can reveal valuable patterns, highlight methodological trends, and provide a foundation for future innovation.

In this third part of the series, **Exploring Machine Learning and lncRNA Research**, we focus on identifying specific ML methods used in published research papers. By using natural language processing (NLP) techniques to analyze the text of these papers, we uncover the range of ML methods applied in lncRNA studies.

You can find the complete project on GitHub, and the files related to this article are located in the subfolder [part-03-finding-ML-methods-with-rules](https://github.com/seyedrezamirkhani/ml-lncRNA/blob/main/src/notebooks/part-03-finding-ML-methods-with-rules/).

---

### Motivation

Understanding ML training methods and model architectures in lncRNA research offers several advantages:

- **Trend Analysis**: Identifying the most widely used ML approaches.
- **Gap Identification**: Detecting underexplored methodologies.
- **Efficiency**: Automating ML method identification saves time and ensures comprehensive literature coverage.

---

### Approach

Our methodology follows these key steps:

1. **Paper Collection**: Gathering full-text papers identified in Part 1.
2. **Creating an ML Term List**: Compiling common ML training methods and model architectures.
3. **Building an EntityRuler**: Developing a rule-based NLP model using spaCy.
4. **Text Matching & Analysis**: Identifying ML terms in papers.
5. **Visualization**: Presenting findings using interactive and static visualizations.

---

### Technical Walkthrough

#### 1. Paper Collection
We extracted full-text content from relevant papers identified in Part 1, prioritizing sections such as **Methods, Results, and Discussion** while excluding references and appendices. Papers were processed under the following criteria:

- Directly downloadable from Google Scholar.
- Available in PDF format.
- Written in English (verified using `langdetect`).

PDFs were converted to text using `PyPDF2` for analysis.

#### 2. Creating a ML Term List
Our ML term list distinguishes between **ML training methods** and **ML model architectures**:

- **ML Training Methods**: Define how models learn from data.
  - Supervised Learning (e.g., Regression, Classification)
  - Unsupervised Learning (e.g., Clustering, Dimensionality Reduction)
  - Self-Supervised Learning
  - Reinforcement Learning

- **ML Model Architectures**: Define model structure and data flow.
  - Feedforward Neural Networks (FNNs)
  - Convolutional Neural Networks (CNNs)
  - Recurrent Neural Networks (RNNs)
  - Transformer-based Models (e.g., BERT, GPT)

#### 3. Building an EntityRuler
Using **spaCy**, we developed an `EntityRuler` that matches ML terms in text based on:
- **Keywords**: Predefined terms e.g. "Support Vector Machines"
- **Patterns**: Variations of terms using case insensitivity, alternate words and regular expressions
- **Grouping of Patterns**: Multiple patterns can use the same value for their `id` field as a means of grouping them

An example of the rules created for Support Vector Machines is given below.

<div style="background-color: #f5f5f5; padding: 10px; border-radius: 5px; font-family: monospace;">
<pre>
patterns = [
    {
        <span style="color: #6BAED6;">'label'</span>: <span style="color: #2171B5;">'ML_TERM'</span>, 
        <span style="color: #6BAED6;">'id'</span>: <span style="color: #2171B5;">'SUPPORT_VECTOR_MACHINES'</span>, 
        <span style="color: #6BAED6;">'pattern'</span>: [
            {
                <span style="color: #6BAED6;">'LOWER'</span>: <span style="color: #2171B5;">'support'</span>
            }, 
            {
                <span style="color: #6BAED6;">'LOWER'</span>: <span style="color: #2171B5;">'vector'</span>
            }, 
            {
                <span style="color: #6BAED6;">'LOWER'</span>: {
                    <span style="color: #6BAED6;">'REGEX'</span>: <span style="color: #2171B5;">'machines?'</span>
                }
            }
        ]
    },
    {
        <span style="color: #6BAED6;">'label'</span>: <span style="color: #2171B5;">'ML_TERM'</span>, 
        <span style="color: #6BAED6;">'id'</span>: <span style="color: #2171B5;">'SUPPORT_VECTOR_MACHINES'</span>, 
        <span style="color: #6BAED6;">'pattern'</span>: <span style="color: #2171B5;">'SVM'</span>
    }, ...
]
</pre>
</div>

The patterns are added to an instance of an `EntityRuler` and saved to disk for re-use.

#### 4. Text Matching and Analysis
The `EntityRuler` was applied to the text of the papers, identifying occurrences of ML terms. 
Each identified term was logged with its context for validation and further analysis.

#### 5. Visualization
Results were visualized at term, training method and model architecture level to highlight:
- **Frequency**: Bar charts to show popularity.
![alt](./img/top_20_ml_term_paper_pct.png)
- **Trends**: Time-series analysis over publication years.
![alt](./img/top_20_ml_method_trend_2020.png)
- **Co-occurrence**: Network graphs showing relationships.
![alt](./img/co-occurrence_heatmap_ml_methods_and_models.png)
---

### Results

Our analysis revealed several key insights:
- **Popular Training Methods**: Unsupervised Learning and Supervised Learning emerged as the most frequently mentioned methods
- **Emerging Training Methods**: Self-Supervised Learning such as Contrastive Language-Image Pretraining (CLIP), showed a sharp increase in recent years.
- **Model Architecture Trends**: Tree-Based Ensemble Methods, Feedforward Neural Networks and Support Vector Methods remain foundational techniques in lncRNA studies.

These findings not only provide an overview of current practices but also highlight shifts in methodological preferences over time.

---

### Insights and Observations

- **Adoption of Deep Learning**: The rapid adoption of deep learning frameworks indicates a shift toward more complex models.
- **Importance of Feature Selection**: Many papers emphasized feature selection methods, underscoring the high-dimensional nature of lncRNA datasets.
- **Collaboration Opportunities**: The co-occurrence network suggests interdisciplinary collaboration opportunities between ML specialists and lncRNA researchers.

---

### Conclusion

By identifying ML terms in lncRNA research, we gain a clearer understanding of the tools and techniques driving the field forward. This analysis not only highlights current trends but also provides a foundation for future exploration and innovation.

In the next part of this series, we will build on this work by creating a neural network model to enhance the identification of ML terms and compare its performance against rule-based approaches.

---

What are your thoughts on these findings? Are there additional ML terms you’d like us to explore? Let us know in the comments below!
