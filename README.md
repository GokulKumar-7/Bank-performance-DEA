# Bank Performance Analysis — DEA & Malmquist Productivity Index
A comprehensive efficiency and productivity analysis of 20 major Indian commercial banks before and after COVID-19 using Data Envelopment Analysis (DEA) and the Malmquist Productivity Index (MPI) — with actionable managerial recommendations using R.

## Problem Statement
The COVID-19 pandemic caused India's GDP to contract by 24.4%, forcing banks to rapidly adapt under new RBI regulatory measures including loan moratoriums and relaxed NPA classification rules. This project analyses how 20 NSE-listed Indian commercial banks performed across two distinct periods — pre-pandemic (FY 2018–2020) and post-pandemic (FY 2021–2023) — to identify which banks improved, which declined, and what strategies differentiate high-performing institutions.

## Dataset
- **Source:** [Screener.in](https://www.screener.in) — aggregates audited financial statements and NSE exchange filings for Indian listed companies
- **Scope:** 20 Indian commercial banks (FY 2018–2023), covering 6 financial variables across 3 inputs and 3 outputs

| Category | Variable | Description |
|----------|----------|-------------|
| **Input** | Total Assets | Total financial resources under the bank's control |
| **Input** | Operating Expenses | Administrative and running costs |
| **Input** | Total Deposits | Customer funds used for lending and investment |
| **Output** | Net Profit | Net earnings after all expenses |
| **Output** | Interest Income | Revenue from loans and interest-bearing assets |
| **Output** | Investment | Capital allocated to financial instruments |

## Key Analyses

### 1. VRS Efficiency Analysis (BCC-DEA)
- The **input-oriented BCC model** (Variable Returns to Scale) was used over CRS to account for the different operational scales of Indian banks
- VRS isolates **managerial inefficiency** from **scale inefficiency** — critical when comparing small finance banks to large public sector banks
- **Axis Bank** (0.947 → 1.000), **Bank of Baroda** (0.975 → 1.000), and **Union Bank** (0.970 → 1.000) showed the most notable efficiency gains post-pandemic
- **Bank of Maharashtra** (1.000 → 0.940) and **Karur Vysya** (0.965 → 0.910) were the only banks to decline
- 14 out of 20 banks maintained or achieved full efficiency (score = 1.000) in the post-pandemic period

### 2. Malmquist Productivity Index (MPI)
Productivity decomposed into two components:
- **Efficiency Change (EC):** catching up to the best-practice frontier — operational improvement
- **Technical Change (TC):** shifts in the frontier itself — innovation and system-wide progress

| Segment | Banks | Key Finding |
|---------|-------|-------------|
| Top improvers | Karur Vysya (+12.95%), Axis (+11.54%), South Indian (+8.22%), ICICI (+7.57%) | Strong gains in both EC and TC |
| Moderate decline | Union Bank (−5.96%), Bank of Maharashtra (−8.36%), Kotak Mahindra (−13.68%) | Operational inefficiencies post-recovery |
| Significant decline | IDBI (−41.00%), Yes Bank (−40.10%), City Union (−38.69%), SBI (−28.95%) | Structural productivity losses |

### 3. Efficiency Change (EC) — Operational Performance
- **Highest gainers:** Axis (+28.65%), Karur Vysya (+25.42%), ICICI (+24.33%), South Indian (+17.18%)
- **Moderate progress:** Union Bank (+7.54%), Bandhan (+6.36%), HDFC (+3.82%)
- **Declined:** Equitas (−14.84%), Kotak Mahindra (−13.83%), IndusInd (−6.03%), Yes Bank (−4.02%), SBI (−3.30%)

### 4. Technical Change (TC) — Innovation & Frontier Shift
- **Progressed:** Karur Vysya (+2.88%), UCO Bank (+2.88%), Kotak Mahindra (+0.18%)
- **Significant regression:** SBI (TC = 0.7347), IDFC First (TC = 0.7943), IndusInd (TC = 0.8483), Punjab National (TC = 0.8759)
- Large banks like SBI and HDFC show that scale-driven efficiency does not guarantee technological innovation — a key structural risk identified in the study

## Key Findings
- Karur Vysya and Axis Bank are the standout post-pandemic performers, improving on both efficiency and productivity fronts
- SBI, despite being India's largest bank, recorded one of the steepest technological regression scores (TC = 0.7347), indicating over-reliance on scale rather than innovation
- IDBI Bank and Yes Bank (MI ≈ 0.59) recorded the most severe productivity declines — consistent with their ongoing financial and governance challenges during this period
- Banks that invested in digital operations and cost rationalisation post-COVID showed the strongest efficiency change scores
- 14 out of 20 banks maintained full VRS efficiency post-pandemic, suggesting the sector broadly stabilised — but productivity trends tell a more nuanced story

## Project Structure
Bank-performance-DEA/
├── data/
│   └── Bank_Data_Final.xlsx
├── reports/
│   └── DEA_Performance_analysis_banks.pdf
├── src/
│   └── Optimization_DEA.R
└── .gitignore
## Tech Stack
- **Language:** R
- **Libraries:** `deaR`, `ggplot2`, `readxl`
- **Environment:** RStudio
- **Techniques:** Data Envelopment Analysis (BCC/VRS), Malmquist Productivity Index, Efficiency Decomposition, Correlation Analysis

## How to Run
1. Clone the repo
```bash
git clone https://github.com/GokulKumar-7/Bank-performance-DEA.git
cd Bank-performance-DEA
```
2. Install the required R package
```r
install.packages("deaR")
```
3. Download the dataset from Screener.in and place it in the `data/` folder
4. Open `src/Optimization_DEA.R` in RStudio and run all sections
5. ## Conclusion
6. The analysis reveals that the COVID-19 pandemic created a clear divide in Indian banking performance. Banks that prioritised operational efficiency and digital transformation, like Axis, ICICI, Karur Vysya emerged stronger.Those that failed to shift their technological frontier like SBI, IDBI, and Yes Bank showed deep productivity losses despite regulatory support. The Malmquist decomposition makes it clear: recovering to pre-pandemic efficiency levels is not the same as genuinely improving productivity. Addressing the technological frontier gap is the single most important lever for a long-term banking sector resilience in India
