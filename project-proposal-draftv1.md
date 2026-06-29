## 1. Source and Licence

This dataset was published by the Open Data Portal of the City of Munich. It is available as *Monatszahlen Verkehrsunfälle* and can be downloaded in CSV format; the portal also provides other formats such as XML and JSON. The data is released under the Datenlizenz Deutschland Namensnennung 2.0 (dl-by-de), which allows reuse as long as the source is credited.


## 2. What Is in It

The dataset contains 2450 rows and 10 columns. Each row represents one monthly record for a specific traffic accident category in Munich. The table includes the year and month of the observation, the recorded value, and additional indicators such as previous-year values and percentage changes over time. The main variables are `_id`, `MONATSZAHL`, `AUSPRAEGUNG`, `JAHR`, `MONAT`, `WERT`, `VORJAHRESWERT`, `VERAEND_VORMONAT_PROZENT`, `VERAEND_VORJAHRESMONAT_PROZENT`, and `ZWOELF_MONATE_MITTELWERT`.


## 3. Research Questions

### Descriptive
**How have monthly traffic accident counts in Munich developed over time?**

This is a descriptive question because it focuses on summarizing and visualizing long-term developments in the monthly accident data.

### Exploratory
**How do alcohol-related accidents vary over the course of the year? Are there seasonal patterns, and how does their share of all traffic accidents change across months?**

This is mainly an exploratory question because it looks for recurring patterns and possible seasonal structure in alcohol-related accidents. It also has a descriptive component because it examines the monthly share of alcohol-related accidents relative to total traffic accidents.

### Predictive
**Can the number of traffic accidents in the following month be predicted using a simple regression model that accounts for long-term trend and seasonality?**

This question aims to evaluate whether a basic predictive model can capture the temporal structure of the data well enough to generate short-term forecasts.


## 4. Context and Target Audience

The project is situated in a public policy and urban planning context. The target audience includes local policymakers, city administrators, urban mobility planners, and road safety stakeholders in Munich. For this audience, suitable presentation formats include concise reports, policy briefs, slide presentations, dashboards, and clear visualizations such as time series plots, seasonal comparisons, and simple forecasts.