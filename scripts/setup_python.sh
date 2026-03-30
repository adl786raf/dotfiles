#!/bin/bash

echo "🐍 Starting Python Environment Setup..."

python3 -m pip install --upgrade pip --user --quiet
pip install --user requests python-dotenv flake8 black --quiet

GITIGNORE_CONTENT="__pycache__/
*.py[cod]
*$py.class
.venv/
venv/
ENV/
.env
.pytest_cache/
.vscode/
*.log"

echo "alias pyenv='python3 -m venv .venv && source .venv/bin/activate && pip install --upgrade pip && if [ ! -f .gitignore ]; then echo \"$GITIGNORE_CONTENT\" > .gitignore; echo \"🛡️ Created .gitignore\"; fi'" >> ~/.bashrc

echo "✅ Python tools installed."
