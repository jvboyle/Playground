RETENTION="7"
ORIG_DIR="$(pwd)"
cd "$(dirname "$0")"
CUR_DIR="$(pwd)"
Remediation=N

umask 077 HCLauncher.jar


rm -r ./javacore.*
[[ -f "./sasg-gcm/policy_OS.xml" ]] && cp -f "./sasg-gcm/policy_OS.xml" .
[[ -f "./sasg-gcm/policy_docker.xml" ]] && cp -f "./sasg-gcm/policy_docker.xml" .

# Linux Check
/usr/bin/java -jar HCLauncher.jar -policy "$CUR_DIR/policy_OS.xml"

#Docker_Engine CHeck
/usr/bin/java -jar HCLauncher.jar -policy "$CUR_DIR/policy_docker.xml" -ecm
cp "$CUR_DIR/policy_docker_result.xml" ./sasg-gcm

#Remdiation Command
#Please Add IF/Then.....If Remediation=YES then run the following command
#/usr/bin/java -jar HCLauncher.jar -remedy "$CUR_DIR/policy_OS.xml" -llevel DEBUG

# OS Report
/usr/bin/java -jar HCLauncher.jar -policy "$CUR_DIR/policy_OS.xml"  -pr -report
cp "$CUR_DIR/policy_OS_result.xml" ./sasg-gcm

# Container Report
/usr/bin/java -jar HCLauncher.jar -policy "$CUR_DIR/policy_docker.xml"  -pr -report

##### Log Cleanup Example Log Name log10212019-134306.zip
find $CUR_DIR/logArchive -type f -name "log*-*.zip" -mtime +$RETENTION -exec rm -f {} \;

##### PDF reports cleanup
find $CUR_DIR/report -type f -name "*.pdf" -mtime +$RETENTION -exec rm -f {} \;

# Remove javacore files
find $CUR_DIR -type f -name "javacore.*.zip" -mtime +$RETENTION -exec rm -f {} \;

cd "${ORIG_DIR}"