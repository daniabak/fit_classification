#!/usr/bin/env bash
set -e
cd "$(dirname "$0")/.."
[ -d .git ] || git init
[ -d .dvc ] || dvc init
dvc add data/raw
cat <<'EOF'

Now configure a DVC remote, for example:
dvc remote add -d localremote "/path/to/shared_dvc_remote"
dvc push

Then commit the small tracking files:
git add .dvc .dvcignore data/raw.dvc data/.gitignore .gitignore README.md requirements.txt notebooks scripts
git commit -m "Initialize project with DVC tracking"
EOF
