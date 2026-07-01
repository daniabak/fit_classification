@echo off
cd /d %~dp0\..
mlflow ui --backend-store-uri sqlite:///mlflow.db
