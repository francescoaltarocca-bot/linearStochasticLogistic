# linearStochasticLogistic


## Description
The software performs an analysis of different **machine learning approaches** to the regression problem, using multiple methods:

- **Linear regression** using both the classical and stochastic least squares methods; in this case, the model was trained using both separate datasets and the merged dataset.
- **Logistic regression**.

Both **linear** and **logistic regression** models were implemented in **MATLAB**.

## Dataset Description

The data were downloaded from the **UCI Machine Learning Repository**, specifically the **Wine Quality** dataset.  
This dataset contains information on wine samples, both white and red, from Portugal.

- **Total samples:** 6,497  
  - 4,898 white wines  
  - 1,599 red wines  
- **Number of features:** 11 (continuous)
- **Target variable:** wine quality (integer values ranging from 0 to 10)

---

## Variables Table

| Variable Name           | Role    | Type       |
|-------------------------|---------|------------|
| fixed_acidity           | Feature | Continuous |
| volatile_acidity        | Feature | Continuous |
| citric_acid             | Feature | Continuous |
| residual_sugar          | Feature | Continuous |
| chlorides               | Feature | Continuous |
| free_sulfur_dioxide     | Feature | Continuous |
| total_sulfur_dioxide    | Feature | Continuous |
| density                 | Feature | Continuous |
| pH                      | Feature | Continuous |
| sulphates               | Feature | Continuous |
| alcohol                 | Feature | Continuous |
| quality                 | Target  | Integer    |


## Repository Structure

```text
CriticalArcRemovalProblem/
├── linear.m                 # ML linear model (MATHLAB)
├── linear_stochastic.m      # ML linear stochastic model (MATHLAB)
├── logistic.m               # ML logistic model (MATHLAB)
├── LICENSE                  # license
├── README.md                # documentation
├── CITATION.cff             # citation metadata
└── requirements.txt         # dependencies
```

## Key Features

## Key Features

- Implementation and framework for comparison of multiple **machine learning approaches** for regression and classification tasks.
- **Linear regression** models based on both **classical** and **stochastic least squares** methods.
- **Logistic regression** model for classification-oriented analysis.
- Training performed on **separate datasets** (red and white wine) as well as on the **merged dataset**.
- Experimental analysis conducted using real-world data from the **UCI Machine Learning Repository**.
- Use of the **Wine Quality dataset**, comprising 6,497 wine samples with 11 continuous features.
- Clear separation between **features** and **target variable** (wine quality).
- Reproducible experimental workflow suitable for research and educational purposes.
- Models implemented in **MATLAB**.

## Requirements

- **MATLAB** (desktop version or **MATLAB Online**) is required to run the software.
- A valid **MathWorks license** is required for MATLAB usage.
- No additional third-party MATLAB toolboxes are required unless otherwise specified.
- Internet access is required when using **MATLAB Online**.

See requirements.txt for more datails.

## Runtime Requirements
- **MATLAB** (desktop version or **MATLAB Online**) is required to run the software.
- **Memory:** at least 8GB recommended for large datasets
- **OS:** Linux, macOS, or Windows 10+


## Licensing Note

This software is released as MIT License open-source code; however, it depends on **MATLAB**, which is proprietary software developed by MathWorks.

- A valid **MATLAB license** (desktop or MATLAB Online) is required to run the code.
- MATLAB is **not redistributed** with this repository and must be obtained independently from MathWorks.
- All users must comply with the MATLAB license terms.

The dataset used in this project is publicly available from the **UCI Machine Learning Repository** and is subject to its own usage conditions.


## Usage

1. Download or clone the repository.
2. Ensure that **MATLAB (desktop or MATLAB Online)** is available and properly licensed.
3. Load the provided scripts into MATLAB.
4. Download the **Wine Quality dataset** from the UCI Machine Learning Repository and place it in the expected data directory.
5. Run the main MATLAB scripts to execute the regression and classification analyses.

The software supports running experiments on:
- Separate datasets (red and white wine)
- The merged dataset

## Output

The software produces numerical and graphical outputs that summarize the results of the experiments, including:

- Estimated model parameters for linear and logistic regression
- Performance metrics for regression and classification tasks
- Results obtained on separate datasets versus the merged dataset

Outputs are displayed in the MATLAB environment and, where specified, saved to files for further analysis.

## Reproducibility

All results are reproducible by: Using the same input dataset
Installing dependencies listed in requirements.txt
Running the provided scripts
Randomness (if any) should be controlled via fixed seeds in the code.

## License

This project is released under the MIT License.
See the LICENSE file for details.

## Citation

If you use BigDataGraph in academic work, please cite it as follows:

@software{linearStochasticLogistic2025,
  title     = {linearStochasticLogistic},
  author    = {Altarocca, Francesco},
  affiliation = {Independent Researcher},
  year      = {2025},
  publisher = {Zenodo},
  doi       = {}
}

## Disclaimer

This software is provided for **research and educational purposes only**.

The authors make **no guarantees** regarding the correctness, completeness, or suitability of the software for any specific task.  
Results obtained using this software should be **independently verified** before being used in scientific publications, decision-making processes, or production systems.

## Data and Ethical Use Notice

Users are solely responsible for ensuring that any data processed with this software complies with applicable laws, platform terms of service, and ethical research standards.

The author(s) assume **no responsibility** for improper, unlawful, or unethical use of third-party data, including but not limited to social media datasets.

## Limitation of Liability

Under no circumstances shall the author(s) be held liable for any direct, indirect, incidental, consequential, or special damages arising out of the use of, or inability to use, this software.

This includes, but is not limited to:
- data loss
- incorrect analyses or interpretations
- misuse of results
- system failures
- legal or ethical consequences related to data usage

By using this software, you acknowledge that you do so **at your own risk**.

## Author and Affiliation

**Francesco Altarocca**  
Affiliation: Independent Researcher  

*This work was developed independently and does not necessarily reflect the views of any current or past employer, institution, or organization.*
