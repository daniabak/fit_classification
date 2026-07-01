#!/usr/bin/env bash
cd "$(dirname "$0")/.."
mlflow ui --backend-store-uri sqlite:///mlflow.db
