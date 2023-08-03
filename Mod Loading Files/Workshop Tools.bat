@echo off
color 6
if not exist "./content/csgo_mods" mkdir "./content/csgo_mods"
echo Starting CS:2 Workshop Tools...
start "" "game\bin\win64\csgocfg.exe" -nocustomermachine -lightmapCPU
timeout /t 5 /nobreak
exit