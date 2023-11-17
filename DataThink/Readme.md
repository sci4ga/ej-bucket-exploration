# Readme

## TOC

1. File Outline
2. Extent of Analysis

## File Outline

### Main Folder
The main folder hosts varying health datasets that have been sourced from [Oasis Goergia Portal](https://oasis.state.ga.us/PageDirectADRD.aspx?referer=ADRD). 

General demographic information such as race, poverty, and population statistics were sourced from [US Census](https://data.census.gov/table?t=Educational+Attainment&g=040XX00US13$0500000&y=2020).

Also includes the code (R Notebook) for the statistical analysis. 

### Health

Has the excel tables that were exported as CSV in the main folder.

### Figures

Figures from the Exploration along with some diagrams.

### Chem_Parse

Includes the code (Python Notebook) for building a graph database and parsing the Georgia Environmental Protection Divison's [Hazardous Site Inventory](https://epd.georgia.gov/about-us/land-protection-branch/hazardous-waste/hazardous-site-inventory) using optical chacter recognition. 

`Datathink_Neo4J_Docs.pdf` includes documentation for building the Graph Database, along with data sources. We keep this as a foundational building point for potential future projects. 

## Extent of Analysis

This project initially embarked on a journey to analyze health variables across different counties using difference in difference testing. Our primary objective was to discern significant health impacts associated with various environmental factors. However, this approach encountered a challenge as the results yielded little statistical significance, leading to a strategic pivot in our research direction.

We redirected our focus towards constructing a comprehensive and intricate database, which is the subject of this documentation. The database, titled "Georgia EPD Hazardous Waste Site to Chemical Relation Neo4j Database", is a powerful tool designed to map the intricate relationships between hazardous waste sites and associated chemicals within Georgia. This documentation elaborates on the process of building this database and provides a guide for users to navigate and utilize its extensive capabilities.

### Key Aspects of the Database

1. **Data Processing and Graph Creation:** 
   - The database construction involves preprocessing data and establishing connections between nodes, facilitating the integration of diverse information types, including metadata, chemical structures, and geographical data.

2. **Data Sources:**
   - Utilizes multiple data sources such as the EPD Hazardous Site Inventory, TOXRIC database, and HSDB from Pubchem (Not yet added, but can be in the future. We can use LLM to process it), ensuring a robust and comprehensive dataset.

3. **Accessing Data:**
   - Includes detailed instructions for using Neo4j's Cypher language to perform complex queries, enabling users to extract meaningful insights effectively.

4. **Updating Data:**
   - Provides a streamlined process for adding new nodes and edges, ensuring the database remains up-to-date and versatile.

### Project Significance

The pivot from difference in difference testing to database construction represents a significant shift in our approach to understanding environmental health impacts. By creating a dynamic and adaptable database, we are now positioned to better analyze the relationships between hazardous waste sites and chemical exposures, offering a more nuanced and comprehensive understanding of environmental health risks.

This documentation, authored by Ken Nakatsu in November 2023, serves as a comprehensive guide for utilizing and contributing to this valuable resource.
