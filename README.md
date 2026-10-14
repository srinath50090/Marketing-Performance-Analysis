# Marketing Performance Analytics

**SQL | PostgreSQL | Power BI | DAX | Marketing Analytics**

I built this end-to-end analytics project to investigate marketing campaign performance, identify budget inefficiencies, and translate data into actionable business recommendations.

Using PostgreSQL, I prepared and validated the data. Using Power BI, I developed interactive dashboards to analyze campaign returns, advertising costs, conversions, budget overspending, and product-level performance.

**My objective:** Go beyond reporting marketing metrics to understand what the results indicate, identify potential performance issues, and recommend actions that support better marketing decisions.

**[View Interactive Power BI Report](https://drive.google.com/file/d/1Bd3tRn5VSFx2AW_pYGCrlVxyytF7IUe_/view?usp=drive_link)**

---

## Project Overview

Marketing teams need to understand whether their advertising budget is generating sufficient returns. High clicks or conversion rates do not always mean that a campaign is profitable. Campaign performance also depends on acquisition costs, product value, campaign duration, attributed revenue, and budget allocation.

In this project, I used SQL and Power BI to investigate campaign efficiency and identify campaigns that may need budget monitoring, product-mix changes, or further performance testing.

The report contains three sections:

- **Overview:** Campaign returns, daily spend and revenue, and budget overspending.
- **Cost & Conversions:** Acquisition costs, click performance, advertised products, state response, and customer-segment response.
- **Recommendations:** Campaign observations and proposed actions based on the analysis.

## Business Problems

This project addresses the following marketing problems:

1. **Unclear campaign returns:** Which campaigns generate stronger or weaker returns on marketing spend?
2. **Budget overspending:** Which campaigns spend more than their allocated daily budget without sufficient returns?
3. **High acquisition costs:** Which campaigns have high CPC or CPA compared with their performance?
4. **Clicks not translating into returns:** Are reasonable CTR and click-to-conversion rates enough to produce good ROAS?
5. **Product mix affecting campaign results:** Are campaigns promoting products that fail to generate sufficient returns?
6. **Budget allocation decisions:** Which campaigns should be reviewed, tested with a lower budget, or considered for additional investment?
7. **Limited campaign duration:** Which campaign results need more time and data before a final decision is made?

## What I Did in This Project

- Used SQL to clean, standardize, transform, and validate marketing data.
- Built Power BI dashboards with DAX measures to evaluate campaign performance.
- Compared ROAS, ROI, CPC, CPA, CTR, and click-to-conversion rates to understand campaign efficiency.
- Identified campaigns with comparatively weaker returns and potential budget overspending.
- Investigated whether product mix and campaign duration could help explain performance differences.
- Developed data-driven recommendations for budget control, product selection, campaign monitoring, and further testing.

This project demonstrates my ability to combine technical skills, analytical thinking, and business understanding to investigate marketing problems.

---

## Dashboard Preview

### 1. Marketing Performance — Overview

![Marketing Performance Overview](Dashboard%20Images/01.png)

This page helps investigate:

- Which campaigns generate stronger returns relative to their spend?
- Which campaigns overspend their allocated budget?
- Are high-budget campaigns generating proportionally higher revenue?
- Which campaigns consume a high budget without sufficient revenue or return?

### 2. Filters and Campaign Details

![Marketing Filters](Dashboard%20Images/02.png)

![Campaign Metrics Table](Dashboard%20Images/03.png)

![Campaign Tooltip](Dashboard%20Images/04.png)

![Overspend Campaign Tooltip](Dashboard%20Images/05.png)

Filters and tooltips help investigate individual campaigns without displaying every metric in the main chart.

### 3. Cost & Conversions

![Cost and Conversions](Dashboard%20Images/06.png)

![Cost and Conversions — Date Filter](Dashboard%20Images/07.png)

This page compares CPC and CPA, CTR and click-to-conversion rate, advertised product value, state-level response, and customer-segment response.

### 4. Recommendations

![Marketing Recommendations](Dashboard%20Images/08.png)

![Marketing Recommendations — Details](Dashboard%20Images/09.png)

The Recommendations page connects campaign observations to proposed actions, including budget reductions for selected campaigns, continued monitoring where campaign periods are short, and possible budget reallocation after performance validation.

### 5. Power BI Data Model

![Power BI Data Model](Dashboard%20Images/10.png)

---

## Marketing KPI Definitions

| KPI | Definition |
|---|---|
| **ROAS (Return on Ad Spend)** | Marketing-attributed revenue ÷ marketing spend |
| **ROI (Return on Investment)** | Depends on the profit and cost components included in the calculation |
| **CPC (Cost Per Click)** | Marketing spend ÷ total clicks |
| **CPA (Cost Per Acquisition)** | Marketing spend ÷ total conversions |
| **CTR (Click-Through Rate)** | (Clicks ÷ impressions) × 100 |
| **Click-to-Conversion Rate** | (Total conversions ÷ total clicks) × 100 |

---

## Key Findings at a Glance

- **Underperforming campaigns:** Identified 12 campaigns with comparatively weaker returns that require further investigation and monitoring.
- **Budget control:** Identified 10 campaigns that exceeded their allocated budgets without sufficient returns.
- **Budget allocation opportunities:** Identified 10 campaigns for further testing based on observed performance patterns when budget increased.
- **Product mix:** Found indications that the value of advertised products may influence campaign returns, even when click and conversion metrics appear reasonable.
- **Campaign duration:** Recognized that short-running campaigns may need more data before making final decisions.

**Business takeaway:** Clicks and conversions alone do not establish campaign success. Marketing decisions should also consider attributed revenue, acquisition costs, product-level returns, budget limits, and the amount of performance data available.

*These are observations from synthetic data, not proof of causal relationships or guaranteed future outcomes.*

### 1. Twelve campaigns generated comparatively weaker returns

The analysis identified the following campaigns as spending significant marketing amounts while generating lower returns compared with other campaigns:

1. Revolutionize Integrated Partnerships
2. Enhance Best-Of-Breed Bandwidth
3. Deploy Extensible E-Tailers
4. Reinvent Leading-Edge Supply-Chains
5. Visualize Rich Action-Items
6. Transform Turn-Key Channels
7. Enable Turn-Key Niches
8. Incentivize Mission-Critical Applications
9. Morph World-Class Solutions
10. Incubate Back-End E-Business
11. Streamline Collaborative Functionalities
12. Drive Scalable Technologies

**Possible explanation:** Some of these campaigns advertised lower-value products while other campaigns advertised higher-value products. Even when CTR and click-to-conversion rates were reasonable, the product mix appeared to limit the return generated from ad spend. This is a hypothesis from the analysis and should be validated against reliable product-level revenue and cost data.

### 2. Campaign-level observations

- **Revolutionize Integrated Partnerships:** Every product promoted by this campaign was reported as generating negative ROI.
- **Enhance Best-Of-Breed Bandwidth:** The campaign spent about ₹25K per day. Among the valuable products reviewed, Galaxy S24 Ultra was the exception to the negative-ROI pattern. The campaign had run for only four days at the time of analysis.
- **Deploy Extensible E-Tailers:** The campaign had a good click-to-conversion rate, but every product it advertised was reported as generating a loss. It had run for 16 days.
- **Reinvent Leading-Edge Supply-Chains, Visualize Rich Action-Items, Incentivize Mission-Critical Applications, Morph World-Class Solutions, Incubate Back-End E-Business, and Streamline Collaborative Functionalities:** The valuable products reviewed for these campaigns were reported as generating losses, but the campaigns had run for less than two months.
- **Transform Turn-Key Channels and Enable Turn-Key Niches:** These campaigns promoted some valuable products but were reported as failing to convert those products into profit. Both had run for less than two months.
- **Drive Scalable Technologies:** This campaign spent about ₹20K per day and was reported as generating losses on every valuable product reviewed over the preceding three months.

### 3. Ten campaigns overspent their allocated budgets

1. Enhance Best-Of-Breed Bandwidth
2. Reinvent Leading-Edge Supply-Chains
3. Visualize Rich Action-Items
4. Enable Turn-Key Niches
5. Drive Scalable Technologies
6. Transition Scalable Platforms
7. Brand Impactful E-Services
8. Evolve Web-Enabled Networks
9. Utilize Innovative E-Tailers
10. Repurpose Magnetic E-Services

These campaigns warrant a review of daily spend against the allocated budget and the returns generated during the same period.

### 4. Ten campaigns appeared to perform slightly better when budget increased

1. Grow Sticky Methodologies
2. Scale Synergistic E-Business
3. Optimize Dynamic Initiatives
4. Reinvent Clicks-And-Mortar Functionalities
5. Orchestrate Next-Generation E-Tailers
6. Empower Extensible Models
7. Grow Cross-Media Markets
8. Whiteboard Sticky Channels
9. Enhance User-Centric Users
10. Matrix Front-End Web-Readiness

This pattern suggests campaigns for further testing, but it does not prove that increasing the budget caused better performance.

---

## Business Recommendations

### 1. Reduce budgets and monitor selected underperforming campaigns

- **Revolutionize Integrated Partnerships:** Test an 80% budget reduction for one month and advertise only the top 10 valuable products. If performance remains poor, consider stopping the campaign.
- **Enhance Best-Of-Breed Bandwidth:** Reduce spend on lower-value products and continue testing at a lower budget for two months. Four days of activity is too short for a firm conclusion. Reassess the Galaxy S24 Ultra finding alongside the overall product mix.
- **Deploy Extensible E-Tailers:** Continue for two months at a reduced budget, then reassess performance. The campaign's good click-to-conversion rate did not prevent the promoted products from generating losses in the analysis.
- **Reinvent Leading-Edge Supply-Chains, Visualize Rich Action-Items, Incentivize Mission-Critical Applications, Morph World-Class Solutions, Incubate Back-End E-Business, and Streamline Collaborative Functionalities:** Continue monitoring for two months at reduced budgets before making a final decision, because these campaigns had run for less than two months.
- **Transform Turn-Key Channels and Enable Turn-Key Niches:** Review product selection and conversion performance, and continue monitoring at a reduced budget before deciding whether to stop or change the campaigns.
- **Drive Scalable Technologies:** Test an 80–90% budget reduction. The campaign had spent around ₹20K per day and had continued to generate losses on the valuable products reviewed over three months.

### 2. Control budget overspending

For the ten campaigns listed in the overspending insight:

- Stop allocating additional budget beyond the planned allocation until performance has been reviewed.
- Limit spending to the allocated budget while collecting enough evidence to evaluate returns.
- Compare daily spend, attributed revenue, ROAS, and conversion performance over the same date range.

### 3. Reallocate budget cautiously

Consider testing a portion of the reduced budget on the ten campaigns that appeared to perform somewhat better when budget increased. Monitor results after the change and compare performance against a baseline. Do not assume that historical correlation guarantees future improvement.

### 4. Review product mix alongside campaign metrics

- Avoid judging campaign quality using CTR or click-to-conversion rate alone.
- Review which products are being advertised and whether their returns justify the acquisition cost.
- Test higher-value products only when the product-level evidence supports the decision.
- Use consistent campaign dates and clearly defined revenue and cost measures when comparing campaigns.

> **Recommendation disclaimer:** These actions reflect findings from the synthetic dataset. Budget changes such as an 80% or 90% reduction are proposed tests, not guaranteed outcomes or universal marketing rules.

---

## Skills Demonstrated

- **SQL:** PostgreSQL, DDL, CTEs, joins, views, data cleaning, date filtering, data quality checks, and duplicate detection.
- **Power BI:** DAX, KPI measures, Power Query, data modeling, interactive dashboards, data visualization, slicers, tooltips, and bookmarks.
- **Analytics:** Campaign performance, ROAS and ROI, acquisition costs, conversion analysis, budget monitoring, and product-level performance.
- **Business Skills:** KPI development, performance investigation, budget optimization recommendations, and decision support.

---

## Data Limitations

- This project uses synthetic data, so the findings may not represent actual business outcomes.
- Marketing-attributed revenue and profitability metrics depend on the available data and assumptions.
- Campaigns with short durations may not have enough data for reliable long-term conclusions.
- Observed relationships between budget and performance do not prove causation.
- The exact revenue attribution logic, ROI formula, and cost components should be verified in the Power BI model before using the findings for real budget decisions.

---

## Project Files

- **SQL scripts:**

[DDL's](SQL/01.DDL's.sql)

[Data Cleaning & Quality Checks](SQL/02.Data%20Cleaning%20%26%20Quality%20Checks.sql)

- **Power BI report:**

[Open or download the PBIX file](https://drive.google.com/file/d/1Bd3tRn5VSFx2AW_pYGCrlVxyytF7IUe_/view?usp=drive_link)


---

## 🤝 Open to Internship and Full-Time Opportunities

I am actively seeking **Data Analyst, BI Analyst, Reporting Analyst, Business Analyst, and other data-related internship or full-time opportunities**.

I am eager to contribute my SQL, Power BI, and analytical skills to a team, solve business problems using data, and continue learning through practical industry experience.

If you are hiring for an entry-level analytics role or would like to discuss my project, I would be happy to connect.

[Linkedin](https://www.linkedin.com/in/srinathvenkatachalam/)

[Github](https://github.com/srinath50090/)

[Email](srinath50090@gmail.com)


Thank you for taking the time to review my work.
