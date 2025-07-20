# 2024-CUSA-Football-Analysis

This project analyzes the performances of 2024 NCAA QBs. I have used this work to support discussions about the upcoming 2025 season.

---

## 📊 Data

Play-by-play data from the 2024 NCAA football season was used. Each quarterback’s plays were saved as subsets of the full data for easier access and cleaner comparisons.

---

## 🗂️ Project Structure

The scripts should be run in the following order:

- `00_README.md` – This file
- `01._VASKO.R` – First QB analyzed: **Ethan Vasko**
- `02._MCIVOR.R` – Second QB analyzed: **Maverick McIvor**
- `03._download.csv` – All game data needed for McIvor; includes every game except 1 (used for Abilene Christian)
- `04._Bullock.R` – Third QB analyzed: **Evan Bullock**

> 💡 Run the scripts in order — some code in earlier scripts is required by later ones.

---

## 📈 Analysis Focus

- Compares overall completion% to third down completion%
- Determines success rate for each quarterback overall and on each down
- Compares EPA per play for each quarterback in the study and in the league 
- Adds in completions buckets to focus on efficiency

## ▶️ How to Run the Code

1. Clone or download this repository
2. Get your own College Football Data Key (https://collegefootballdata.com/key#google_vignette)
3. Make sure the `.csv` file is downloaded and name is changed
4. Open each `.R` file in R or RStudio and run them in order
5. Install packages are listed at the top of each .R file
