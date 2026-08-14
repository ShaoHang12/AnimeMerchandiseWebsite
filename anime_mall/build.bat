@echo off
REM ?? JAVA_HOME
set "JAVA_HOME=C:\Program Files\Java\jdk-21.0.12"

REM ?? Maven ??
set "MAVEN_HOME=%USERPROFILE%\.m2\wrapper\dists\apache-maven-3.8.5-bin\5i5jha092a3i37g0paqnfr15e0\apache-maven-3.8.5"

REM ?? Maven ??? settings.xml
"%MAVEN_HOME%\bin\mvn.cmd" %* -s "%USERPROFILE%\.m2\settings.xml"
