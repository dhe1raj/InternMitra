# 🚀 COMPLETE SETUP GUIDE - PM Internship Recommendation Engine
# SIH 2025 - GITAM University Team

## 📁 STEP-BY-STEP DIRECTORY CREATION AND FILE PLACEMENT

### Step 1: Create Project Directory Structure

```cmd
mkdir C:\pm-internship-recommender
cd C:\pm-internship-recommender
```

Create the following folders:

```
C:\pm-internship-recommender\
├── backend\
│   ├── app\
│   └── data\
├── frontend\
│   ├── public\
│   ├── src\
│   │   ├── components\
│   │   ├── pages\
│   │   └── utils\
├── scripts\
└── docs\
```

### Step 2: Place Backend Files

Create these files in `C:\pm-internship-recommender\backend\app\`:

**main.py** - Copy content from `backend-main.py`
**models.py** - Copy content from `backend-models.py`  
**recommendation_engine.py** - Copy content from `backend-recommendation-engine.py`
**data_processor.py** - Copy content from `backend-data-processor.py`

Create **__init__.py** (empty file) in `backend\app\`

Create these files in `C:\pm-internship-recommender\backend\`:

**requirements.txt** - Copy content from `backend-requirements.txt`

**run.py**:
```python
import uvicorn
from app.main import app

if __name__ == "__main__":
    uvicorn.run(
        "app.main:app",
        host="0.0.0.0",
        port=8000,
        reload=True,
        log_level="info"
    )
```

**.env**:
```
PYTHONPATH=.
ENVIRONMENT=development
API_HOST=0.0.0.0
API_PORT=8000
CORS_ORIGINS=http://localhost:3000,http://127.0.0.1:3000
LOG_LEVEL=info
```

### Step 3: Place Data Files

Create these files in `C:\pm-internship-recommender\backend\data\`:

**internships_dataset.json** - Copy content from `complete_internships_dataset.json`
**skills_taxonomy.json** - Copy content from `skills_taxonomy.json`
**sectors_mapping.json** - Copy content from `sectors_mapping.json`

### Step 4: Place Frontend Files

Create these files in `C:\pm-internship-recommender\frontend\`:

**package.json** - Copy content from `frontend-package.json`

**.env**:
```
REACT_APP_API_URL=http://localhost:8000
REACT_APP_NAME=PM Internship Finder
REACT_APP_VERSION=1.0.0
GENERATE_SOURCEMAP=true
```

**tailwind.config.js**:
```javascript
/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./src/**/*.{js,jsx,ts,tsx}",
    "./public/index.html"
  ],
  theme: {
    extend: {
      colors: {
        primary: {
          50: '#eff6ff',
          500: '#3b82f6',
          600: '#2563eb',
          700: '#1d4ed8'
        }
      }
    },
  },
  plugins: [
    require('@tailwindcss/forms')
  ],
}
```

**postcss.config.js**:
```javascript
module.exports = {
  plugins: {
    tailwindcss: {},
    autoprefixer: {},
  },
}
```

Create these files in `C:\pm-internship-recommender\frontend\public\`:

**index.html**:
```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <link rel="icon" href="%PUBLIC_URL%/favicon.ico" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <meta name="theme-color" content="#000000" />
  <meta name="description" content="AI-powered PM Internship Recommendation Engine" />
  <link rel="apple-touch-icon" href="%PUBLIC_URL%/logo192.png" />
  <link rel="manifest" href="%PUBLIC_URL%/manifest.json" />
  <title>PM Internship Finder - SIH 2025</title>
</head>
<body>
  <noscript>You need to enable JavaScript to run this app.</noscript>
  <div id="root"></div>
</body>
</html>
```

**manifest.json**:
```json
{
  "short_name": "PM Internship Finder",
  "name": "PM Internship Recommendation Engine",
  "icons": [
    {
      "src": "favicon.ico",
      "sizes": "64x64 32x32 24x24 16x16",
      "type": "image/x-icon"
    }
  ],
  "start_url": ".",
  "display": "standalone",
  "theme_color": "#000000",
  "background_color": "#ffffff"
}
```

Create these files in `C:\pm-internship-recommender\frontend\src\`:

**App.jsx** - Copy content from `frontend-app.jsx`

**index.js**:
```javascript
import React from 'react';
import ReactDOM from 'react-dom/client';
import './index.css';
import App from './App';

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>
);
```

**index.css**:
```css
@tailwind base;
@tailwind components;
@tailwind utilities;

body {
  margin: 0;
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Oxygen',
    'Ubuntu', 'Cantarell', 'Fira Sans', 'Droid Sans', 'Helvetica Neue',
    sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

code {
  font-family: source-code-pro, Menlo, Monaco, Consolas, 'Courier New',
    monospace;
}

.App {
  text-align: center;
}

@layer components {
  .btn-primary {
    @apply bg-blue-600 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded;
  }
}
```

**App.css**:
```css
.App {
  min-height: 100vh;
}

.fade-in {
  animation: fadeIn 0.5s ease-in;
}

@keyframes fadeIn {
  from {
    opacity: 0;
    transform: translateY(20px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}
```

Create these files in `C:\pm-internship-recommender\frontend\src\pages\`:

**Home.jsx** - Copy content from `frontend-home.jsx`

**Results.jsx**:
```javascript
import React from 'react';
import { useNavigate } from 'react-router-dom';
import RecommendationsList from '../components/RecommendationsList';

const Results = ({ recommendations, searchQuery }) => {
  const navigate = useNavigate();

  if (!recommendations || recommendations.length === 0) {
    return (
      <div className="max-w-4xl mx-auto text-center py-12">
        <div className="bg-yellow-50 border border-yellow-200 rounded-lg p-8">
          <h2 className="text-2xl font-bold text-gray-800 mb-4">No Results Found</h2>
          <p className="text-gray-600 mb-6">
            We couldn't find any internships matching your criteria. Try adjusting your search parameters.
          </p>
          <button
            onClick={() => navigate('/')}
            className="bg-blue-600 text-white px-6 py-3 rounded-lg hover:bg-blue-700 transition-colors"
          >
            New Search
          </button>
        </div>
      </div>
    );
  }

  return (
    <div className="max-w-6xl mx-auto">
      <div className="mb-8">
        <div className="flex justify-between items-center mb-4">
          <h1 className="text-3xl font-bold text-gray-800">
            Your Perfect Matches
          </h1>
          <button
            onClick={() => navigate('/')}
            className="bg-gray-600 text-white px-4 py-2 rounded-lg hover:bg-gray-700 transition-colors"
          >
            New Search
          </button>
        </div>
        
        {searchQuery && (
          <div className="bg-blue-50 border border-blue-200 rounded-lg p-4">
            <h3 className="font-semibold text-blue-800 mb-2">Search Summary:</h3>
            <div className="text-sm text-blue-700">
              <span className="font-medium">Education:</span> {searchQuery.education} |{' '}
              <span className="font-medium">Skills:</span> {searchQuery.skills.join(', ')}
              {searchQuery.sectors && searchQuery.sectors.length > 0 && (
                <> | <span className="font-medium">Sectors:</span> {searchQuery.sectors.join(', ')}</>
              )}
              {searchQuery.location_state && (
                <> | <span className="font-medium">Location:</span> {searchQuery.location_state}</>
              )}
            </div>
          </div>
        )}
      </div>

      <RecommendationsList recommendations={recommendations} />
    </div>
  );
};

export default Results;
```

Create these files in `C:\pm-internship-recommender\frontend\src\components\`:

**SearchForm.jsx** - Copy content from `frontend-searchform.jsx`

**RecommendationsList.jsx**:
```javascript
import React from 'react';
import InternshipCard from './InternshipCard';

const RecommendationsList = ({ recommendations }) => {
  if (!recommendations || recommendations.length === 0) {
    return (
      <div className="text-center py-12">
        <p className="text-gray-600">No recommendations available.</p>
      </div>
    );
  }

  return (
    <div className="space-y-6">
      <div className="text-center mb-8">
        <h2 className="text-2xl font-bold text-gray-800 mb-2">
          Found {recommendations.length} Perfect Matches
        </h2>
        <p className="text-gray-600">
          AI-powered recommendations ranked by compatibility
        </p>
      </div>

      <div className="grid grid-cols-1 gap-6">
        {recommendations.map((internship, index) => (
          <InternshipCard
            key={internship.id}
            internship={internship}
            rank={index + 1}
          />
        ))}
      </div>
    </div>
  );
};

export default RecommendationsList;
```

**InternshipCard.jsx**:
```javascript
import React from 'react';

const InternshipCard = ({ internship, rank }) => {
  const getScoreColor = (score) => {
    if (score >= 0.8) return 'text-green-600 bg-green-100';
    if (score >= 0.6) return 'text-blue-600 bg-blue-100';
    return 'text-orange-600 bg-orange-100';
  };

  const formatScore = (score) => {
    return Math.round(score * 100);
  };

  return (
    <div className="bg-white rounded-lg shadow-lg border border-gray-200 p-6 hover:shadow-xl transition-shadow duration-200">
      {/* Header */}
      <div className="flex justify-between items-start mb-4">
        <div className="flex items-start space-x-4">
          <div className="bg-blue-600 text-white rounded-full w-8 h-8 flex items-center justify-center font-bold text-sm">
            {rank}
          </div>
          <div>
            <h3 className="text-xl font-bold text-gray-800 mb-1">
              {internship.title}
            </h3>
            <p className="text-lg text-blue-600 font-semibold">
              {internship.company}
            </p>
          </div>
        </div>
        
        <div className={`px-3 py-1 rounded-full text-sm font-medium ${getScoreColor(internship.similarity_score)}`}>
          {formatScore(internship.similarity_score)}% Match
        </div>
      </div>

      {/* Key Info */}
      <div className="grid grid-cols-1 md:grid-cols-3 gap-4 mb-4">
        <div className="flex items-center space-x-2">
          <svg className="w-4 h-4 text-gray-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z" />
            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M15 11a3 3 0 11-6 0 3 3 0 016 0z" />
          </svg>
          <span className="text-sm text-gray-600">
            {internship.location_city}, {internship.location_state}
          </span>
        </div>
        
        <div className="flex items-center space-x-2">
          <svg className="w-4 h-4 text-gray-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1" />
          </svg>
          <span className="text-sm text-gray-600">{internship.stipend}</span>
        </div>
        
        <div className="flex items-center space-x-2">
          <svg className="w-4 h-4 text-gray-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z" />
          </svg>
          <span className="text-sm text-gray-600">{internship.duration_weeks} weeks</span>
        </div>
      </div>

      {/* Sector and Education */}
      <div className="flex flex-wrap gap-2 mb-4">
        <span className="bg-purple-100 text-purple-800 px-2 py-1 rounded-full text-xs font-medium">
          {internship.sector}
        </span>
        <span className="bg-gray-100 text-gray-800 px-2 py-1 rounded-full text-xs font-medium">
          {internship.education_requirement}
        </span>
      </div>

      {/* Skills */}
      <div className="mb-4">
        <h4 className="text-sm font-medium text-gray-700 mb-2">Required Skills:</h4>
        <div className="flex flex-wrap gap-2">
          {internship.skills_required.map((skill, index) => (
            <span
              key={index}
              className="bg-blue-50 text-blue-700 px-2 py-1 rounded text-xs font-medium border border-blue-200"
            >
              {skill}
            </span>
          ))}
        </div>
      </div>

      {/* AI Explanation */}
      <div className="bg-gradient-to-r from-green-50 to-blue-50 border border-green-200 rounded-lg p-3 mb-4">
        <h4 className="text-sm font-medium text-green-800 mb-1">
          🤖 Why this matches you:
        </h4>
        <p className="text-sm text-green-700">{internship.reason}</p>
      </div>

      {/* Description */}
      <div className="mb-4">
        <p className="text-sm text-gray-600 leading-relaxed">
          {internship.description}
        </p>
      </div>

      {/* Apply Button */}
      <div className="flex justify-between items-center pt-4 border-t border-gray-200">
        <div className="text-xs text-gray-500">
          Apply by: {new Date(internship.application_deadline || '2025-10-15').toLocaleDateString()}
        </div>
        <a
          href={internship.apply_url}
          target="_blank"
          rel="noopener noreferrer"
          className="bg-gradient-to-r from-blue-600 to-indigo-600 text-white px-6 py-2 rounded-lg hover:from-blue-700 hover:to-indigo-700 transition-all duration-200 font-medium text-sm flex items-center space-x-2"
        >
          <span>Apply on PMIS</span>
          <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14" />
          </svg>
        </a>
      </div>
    </div>
  );
};

export default InternshipCard;
```

**LoadingSpinner.jsx**:
```javascript
import React from 'react';

const LoadingSpinner = () => {
  return (
    <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
      <div className="bg-white rounded-lg p-8 flex flex-col items-center">
        <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-blue-600 mb-4"></div>
        <h3 className="text-lg font-semibold text-gray-800 mb-2">
          🤖 AI is Finding Your Perfect Matches
        </h3>
        <p className="text-sm text-gray-600 text-center">
          Analyzing your profile and matching with 200+ internships...
        </p>
      </div>
    </div>
  );
};

export default LoadingSpinner;
```

Create these files in `C:\pm-internship-recommender\frontend\src\utils\`:

**api.js** - Copy content from `frontend-api.js`

**constants.js**:
```javascript
export const API_BASE_URL = process.env.REACT_APP_API_URL || 'http://localhost:8000';

export const EDUCATION_LEVELS = [
  'B.Tech', 'B.E', 'BCA', 'MCA', 'M.Tech', 'B.Com', 'BBA', 'MBA', 
  'CA', 'M.Com', 'MBBS', 'B.Pharma', 'BDS', 'BAMS', 'B.Sc Nursing',
  'BSc', 'B.Sc Agriculture', 'B.Tech Agricultural', 'M.Sc Agriculture',
  'B.Ed', 'M.Ed', 'BA', 'MA', 'MSc', 'Diploma', 'ITI', 'Mass Communication'
];

export const SECTORS = [
  'Technology', 'Finance', 'Healthcare', 'Agriculture', 
  'Marketing', 'Manufacturing', 'Education'
];

export const MAX_SKILLS = 10;
export const MAX_RESULTS = 10;
```

### Step 5: Place Setup Scripts

Create these files in `C:\pm-internship-recommender\scripts\`:

**setup_windows.bat** - Copy content from `setup-windows.bat`

**run_backend.bat**:
```batch
@echo off
echo Starting PM Internship Recommender Backend...
cd /d "%~dp0\..\backend"
call venv\Scripts\activate.bat
echo Backend starting at http://localhost:8000
echo API Documentation: http://localhost:8000/docs
echo.
uvicorn app.main:app --reload --host 0.0.0.0 --port 8000
pause
```

**run_frontend.bat**:
```batch
@echo off
echo Starting PM Internship Recommender Frontend...
cd /d "%~dp0\..\frontend"
echo Frontend starting at http://localhost:3000
echo.
npm start
pause
```

**start_application.bat**:
```batch
@echo off
echo ========================================
echo  PM Internship Recommender - SIH 2025
echo  Starting Complete Application
echo ========================================
echo.
echo Starting Backend Server...
start "Backend" "%~dp0run_backend.bat"
echo Waiting for backend to initialize...
timeout /t 5 >nul
echo Starting Frontend Server...
start "Frontend" "%~dp0run_frontend.bat"
echo.
echo ✅ Application started successfully!
echo.
echo 🌐 Frontend: http://localhost:3000
echo 🔗 Backend API: http://localhost:8000
echo 📚 API Docs: http://localhost:8000/docs
echo.
echo Press any key to close this window...
pause >nul
```

### Step 6: Create Documentation

Create **README.md** in `C:\pm-internship-recommender\` - Copy content from `complete-readme.md`

---

## ⚡ QUICK SETUP COMMANDS

### Option 1: Automated Setup
```cmd
cd C:\pm-internship-recommender
scripts\setup_windows.bat
```

### Option 2: Manual Setup

#### Backend Setup:
```cmd
cd C:\pm-internship-recommender\backend
python -m venv venv
venv\Scripts\activate
pip install -r requirements.txt
python app\data_processor.py
```

#### Frontend Setup:
```cmd
cd C:\pm-internship-recommender\frontend
npm install
```

#### Run Application:
```cmd
# Terminal 1 - Backend
cd C:\pm-internship-recommender\backend
venv\Scripts\activate
uvicorn app.main:app --reload --host 0.0.0.0 --port 8000

# Terminal 2 - Frontend  
cd C:\pm-internship-recommender\frontend
npm start
```

---

## 🎯 TESTING THE SYSTEM

1. **Go to http://localhost:3000**
2. **Fill the form:**
   - Education: B.Tech
   - Skills: Python, SQL, Machine Learning
   - Sectors: Technology
   - Location: Telangana
3. **Click "Find My Perfect Internships"**
4. **Verify you get personalized recommendations with 90%+ accuracy**

---

## ✅ SUCCESS CRITERIA

- ✅ Backend API running at http://localhost:8000
- ✅ Frontend running at http://localhost:3000  
- ✅ API docs available at http://localhost:8000/docs
- ✅ Health check returns "healthy" status
- ✅ Recommendations returned in <2 seconds
- ✅ 90%+ matching accuracy achieved
- ✅ Clear AI explanations provided

---

**🏆 Ready for Smart India Hackathon 2025! 🏆**

**Team: GITAM University, Hyderabad**
**Project: AI-Powered PM Internship Recommendation Engine**