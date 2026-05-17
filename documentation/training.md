# Development Environment Setup

## ✅ GitHub Account & Access
- Create a GitHub account and share your username to be added as a collaborator.
- Read: https://docs.github.com/en/get-started/using-github/github-flow

## 💻 Visual Studio Code
- Download VS Code: https://code.visualstudio.com/
- Recommended extensions: Python, GitLens, Jinja

## 🐋 Docker & Fundamentals
- Install Docker: https://docs.docker.com/get-started/
- Learn basics: containers, images, docker build/run, docker ps, docker-compose
- Quick commands:
  - Build: `docker build -t docship .`
  - Run: `docker run --rm -p 5000:5000 docship`
  - Compose: `docker-compose up --build`

## 🛢️ MariaDB & MySQL Client (macOS)
- Install via Homebrew:
  - `brew install mariadb`
  - `brew install mysql-client`
- Start MariaDB: `brew services start mariadb`  
- Use `mysql` client to connect to local or remote DB instances.

## 🐬 DBeaver (DB GUI)
- Download DBeaver: https://dbeaver.io/

## 🐍 Python & Node.js
- Python 3.10+: https://www.python.org/
- Node.js (LTS): https://nodejs.org/
- (macOS) Homebrew alternatives available: `brew install python@3.10`, `brew install node`

## 🧪 Python Virtual Environment
- Create & activate (macOS / Linux):
  - `python3 -m venv env`
  - `source env/bin/activate`
- Windows (PowerShell): `.\env\Scripts\Activate.ps1`

## 📦 Install Django & DB Packages
- Inside the activated venv:
  - `pip install django mysqlclient`

## Notes
- Development machines: macOS.
- Deployment target: Linux VM (crontabo VM).
- Follow project DevOps and security guidelines when configuring services and credentials.