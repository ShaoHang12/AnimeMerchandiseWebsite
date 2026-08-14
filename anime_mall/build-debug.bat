@echo off
setlocal

set JAVA_HOME=C:\Program Files\Java\jdk-21.0.12
set "MAVEN_OPTS=--add-opens java.base/java.lang=ALL-UNNAMED --add-opens java.base/java.io=ALL-UNNAMED --add-opens java.base/java.util=ALL-UNNAMED"

set MAVEN_BIN=C:\Users\Admin?????\.m2\wrapper\dists\apache-maven-3.8.5-bin\5i5jha092a3i37g0paqnfr15e0\apache-maven-3.8.5\bin\mvn.cmd

cd /d D:\Study\Code\??\??????\??????\anime_mall

echo Running Maven build...
"%MAVEN_BIN%" clean package -DskipTests -X 2>&1
echo.
echo Build finished with exit code: %ERRORLEVEL%
pause
