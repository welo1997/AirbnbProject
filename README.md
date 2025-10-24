🏠 Airbnb Business Strategy Analysis (Prague)

This project is a comprehensive data analysis study designed to provide actionable strategic insights for prospective Airbnb hosts. Utilizing real-world data from Prague, the analysis answers critical business questions regarding pricing, location, capacity, and market demand.

***

## 🎯 Project Purpose

The core purpose of this project is to guide a new Airbnb business owner by answering key strategic questions:

* **Location:** Where should the Airbnb be situated for maximum popularity and demand?
* **Pricing:** What is the optimal nightly charge relative to capacity and minimum stay?
* **Capacity:** How many guests should the accommodation be designed for?
* **Stay Length:** What is the most profitable and popular minimum length of stay?

***

## 🛠️ Tools and Technologies

| Category | Tool | Purpose |
| :--- | :--- | :--- |
| **Data Cleaning** | **Microsoft Excel** | Initial column removal, data reformatting, null value handling, and ID re-assignment for MySQL compatibility. |
| **Data Querying** | **MySQL** | Advanced trend analysis, data aggregation, and identification/removal of inaccurate data points. |
| **Visualization** | **Tableau Public** | Creating interactive dashboards, geographic maps, and charts to present final insights. |
| **Data Source** | **Inside Airbnb** | Used the latest Detailed Listing Data (scraped March 16, 2025) and a GeoJSON file. |

***

## 🧹 Data Acquisition and Preparation

### Data Source

The primary data source was the Detailed Listing Data from **insideairbnb.com**, specific to the city of Prague. A corresponding GeoJSON file was also downloaded for geographical visualization.

### Cleaning Workflow

The majority of data preparation was executed in **Excel** to handle large-scale structural changes before loading into the database:

* **Structural Cleanup:** Removed unnecessary columns and rows containing empty cells or null values.
* **Reformatting:** Reformatted specific data types to ensure proper interpretation by MySQL.
* **ID Standardization:** Assigned a new range of standardized numeric IDs to the listings, as the original ID numbers were too large for reliable MySQL interpretation.

## 🔍 Trend Analysis with SQL

The cleaned data was imported into **MySQL** where complex queries were executed to uncover market trends.

* **Popularity Metric:** The `number_of_reviews` column was a key feature used to determine listing popularity.
* **Relationship Analysis:** Queries analyzed the relationships between popularity, location, accommodation size, minimum nights stay, and price.
* **Quality Control:** SQL was used to query for and remove outlying or inaccurate data that would negatively impact the final visualizations.

*The full SQL file, containing all queries used for trend analysis and data verification, is included in this repository.*

## 🗺️ Visualization and Key Takeaways

The final data table was exported from MySQL and loaded into **Tableau Public** along with the GeoJSON file. An **Inner Join** was performed on the two files to enable map creation and comprehensive visualization.

The final Tableau dashboard reveals the following critical strategic insights for the Prague market:

| Insight Category | Key Finding |
| :--- | :--- |
| **Location & Popularity** | The most popular neighborhoods are **Praha 1** and **Praha 2**. |
| **Pricing vs. Popularity** | The most popular neighborhoods tend to also be the most expensive. |
| **Capacity & Demand** | Accommodations for **2-3 people** are the most popular, though listings for 4-5 people command the highest price. |
| **Minimum Stay** | The price per night tends to be **cheaper** for listings that require a longer minimum stay. |
| **Least Profitable** | Accommodation designed for **1 person** has the lowest demand and yields the lowest income. |

---

*The link to the Tableau Public dashboard is provided within the project documentation.*
