#!/bin/bash

PROJECT_NAME=$1

if [ -z "$PROJECT_NAME" ]; then
  echo "❌ Error: Please provide a project name. Usage: mkproj my-new-app"
  exit 1
fi

echo "🏗️ Building project: $PROJECT_NAME..."

mkdir -p "$PROJECT_NAME"
cd "$PROJECT_NAME" || exit

python3 -m venv .venv
source .venv/bin/activate
pip install --upgrade pip --quiet

echo "__pycache__/
.venv/
.env
*.log" > .gitignore

echo "import os

def main():
    print(f'🚀 {os.path.basename(os.getcwd())} is running!')
    print('Happy coding, Rafi!')

if __name__ == \"__main__\":
    main()" > main.py

echo "# $PROJECT_NAME

Started on: $(date '+%Y-%m-%d')

## How to run
1. \`source .venv/bin/activate\`
2. \`python3 main.py\`" > README.md

echo "✅ Project '$PROJECT_NAME' created successfully!"
echo "👉 Type: cd $PROJECT_NAME && source .venv/bin/activate"
