# FITE Anonymized Classification Project

This project is prepared for local development in VS Code. It keeps the ML notebook, MLflow experiment tracking, and DVC data versioning in one reproducible project structure.

## Project structure

```text
fite_classification_project_vscode/
├── notebooks/
│   ├── FITE_Classification_VSCode_DVC_MLflow.ipynb
│   └── original_colab_notebook_backup.ipynb
├── data/
│   ├── raw/
│   │   ├── train_data.csv
│   │   ├── sample_submission.csv
│   │   └── PUT_TEST_DATA_HERE.txt   # replace by test_data.csv when available
│   └── raw.dvc
├── submissions/
├── models/
├── reports/mlflow_screenshots/
├── scripts/
├── requirements.txt
├── .gitignore
└── .dvc/
```

## 1. Open in VS Code

Open this folder directly in VS Code, not only the notebook file.

```bash
code .
```

## 2. Create the Python environment

Windows:

```bash
python -m venv .venv
.venv\Scripts\activate
pip install -r requirements.txt
python -m ipykernel install --user --name fite-classification --display-name "Python (fite-classification)"
```

Mac/Linux:

```bash
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
python -m ipykernel install --user --name fite-classification --display-name "Python (fite-classification)"
```

Then open `notebooks/FITE_Classification_VSCode_DVC_MLflow.ipynb` and select the kernel `Python (fite-classification)`.

## 3. Data versioning with DVC

The raw dataset is tracked with DVC, while the large CSV files are ignored by Git. The repository should commit `data/raw.dvc` and `data/.gitignore`, but should not commit the CSV files inside `data/raw/`.

To create or refresh the DVC tracking file after changing the dataset:

```bash
dvc add data/raw
```

To configure a shared remote, choose any shared folder path, for example a Google Drive Desktop folder, OneDrive folder, or another shared storage location:

```bash
dvc remote add -d localremote "PATH_TO_SHARED_DVC_REMOTE"
dvc push
```

A teammate can restore the data after cloning the GitHub repository by configuring access to the same DVC remote and running:

```bash
dvc pull
```

## 4. GitHub upload checklist

Commit these files:

```text
notebooks/
README.md
requirements.txt
.gitignore
.dvc/
.dvcignore
data/raw.dvc
data/.gitignore
scripts/
```

Do not commit these files/folders:

```text
data/raw/*.csv
mlruns/
mlflow.db
submissions/*.csv
models/*.pkl
models/*.joblib
```

## 5. MLflow

Run the notebook experiments first. Then, from the VS Code terminal in the project root, run:

```bash
mlflow ui --backend-store-uri sqlite:///mlflow.db
```

Open `http://127.0.0.1:5000` and take a screenshot of the comparison table for the final report.

## 6. Kaggle submission

The uploaded files did not include `test_data.csv`. Before generating the submission, copy the competition test file into:

```text
data/raw/test_data.csv
```

Then re-run the notebook. The submission CSV will be saved inside:

```text
submissions/
```
