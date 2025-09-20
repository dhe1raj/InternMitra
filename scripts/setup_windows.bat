@echo off
echo ========================================
echo  PM Internship Recommender - Complete Setup
echo  SIH 2025 - GITAM University
echo ========================================
echo.

echo Checking prerequisites...

:: Check if Python is installed
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Python is not installed or not in PATH
    echo Please install Python 3.8+ from https://python.org/downloads/
    echo Make sure to check "Add Python to PATH" during installation
    pause
    exit /b 1
)

:: Check if Node.js is installed
node --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Node.js is not installed or not in PATH
    echo Please install Node.js 16+ from https://nodejs.org/
    pause
    exit /b 1
)

echo ✅ Python found: 
python --version

echo ✅ Node.js found: 
node --version

echo ✅ npm found: 
npm --version

echo.
echo ========================================
echo  Setting up Backend...
echo ========================================

:: Navigate to backend directory
cd /d "%~dp0\..\backend"

echo Creating Python virtual environment...
python -m venv venv

echo Activating virtual environment...
call venv\Scripts\activate.bat

echo Installing Python dependencies...
pip install --upgrade pip
pip install fastapi==0.104.1
pip install uvicorn[standard]==0.24.0
pip install scikit-learn==1.3.2
pip install pandas==2.1.4
pip install numpy==1.24.4
pip install pydantic==2.5.0
pip install python-multipart==0.0.6

echo Creating requirements.txt...
pip freeze > requirements.txt

echo Generating dataset...
python app\data_processor.py

echo Testing backend...
timeout /t 2 >nul
echo Backend setup complete!

echo.
echo ========================================
echo  Setting up Frontend...
echo ========================================

:: Navigate to frontend directory
cd /d "%~dp0\..\frontend"

echo Installing Node.js dependencies...
npm install react@18.2.0 react-dom@18.2.0
npm install react-router-dom@6.20.1
npm install axios@1.6.2

echo Installing development dependencies...
npm install -D tailwindcss@3.3.6
npm install -D postcss@8.4.32
npm install -D autoprefixer@10.4.16
npm install -D @tailwindcss/forms@0.5.7

echo Initializing Tailwind CSS...
npx tailwindcss init -p

echo Frontend setup complete!

echo.
echo ========================================
echo  Creating Configuration Files...
echo ========================================

:: Create package.json for frontend
echo Creating package.json...
(
echo {
echo   "name": "pm-internship-frontend",
echo   "version": "1.0.0",
echo   "private": true,
echo   "dependencies": {
echo     "react": "^18.2.0",
echo     "react-dom": "^18.2.0",
echo     "react-router-dom": "^6.20.1",
echo     "axios": "^1.6.2"
echo   },
echo   "scripts": {
echo     "start": "react-scripts start",
echo     "build": "react-scripts build",
echo     "test": "react-scripts test",
echo     "eject": "react-scripts eject"
echo   },
echo   "devDependencies": {
echo     "react-scripts": "5.0.1",
echo     "tailwindcss": "^3.3.6",
echo     "postcss": "^8.4.32",
echo     "autoprefixer": "^10.4.16",
echo     "@tailwindcss/forms": "^0.5.7"
echo   },
echo   "browserslist": {
echo     "production": [
echo       "^>0.2%%",
echo       "not dead",
echo       "not op_mini all"
echo     ],
echo     "development": [
echo       "last 1 chrome version",
echo       "last 1 firefox version",
echo       "last 1 safari version"
echo     ]
echo   }
echo }
) > package.json

:: Create Tailwind config
echo Creating tailwind.config.js...
(
echo /** @type {import('tailwindcss'^}.Config} */
echo module.exports = {
echo   content: [
echo     "./src/**/*.{js,jsx,ts,tsx}",
echo     "./public/index.html"
echo   ],
echo   theme: {
echo     extend: {
echo       colors: {
echo         primary: {
echo           50: '#eff6ff',
echo           500: '#3b82f6',
echo           600: '#2563eb',
echo           700: '#1d4ed8'
echo         }
echo       }
echo     },
echo   },
echo   plugins: [
echo     require('@tailwindcss/forms'^)
echo   ],
echo }
) > tailwind.config.js

:: Create PostCSS config
echo Creating postcss.config.js...
(
echo module.exports = {
echo   plugins: {
echo     tailwindcss: {},
echo     autoprefixer: {},
echo   },
echo }
) > postcss.config.js

echo.
echo ========================================
echo  Creating Environment Files...
echo ========================================

cd /d "%~dp0\..\backend"
echo Creating .env file...
(
echo # Backend Environment Variables
echo PYTHONPATH=.
echo ENVIRONMENT=development
echo API_HOST=0.0.0.0
echo API_PORT=8000
echo CORS_ORIGINS=http://localhost:3000,http://127.0.0.1:3000
echo LOG_LEVEL=info
) > .env

cd /d "%~dp0\..\frontend"
echo Creating .env file...
(
echo # Frontend Environment Variables
echo REACT_APP_API_URL=http://localhost:8000
echo REACT_APP_NAME=PM Internship Finder
echo REACT_APP_VERSION=1.0.0
echo GENERATE_SOURCEMAP=true
) > .env

echo.
echo ========================================
echo  Creating Run Scripts...
echo ========================================

cd /d "%~dp0"

echo Creating run_backend.bat...
(
echo @echo off
echo echo Starting PM Internship Recommender Backend...
echo cd /d "%%~dp0\..\backend"
echo call venv\Scripts\activate.bat
echo echo Backend starting at http://localhost:8000
echo echo API Documentation: http://localhost:8000/docs
echo echo.
echo uvicorn app.main:app --reload --host 0.0.0.0 --port 8000
echo pause
) > run_backend.bat

echo Creating run_frontend.bat...
(
echo @echo off
echo echo Starting PM Internship Recommender Frontend...
echo cd /d "%%~dp0\..\frontend"
echo echo Frontend starting at http://localhost:3000
echo echo.
echo npm start
echo pause
) > run_frontend.bat

echo Creating start_application.bat...
(
echo @echo off
echo echo ========================================
echo echo  PM Internship Recommender - SIH 2025
echo echo  Starting Complete Application
echo echo ========================================
echo echo.
echo echo Starting Backend Server...
echo start "Backend" "%%~dp0run_backend.bat"
echo echo Waiting for backend to initialize...
echo timeout /t 5 >nul
echo echo Starting Frontend Server...
echo start "Frontend" "%%~dp0run_frontend.bat"
echo echo.
echo echo ✅ Application started successfully!
echo echo.
echo echo 🌐 Frontend: http://localhost:3000
echo echo 🔗 Backend API: http://localhost:8000
echo echo 📚 API Docs: http://localhost:8000/docs
echo echo.
echo echo Press any key to close this window...
echo pause >nul
) > start_application.bat

echo.
echo ========================================
echo  Setup Complete! 🎉
echo ========================================
echo.
echo ✅ Backend setup completed successfully
echo ✅ Frontend setup completed successfully
echo ✅ Configuration files created
echo ✅ Run scripts created
echo.
echo 🚀 To start the application:
echo    Double-click: scripts\start_application.bat
echo.
echo 🛠️ Manual startup:
echo    Backend:  scripts\run_backend.bat
echo    Frontend: scripts\run_frontend.bat
echo.
echo 🌐 Application URLs:
echo    Frontend: http://localhost:3000
echo    Backend:  http://localhost:8000
echo    API Docs: http://localhost:8000/docs
echo.
echo 📝 Test the system with sample data:
echo    Education: B.Tech
echo    Skills: Python, SQL, Machine Learning
echo    Sectors: Technology
echo    Location: Telangana
echo.
echo ========================================
echo Ready for Smart India Hackathon 2025! 🏆
echo ========================================
echo.
pause