@echo off
color 6
if not exist "./content/csgo_mods" mkdir "./content/csgo_mods"
echo Starting CS:2 Workshop Tools - Raytracing Mode...
start "" "game\bin\win64\csgocfg.exe" -gpuraytracing
timeout /t 5 /nobreak
exit
