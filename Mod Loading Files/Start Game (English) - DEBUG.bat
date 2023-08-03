@echo off
color 6
echo Starting Counter-Strike: 2 - DEBUG MODE...
start "" "game\bin\win64\cs2.exe" -language english -condebug -novid -console -tools -nobots -insecure
timeout /t 5 /nobreak
exit