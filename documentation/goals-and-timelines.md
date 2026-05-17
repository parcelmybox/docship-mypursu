# Goals and Timelines

**Timeframe:** June 1st — August 1st (Summer interns: Srujan & Charvi)

## Objective
Bring up a document-shipping microservice that receives shipping requests from MyPursu or any authorized vendors, processes new requests, accepts status updates, and returns shipping labels. Initial goal is to establish the framework and deploy the document-shipping service.

## Scope
- Accept new shipping requests (API).
- Process status updates for existing requests.
- Generate and return shipping labels.
- Support integration with MyPursu and authorized vendor clients.

## Tech Stack
- Language & framework: Python + Flask
- Database: MariaDB
- Containerization: Docker (development and production)
- Development machines: macOS (team)
- Deployment target: Linux VM (crontabo VM)

## Deployment & DevOps
- Use Docker for consistent dev and prod images.
- CI/CD pipeline to build, test, and deploy to the Linux VM.
- Follow standard DevOps practices and security guidelines (IaC, automated tests, monitoring, logging).

## Performance & Reliability
- Target throughput: 1,000 requests per hour.
- Design for graceful degradation and retries.
- Add monitoring and alerting for SLA breaches.

## Security
- Implement AAA: Authentication, Authorization, and Access Control.
- Secure data in transit (TLS) and at rest.
- Follow secure coding and dependency management practices.

## Deliverables
- Running microservice (Flask) in Docker.
- MariaDB schema and migration scripts.
- API documentation and example client requests.
- Deployment scripts / CI pipeline config.
- Basic monitoring & logging configuration.

## Acceptance Criteria
- Service deployed and reachable on the target VM.
- Endpoints for creating requests, updating status, and retrieving labels implemented and documented.
- Verified handling of 1,000 requests/hour under test load.
- Authentication and authorization validated for vendor access.

