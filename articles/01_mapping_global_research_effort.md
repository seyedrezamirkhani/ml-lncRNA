## Mapping the Global Research Effort

### Introduction

Long non-coding RNAs (lncRNAs) are emerging as key players in understanding complex biological processes and diseases. The study of lncRNAs has garnered global interest, with researchers from various institutions contributing to this rapidly growing field. But where are these researchers located, and how do their efforts cluster geographically? 

This post is the first in a four-part series on **Exploring Machine Learning and lncRNA Research**. In this series, we delve into various aspects of using machine learning to understand lncRNA studies:
1. Mapping the global research landscape (this article).
2. Exploring thematic similarities in research through text analysis.
3. Identifying machine learning methods in lncRNA studies.
4. Building a robust machine learning extractor for domain-specific knowledge.

In this post, I’ll take you through the first part of my project: mapping the global research landscape of lncRNA studies that leverage machine learning (ML). Using tools like Google Scholar, Named Entity Recognition (NER), and geolocation mapping, we uncover the geographic distribution of research efforts. By visualizing this data on an interactive map, we gain valuable insights into the global hubs of lncRNA research.

You can find the complete project on [GitHub](https://github.com/seyedrezamirkhani/ml-lncRNA), and the files related to this article are located in the [part-01 repository](https://github.com/seyedrezamirkhani/ml-lncRNA/tree/main/src/notebooks/part-01-where-are-the-authors).

---

### The Motivation

Scientific research is a collaborative effort often influenced by geography. By understanding where research on lncRNA and ML is being conducted, we can:
- Identify key research hubs and emerging regions.
- Highlight potential areas for collaboration.
- Provide a clearer picture of the global effort driving progress in this field.

Mapping this research landscape is the first step toward achieving these goals.

---

### The Approach

To map the geographic distribution of lncRNA research, we:
1. **Search Google Scholar**: Queried for papers matching the search term "Machine Learning lncRNA" to identify relevant studies.
2. **Extract Author Affiliations**: Used Named Entity Recognition (NER) to extract organizational affiliations from author metadata.
3. **Geolocate Organizations**: Leveraged Nominatim from the `geopy.geocoders` package to find the geolocation of these organizations.
4. **Visualize on a Map**: Used the Folium library to create an interactive map of the identified research hubs.

---

### Technical Walkthrough

#### 1. Searching Google Scholar
The first step was to identify relevant research papers. Google Scholar’s search capabilities were accessed using the `scholarly` Python package, which enabled automated retrieval of metadata such as titles, abstracts, authors, and affiliations for papers matching the query “Machine Learning lncRNA.”

#### 2. Extracting Author Affiliations
Author affiliations, often embedded in text, were extracted using Named Entity Recognition (NER). This method identifies organization names from the author metadata. The NER process was implemented using the spaCy library, which has robust models for identifying entities like organizations and locations.

#### 3. Geolocating Organizations
Once organizations were identified, the next step was to pinpoint their geographic locations. The Nominatim geocoding service, available via the `geopy` library, was used to convert organization names into latitude and longitude coordinates.

#### 4. Visualizing with Folium
Finally, these coordinates were plotted on an interactive map using the Folium library. Each marker on the map represents a research institution, and additional information—such as the number of papers from each institution—can be included in the tooltip for richer context.

---

### Results

The resulting map reveals:
- **Major Research Hubs**: Clusters of activity in countries like the United States, China, and Germany.
- **Emerging Regions**: Contributions from institutions in regions such as South America, Southeast Asia, and Africa.
- **Global Collaboration**: A clear indication that lncRNA research is a worldwide effort, with many institutions collaborating across borders.

This interactive visualization provides a bird’s-eye view of the global effort to understand lncRNAs using machine learning.

---

### Insights and Observations

- **Concentration of Efforts**: The map highlights a concentration of research activity in well-funded institutions, particularly in North America and Europe.
- **Emerging Players**: Several institutions from developing countries are making significant contributions, signaling a global democratization of scientific research.
- **Opportunities for Collaboration**: Identifying regions with less activity can help guide future collaborative efforts to strengthen global research networks.

---

### Conclusion

By combining tools like NER, geolocation, and interactive mapping, we can uncover valuable insights into the global distribution of lncRNA research. This analysis not only highlights where the research is happening but also serves as a stepping stone for fostering collaboration and expanding research efforts.

In the next part of this series, we’ll dive into the abstracts of these papers to understand the thematic similarities between them using text similarity techniques and visualization tools.

---

What do you think about these findings? Are there other ways we can explore the global research landscape? Share your thoughts in the comments below!
