# Data Warehouse and Analytics Project

Welcome to the **Tokopedia Traffic to Revenue Diagnosis** repository! 🚀

This project implements a decision-grade data warehouse and analytics system designed to analyze how Tokopedia’s traffic sources convert into durable revenue and contribution margin.
It freezes real business data into an auditable truth model to answer one critical question:

> Which acquisition channels deserve capital and which silently destroy margin?

This repository is built as an operator- and investment-oriented portfolio project, demonstrating how data engineering, financial modeling, and analytical judgment combine to support real capital allocation decisions.

-- 

## 🚀 Project AArchitectury 

### Decision Objective

This warehouse exists to support capital allocation decisions.

> Which traffic channels generate repeat customers with positive contribution margin and which destroy cash?

The purpose of this system is not reporting.
It is to expose where money should be invested, fixed, or cut.

---

### Business Question

This project answers:

- Which channels create durable (repeat) revenue?
- Which channels have weak or negative contribution margin?
- Which channels appear to perform but actually destroy EBITDA?
- Where should acquisition budget be reallocated?

--- 

### Decision Outputs

This warehouse must produce: 
| Channel     | Revenue | Repeat Rate | Contribution Margin | Funnel Loss | Verdict            | 
| ----------- | ------- | ----------- | ------------------- | ----------- | ------------------ |
| Paid Social |         |             |                     |             | Kill / Fix / Scale |
| Organic     |         |             |                     |             | Scale              |
| Email       |         |             |                     |             | Scale              |
| Referral    |         |             |                     |             | Fix                |
| Direct      |         |             |                     |             | Scale              |

---

### Architecture Philosophy

This warehouse is decision-first, not tool-first.

- Architecture is designed only to freeze business truth required for capital decisions.
- ETL exists to protect and move truth — not to look impressive.
- All models exist to support money-flow diagnosis.

---

### Behavioral Diagnostics Layer

In addition to channel-level margin and capital allocation diagnosis, this warehouse includes a behavioral diagnostics layer that models session and event-level customer actions (view, add-to-cart, checkout, purchase) to explain why channels produce or destroy margin.

This layer does not replace economic decision logic.
It exists solely to expose conversion mechanics and friction points inside each acquisition channel.

---

### ETL Strategy

All raw data loaded via PostgreSQL COPY

Incremental loads used where possible

History preserved for customer behavior and pricing

Data quality checks on revenue, margin, and duplicates

---

### Decision Logic

Final verdict logic:

- Scale: High repeat + positive margin
- Fix: High volume + weak margin
- Kill: Low repeat + negative margin

---

### Outcome

This warehouse enables management to:

- Identify profitable acquisition engines
- Eliminate silent margin leakage
- Redirect capital toward durable growth

---

### Status

- Data ingestion
- Truth modeling
- Channel profitability diagnosis
- Final decision memo

---

## 🛡️ License

This project is released under the MIT License and may be freely used, modified, and redistributed with attribution.

---

## 🌟 About Me

Hi, im Raz,

I am building my career at the intersection of data engineering, financial logic, and operator decision systems.

My work focuses on freezing real business reality into decision-grade data structures that support capital allocation, margin optimization, and risk visibility — not just dashboards and reports.

This repository is part of a long-term effort to move from technical data roles into operator and investment-facing positions, where data is used to change outcomes, not simply describe them.

---
