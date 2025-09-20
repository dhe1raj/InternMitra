# InternMitra – PM Internship Finder

AI + Rule-based recommendation engine for the Prime Minister’s Internship Scheme.

## Highlights
- Inputs: student profile (education, skills, sector, location)
- Model: TF-IDF + cosine + eligibility/location/sector rules
- Output: top 3–5 internships with "why this matches"
- Stack: FastAPI (Python), React + Tailwind, scikit‑learn, JSON datasets
- Performance: sub‑second responses; privacy‑first (no PII stored)

## Project Structure
See `complete-readme.md` for a detailed walkthrough and `docs/research_summary.txt` for the research write‑up, architecture, and tuning guidelines.

## Local Run (summary)
- Backend (FastAPI): `backend/app/main.py` (Uvicorn)
- Frontend (React): `frontend/` (npm start)
- Data: `backend/data/*.json`
- Scripts: `scripts/*.bat` on Windows

## Documentation
- Detailed setup: `complete-setup-guide.md`
- Research summary: `docs/research_summary.txt`
- Architecture & pitch: see docs and repository root files

## License
Specify your license here.
