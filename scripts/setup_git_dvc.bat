@echo off
cd /d %~dp0\..
IF NOT EXIST .git git init
IF NOT EXIST .dvc dvc init
dvc add data/raw
echo.
echo Now configure a DVC remote, for example:
echo dvc remote add -d localremote "C:\path\to\shared_dvc_remote"
echo dvc push
echo.
echo Then commit the small tracking files:
echo git add .dvc .dvcignore data/raw.dvc data/.gitignore .gitignore README.md requirements.txt notebooks scripts
echo git commit -m "Initialize project with DVC tracking"
