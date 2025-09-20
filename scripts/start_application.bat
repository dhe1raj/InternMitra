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