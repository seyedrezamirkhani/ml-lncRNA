## Identifying Machine Learning Methods in lncRNA Research

### Introduction

Long non-coding RNAs (lncRNAs) are critical players in biological processes, and their study has increasingly turned to machine learning (ML) for insights. Identifying the ML methods applied in lncRNA research can reveal valuable patterns, highlight methodological trends, and provide a foundation for future innovation.

In this third part of the series, **Exploring Machine Learning and lncRNA Research**, we focus on identifying specific ML methods used in published research papers. By using natural language processing (NLP) techniques to analyze the text of these papers, we uncover the range of ML methods applied in lncRNA studies.

You can find the complete project on GitHub, and the files related to this article are located in the subfolder [part-03-finding-ML-methods-with-rules](https://github.com/seyedrezamirkhani/ml-lncRNA/blob/main/src/notebooks/part-03-finding-ML-methods-with-rules/).

---

### The Motivation

Understanding which ML training methods and model architectures are used in lncRNA research offers several advantages:
- **Trend Analysis**: Recognizing the most popular ML approaches.
- **Gap Identification**: Spotting underexplored methodologies.

By automating the identification of ML training methods and model architectures, it saves time and ensures comprehensive coverage across a large body of literature.

---

### The Approach

Our methodology involves the following steps:
1. **Paper Collection**: Using the papers identified in Part 1, focusing on their full-text content or supplementary materials.
2. **Creating a ML Term List**: Compiling a comprehensive list of common ML methods and models for detection.
3. **Building an EntityRuler**: Developing a rule-based NLP model using spaCy’s `EntityRuler` to match ML terms in text.
4. **Text Matching and Analysis**: Applying the model to identify ML terms across the collected papers.
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

#### 2. Creating a ML Term List
Our ML Term List can be divided into ML training methods and ML model architectures.
The difference between a Machine Learning (ML) Method and an ML Model lies in their scope and role in the ML pipeline.

##### 1. ML Training Method
An ML training method refers to the algorithmic approach or technique used to train a model. It defines how the data is processed, patterns are learned, and predictions are made. They are:

  - Supervised Learning (e.g., Regression, Classification)
  - Unsupervised Learning (e.g., Clustering, Dimensionality Reduction)
  - Self-Supervised Learning
  - Reinforcement Learning

##### 2. ML Model Architecture

  A model architecture refers to the structural design of a machine learning model, defining how data flows through it and how computations are performed. It includes the organization and configuration of layers, nodes, and connections within the model, which ultimately determine how the model learns patterns from data. For example:

  - Feedforward Neural Networks (FNNs) – Simple networks where data flows in one direction.
  - Convolutional Neural Networks (CNNs) – Used for image processing, consisting of convolutional and pooling layers.
  - Recurrent Neural Networks (RNNs) – Designed for sequential data, using recurrent connections to maintain temporal dependencies.
  - Transformer-based Models – Advanced architectures (e.g., BERT, GPT) using attention mechanisms for NLP tasks.


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
