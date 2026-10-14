# Marketing Performance Analysis

### SQL \| PostgreSQL \| Power BI \| Marketing Analytics

An end-to-end marketing analytics project built to evaluate campaign
performance, advertising costs, conversions, budget overspending, and
return on marketing spend. The project uses SQL to prepare and validate
marketing data and Power BI to turn the analysis into an interactive
dashboard with business insights and recommendations.

------------------------------------------------------------------------

## Project Overview

Marketing teams need to understand whether their advertising budget is
generating sufficient returns. High clicks or conversion rates do not
always mean that a campaign is profitable. Campaign performance also
depends on acquisition costs, product value, campaign duration,
attributed revenue, and budget allocation.

In this project, I used SQL and Power BI to investigate campaign
efficiency and identify campaigns that may need budget monitoring,
product-mix changes, or further performance testing.

The report contains three sections:

-   **Overview** --- campaign return, daily spend and revenue, and
    budget overspending.
-   **Cost & Conversions** --- acquisition costs, click performance,
    advertised products, state response, and customer-segment response.
-   **Recommendations** --- campaign observations and proposed actions
    based on the analysis.

## Business Problems

This project addresses the following marketing problems:

1.  **Unclear campaign returns:** Which campaigns generate stronger or
    weaker return on marketing spend?
2.  **Budget overspending:** Which campaigns spend more than their
    allocated daily budget without sufficient returns?
3.  **High acquisition costs:** Which campaigns have high CPC or CPA
    compared with their performance?
4.  **Clicks not translating into returns:** Are reasonable CTR and
    click-to-conversion rates enough to produce good ROAS?
5.  **Product mix affecting campaign results:** Are campaigns promoting
    products that fail to generate sufficient return?
6.  **Budget allocation decisions:** Which campaigns should be reviewed,
    tested with a lower budget, or considered for additional investment?
7.  **Limited campaign duration:** Which campaign results need more time
    and data before a final decision is made?

------------------------------------------------------------------------



## Dashboard Preview

[Download Power BI file from Google drive](https://drive.google.com/file/d/1Bd3tRn5VSFx2AW_pYGCrlVxyytF7IUe_/view?usp=drive_link)

### 1. Marketing Performance - Overview

![Marketing Performance Overview](01.png)


**The Scatter plot can solve :**

- Where is marketing budget being wasted?        
- Which campaign spent less, but generating high revenue?


**Line and column chart can solve :**

- Which campaigns are overspending their allocated budget?
- Are high-budget campaigns generating proportionally higher revenue?
- Which campaigns are consuming the most budget without generating sufficient revenue or return?


**Table visual can solve :**

- Which campaign generate high revenue with low spend?
- Which campaign generate high ROI with low CPC & CPA?
- Which campaign have less click conversion rate, but high returns?
- Which campaigns generate high revenue but have low ROAS?
- Which campaigns are consuming a high budget but generating low revenue?
- Which campaigns generate high traffic but failed to convert?




### 2. Filters and Campaign Details

![Marketing Filters](02.png)

![Campaign Metrics Table](03.png)

![Campaign Tooltip](04.png)

![Overspend Campaign
Tooltip](05.png)

Filters and tooltips help investigate individual campaigns without
displaying every metric in the main chart.

### 3. Cost & Conversions

![Cost and Conversions](06.png)

![Cost and Conversions --- Date
Filter](07.png)

This page compares CPC and CPA, CTR and click-to-conversion rate,
advertised product value, state-level response, and the customer
segments represented in the campaign view. These are used as
marketing-response breakdowns



### 4. Recommendations

![Marketing Recommendations](08.png)

![Marketing Recommendations ---
Details](09.png)

The Recommendations page connects the campaign observations to proposed
actions, including budget reductions for selected campaigns, continued
monitoring where the campaign period is short, and possible budget
reallocation after performance validation.

### 5. Power BI Data Model

![Power BI Data Model](10.png)

------------------------------------------------------------------------
## Marketing KPI Definitions
  -----------------------------------------------------------------------

- ROAS ( Return on Ad Spend )   = Marketing Revenue ÷ Marketing Spend
- ROI ( Return on Investment )  = ( Net Profit - Marketing Spend ) ÷ Marketing Spend x 100
- CPC ( Cost Per Click )        = Marketing Spend ÷ Total Clicks
- CPA ( Cost Per Acquisition )  = Marketing Spend ÷ Total Conversions
- CTR ( Click-Through Rate )    = ( Clicks ÷ Impressions ) x 100
- Click Conversion Rate         = ( Total Conversions ÷ Total Clicks ) x 100

  -----------------------------------------------------------------------

The exact DAX formulas and attribution logic should be reviewed in the
PBIX file. ROAS and ROI are not interchangeable: ROAS compares
attributed revenue with advertising spend, while ROI depends on which
additional costs are included.

------------------------------------------------------------------------

## Key Insights Found


### 1. Twelve campaigns generated comparatively weaker returns

The analysis identified these 12 campaigns as spending significant
marketing amounts while generating lower returns compared with other
campaigns:

1.  Revolutionize Integrated Partnerships
2.  Enhance Best-Of-Breed Bandwidth
3.  Deploy Extensible E-Tailers
4.  Reinvent Leading-Edge Supply-Chains
5.  Visualize Rich Action-Items
6.  Transform Turn-Key Channels
7.  Enable Turn-Key Niches
8.  Incentivize Mission-Critical Applications
9.  Morph World-Class Solutions
10. Incubate Back-End E-Business
11. Streamline Collaborative Functionalities
12. Drive Scalable Technologies

**Possible reason identified in the analysis:** Some of these campaigns
advertised lower-value products while other campaigns advertised
higher-value products. Even when CTR and click-to-conversion rates were
reasonable, the product mix appeared to limit the return generated from
ad spend.

### 2. Campaign-level observations

-   **Revolutionize Integrated Partnerships:** Every product promoted by
    this campaign was reported as generating negative ROI.
-   **Enhance Best-Of-Breed Bandwidth:** The campaign spent about ₹25K
    per day. Among the valuable products reviewed, Galaxy S24 Ultra was
    the exception to the negative-ROI pattern. The campaign had run for
    only four days at the time of analysis.
-   **Deploy Extensible E-Tailers:** The campaign had a good
    click-to-conversion rate, but every product it advertised was
    reported as generating a loss. It had run for 16 days.
-   **Reinvent Leading-Edge Supply-Chains, Visualize Rich Action-Items,
    Incentivize Mission-Critical Applications, Morph World-Class
    Solutions, Incubate Back-End E-Business, and Streamline
    Collaborative Functionalities:** The valuable products reviewed for
    these campaigns were reported as generating losses, but the
    campaigns had run for less than two months.
-   **Transform Turn-Key Channels and Enable Turn-Key Niches:** These
    campaigns promoted some valuable products but were reported as
    failing to convert those products into profit. Both had run for less
    than two months.
-   **Drive Scalable Technologies:** This campaign spent about ₹20K per
    day and was reported as generating losses on every valuable product
    reviewed over the preceding three months.

### 3. Ten campaigns overspent their allocated budgets

The analysis identified the following campaigns as overspending their
allocated budgets without sufficient returns:

1.  Enhance Best-Of-Breed Bandwidth
2.  Reinvent Leading-Edge Supply-Chains
3.  Visualize Rich Action-Items
4.  Enable Turn-Key Niches
5.  Drive Scalable Technologies
6.  Transition Scalable Platforms
7.  Brand Impactful E-Services
8.  Evolve Web-Enabled Networks
9.  Utilize Innovative E-Tailers
10. Repurpose Magnetic E-Services

These campaigns warrant a review of daily spend against the allocated
budget and the returns generated during the same period.

### 4. Ten campaigns appeared to perform slightly better when budget increased

The following campaigns were identified as showing somewhat better
performance when additional budget was allocated:

1.  Grow Sticky Methodologies
2.  Scale Synergistic E-Business
3.  Optimize Dynamic Initiatives
4.  Reinvent Clicks-And-Mortar Functionalities
5.  Orchestrate Next-Generation E-Tailers
6.  Empower Extensible Models
7.  Grow Cross-Media Markets
8.  Whiteboard Sticky Channels
9.  Enhance User-Centric Users
10. Matrix Front-End Web-Readiness

This pattern suggests campaigns for further testing, but it does not
prove that increasing the budget caused better performance.

------------------------------------------------------------------------

## Business Recommendations

### 1. Reduce budget and monitor selected underperforming campaigns

-   **Revolutionize Integrated Partnerships:** Reduce the budget by 80%.
    For the next month, advertise only the top 10 valuable products. If
    performance remains poor, consider stopping the campaign.
-   **Enhance Best-Of-Breed Bandwidth:** Reduce spend on lower-value
    products and continue testing at a lower budget for two months. The
    campaign had run for only four days, which was too short for a firm
    conclusion. Keep the Galaxy S24 Ultra finding in mind when reviewing
    the product mix.
-   **Deploy Extensible E-Tailers:** Continue for two months at a
    reduced budget, then reassess performance. The campaign's good
    click-to-conversion rate did not prevent the promoted products from
    generating losses in the analysis.
-   **Reinvent Leading-Edge Supply-Chains, Visualize Rich Action-Items,
    Incentivize Mission-Critical Applications, Morph World-Class
    Solutions, Incubate Back-End E-Business, and Streamline
    Collaborative Functionalities:** Continue monitoring for two months
    at reduced budgets before making a final decision, because these
    campaigns had run for less than two months.
-   **Transform Turn-Key Channels and Enable Turn-Key Niches:** Review
    product selection and conversion performance, and continue
    monitoring at a reduced budget before deciding whether to stop or
    change the campaigns.
-   **Drive Scalable Technologies:** Reduce the budget by 80--90%. The
    campaign had spent around ₹20K per day and had continued to generate
    losses on the valuable products reviewed over three months.

### 2. Control budget overspending

For the ten campaigns listed in the overspending insight: - Stop
allocating additional budget beyond the planned allocation until the
campaign performance has been reviewed. - Limit spending to the
allocated budget while collecting enough evidence to evaluate returns. -
Compare daily spend, attributed revenue, ROAS, and conversion
performance over the same date range.

### 3. Reallocate budget cautiously

Consider testing a portion of the reduced budget on the ten campaigns
that appeared to perform somewhat better when budget increased. Monitor
results after the change and compare performance against a baseline. Do
not assume that historical correlation guarantees future improvement.

### 4. Review product mix alongside campaign metrics

-   Avoid judging campaign quality using CTR or click-to-conversion rate
    alone.
-   Review which products are being advertised and whether their returns
    justify the acquisition cost.
-   Test higher-value products only when the product-level evidence
    supports the decision.
-   Use consistent campaign dates and clearly defined revenue and cost
    measures when comparing campaigns.

> **Recommendation disclaimer:** These actions reflect the findings
> recorded from the synthetic dataset. Budget changes such as an 80% or
> 90% reduction are proposed tests, not guaranteed outcomes or universal
> marketing rules.


> **Data Disclaimer:** This project uses synthetic data.
> Marketing-attributed revenue and profitability metrics are based on
> the **available data** and stated assumptions. Results may differ from
> actual business performance.

------------------------------------------------------------------------

## Repository Structure

``` text
ecommerce-marketing-performance-analytics/
├── README.md
├── sql/
│   ├── 01.DDL's.sql
│   └── 02.Data Cleaning & Quality Checks.sql
├── powerbi/
│   └── Marketing_Performance_Analytics.pbix
└── screenshots/
    ├── marketing-overview.png
    ├── marketing-filters.png
    ├── campaign-metrics-table.png
    ├── marketing-campaign-tooltip.png
    ├── overspend-campaign-tooltip.png
    ├── cost-conversions.png
    ├── cost-conversions-date-filter.png
    ├── recommendations.png
    ├── recommendations-details.png
    └── powerbi-data-model.png
```

-----------------------------------------------------------------------------------
## Skills Applied
**Technical Skills**

- **SQL:** PostgreSQL, DDL, CTEs, Joins, Views, Data Cleaning, Date Filtering, Data Quality Checks, Duplicate Detection.
- **Power BI:** DAX, KPI Measures, Power Query, Data Modeling, Interactive Dashboards, Data Visualization, Slicers, Tooltips, Bookmarks

**Analytical Skills**
- Marketing Campaign Performance Analysis
- ROAS & Marketing ROI Analysis
- CPC, CPA, CTR & Conversion Rate Analysis
- Budget Overspending Analysis
- Product-Level Performance Analysis

**Business Skills**
- Marketing KPI Development
- Campaign Budget Optimization
- Data-Driven Recommendations
- Performance Monitoring & Decision Support

**Other Skills**
- Analytical Thinking
- Problem Solving
- Critical Thinking



[Download Power BI file to get interactive insights](https://drive.google.com/file/d/1Bd3tRn5VSFx2AW_pYGCrlVxyytF7IUe_/view?usp=drive_link)


---------------------------------------------------------------------------------------

## 🤝 Open to Opportunities

I am currently looking for **Data Analyst, Business Analyst, BI Analyst, Reporting Analyst, or other data-related internship and full-time opportunities**.

If you have an opportunity, feedback on my project, or would like to connect, feel free to reach out.

[LinkedIn](https://www.linkedin.com/in/srinathvenkatachalam/)

[Github](https://github.com/srinath50090/)

Email : srinath50090@gmail.com


I would love to learn, contribute to a team, and apply my analytical skills to real-world business problems.



