# docship-mypursu
special gateway for api based on shipping requests from mypursu

## Overview
Document-shipping microservice (Flask) that accepts shipping requests, processes status updates, and returns shipping labels. Minimal service lives in services/docship/.

## Prerequisites (macOS / Linux)
- python3 (3.10+ recommended)
- git
- curl
- (optional) Docker
- Homebrew for DB tools (optional): brew

## Quick setup (services/docship)
1. Open a terminal and change to the service directory:
   - cd <workspace>/services/docship
2. Create & activate venv:
   - python3 -m venv env
   - source env/bin/activate
3. Install requirements:
   - pip install --upgrade pip
   - pip install -r requirements.txt

## Run locally
- Start the Flask app:
  - python app.py
  - or: export FLASK_APP=app.py && flask run --host=0.0.0.0 --port=5000
- The service will be available at: http://127.0.0.1:5000/ship_validate

## API (example)
- POST /ship_validate
  - JSON body: { "shipment": "SHIP-12345" }
  - Success (200): { "status": "valid" }
  - Failure (400): { "status": "invalid", "reason": "<explain>" }

Example:
- curl -X POST -H "Content-Type: application/json" -d '{"shipment":"SHIP-12345"}' http://127.0.0.1:5000/ship_validate

## Tests & automated deploy+test
- A simple test suite and helper script are provided under services/docship/.
- To run the automated deploy + tests:
  - cd services/docship
  - chmod +x deploy_test.sh
  - ./deploy_test.sh
- The script creates/uses a venv, installs requirements, starts the server, runs tests, and tears down the server.

## Project layout (relevant)
- services/docship/app.py         # Flask service
- services/docship/requirements.txt
- services/docship/tests/         # pytest tests
- services/docship/deploy_test.sh

## Notes
- Development machines: macOS.
- Deployment target: Linux VM (crontabo VM).
- Follow security and DevOps guidelines when configuring credentials and production deployments.
