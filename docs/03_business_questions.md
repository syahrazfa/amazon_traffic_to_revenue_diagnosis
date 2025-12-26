## Capital Allocation Business Questions

This system exists to diagnose margin survival and capital allocation across Amazon product families.

It is not a reporting warehouse.
It is a capital control system.

All Gold-layer models exist to answer the following decision questions:

---

##Primary Capital Questions

### 1. Which product families destroy margin?

Purpose:
Identify categories where discounting structurally erodes contribution margin.

Output:
gold.margin_destroyer

Decision:
Kill, reprice, or liquidate.

---

### 2. Which product families deserve to scale?

Purpose:
Find product families that survive discounting while maintaining margin and trust leverage.

Output:
gold.capital_verdict

Decision:
Increase acquisition budget and inventory depth.

---

### 3. Are discounts killing margin?

Purpose:
Detect whether discount intensity correlates with margin loss.

Output:
gold.elastic_signal

Decision:
Redesign pricing mechanics or reduce promotional exposure.

---

### 4. Which families show fake growth?

Purpose:
Expose families that generate high sales volume but destroy capital through weak margin mechanics.

Output:
gold.margin_destroyer

Decision:
Freeze expansion or begin exit planning.

---

### 5. Which categories convert without heavy discounting?

Purpose:
Identify organic winners that do not require margin sacrifice.

Output:
gold.elastic_signal

Decision:
Protect and prioritize.

---

### 6. Does trust depth protect margin?

Purpose:
Test whether rating volume mitigates the margin impact of discounting.

Output:
gold.elastic_signal

Decision:
Invest in reputation growth vs price warfare.

---

### 7. Where should acquisition capital be cut?

Purpose:
Locate structurally unprofitable families regardless of sales volume.

Output:
gold.capital_verdict

Decision:
Terminate acquisition channels.

---

### 8. Where should capital be reallocated?

Purpose:
Redirect spend into durable profit engines.

Output:
gold.capital_verdict

Decision:
Rebalance portfolio mix.

---

## Why These Questions Matter

Without answering these questions:

- Discounting hides capital bleed
- Volume lies about profitability
- Growth becomes fake
- EBITDA erodes silently

This warehouse prevents margin destruction masquerading as growth.
