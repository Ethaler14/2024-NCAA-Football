# 2024-CUSA-Football-Analysis

This project analyzes the performances of 2024 NCAA C-USA quarterbacks. The analysis supports discussion and evaluation of players heading into the 2025 season.

---

## 📊 Data

Play-by-play data from the 2024 NCAA football season was used. Each quarterback’s plays were saved as subsets of the full dataset to enable cleaner comparisons without modifying code to switch names manually.

---

## 🗂️ Project Structure

Run the scripts in the following order:

- `00_README.md` – This file
- `01._VASKO.R` – Analysis of **Ethan Vasko**
- `02._MCIVOR.R` – Analysis of **Maverick McIvor**
- `03._download.csv` – All game data needed for McIvor; adds in one game
- `04._Bullock.R` – Analysis of **Evan Bullock**

> 💡 Some earlier scripts contain code that is reused later. Please run the scripts in order for full functionality.

---

## 📈 Analysis Focus

This project includes the following evaluations:

- Comparison of **overall completion %** vs **3rd down completion %**
- Calculation of **success rate** overall and by down
- Estimation of **EPA per play** by quarterback and across the conference
- Use of **completion buckets** to assess passing efficiency

---

## ▶️ How to Run the Code

1. Clone or download this repository
2. Obtain your own [College Football Data API key](https://collegefootballdata.com/key#google_vignette)
3. Ensure `03._download.csv` is in the working directory and properly named
4. Open each `.R` script in R or RStudio and run them in order
5. Install required packages as listed at the top of each script

---

## 🧾 Notes

- All analysis is done in R using the `dplyr`, `ggplot2`, and `cfbfastR` ecosystems

---

## 🔗 Related Article

This analysis supports a companion article. Link coming soon:  
[Insert article link here]

---

## 📜 License

MIT License — free to use, modify, and share. Pull requests and forks welcome.
