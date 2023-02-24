#!/bin/bash

# Define variables
export URL="http://3.108.44.52:8080/api/v2/import-scan/"
export TOKEN="e596a9d6f75615c59f0a80b4afa7acf695e8df61"
export X-CSRFTOKEN="xjzuPkDwJQJ2MYCypdA9LTVWD26zBxkAjMoiZeUWNucFpk9mtm7cWhGPJI4HjaCT"
export SEVERITY="Info"
export #SCAN_TYPE="oast-results Scan"
export #FILE_PATH="oast-results.json"
export PRODUCT_NAME="Test product"
export ENGAGEMENT_NAME="test_bandit-scan"
export ENGAGEMENT_ID="3"
export file="scan name.xml"

echo '\nprinting path'
echo $PATH

pip install bandit-sarif-formatter

echo 'printing bandit version from relative path'
bandit-sarif-formatter --version

echo 'printing bandit version from absolute path'
/usr/local/bin/bandit-sarif-formatter --version


bandit-sarif-formatter -o bandit-results.sarif bandit-results.json
ls -l bandit-results.sarif bandit-results.json

echo $file
echo 'Before Bandit Scan'

curl -X 'POST' \
  'http://3.108.44.52:8080/api/v2/import-scan/' \
  -H 'accept: application/json' \
  -H 'Content-Type: multipart/form-data' \
  -H 'Authorization: Token e596a9d6f75615c59f0a80b4afa7acf695e8df61' \
  -H 'X-CSRFToken: CSRFToken' \
  -F 'minimum_severity=Info' \
  -F 'active=true' \
  -F 'verified=true' \
  -F 'scan_type=Bandit Scan' \
  -F 'file=@bandit-results.sarif;type=application/sarif' \
  -F 'product_name=Test product' \
  -F 'engagement_name=test_bandit-scan' \
  -F 'engagement=3' \
  -F 'auto_create_context=true' \
  -F 'close_old_findings=false' \
  -F 'close_old_findings_product_scope=false' \
  -F 'push_to_jira=true' \
  -F 'create_finding_groups_for_all_findings=true'
  
curl -X PUT \
  -H "Content-Type: application/json" \
  -H "Authorization: Token e596a9d6f75615c59f0a80b4afa7acf695e8df61" \
  -d '{"jira_epic_name": "bandit-scan"}' \
  https://http://3.108.44.52:8080/api/v2/jira_finding_mappings/10011/ \
  -H 'accept: application/json' \
  -H 'Content-Type: application/json' \
  -H 'X-CSRFToken: CSRFToken'


echo '\n'
echo 'Before Retire JS Scan'

curl -X 'POST' \
  'http://3.108.44.52:8080/api/v2/import-scan/' \
  -H 'accept: application/json' \
  -H 'Content-Type: multipart/form-data' \
  -H 'Authorization: Token e596a9d6f75615c59f0a80b4afa7acf695e8df61' \
  -H 'X-CSRFToken: CSRFToken' \
  -F 'minimum_severity=Info' \
  -F 'active=true' \
  -F 'verified=true' \
  -F 'scan_type=Retire.js Scan' \
  -F 'file=@retirejs-report.json;type=application/json' \
  -F 'product_name=Test product' \
  -F 'engagement_name=test-retire.js-scan' \
  -F 'engagement=4' \
  -F 'close_old_findings=false' \
  -F 'close_old_findings_product_scope=false' \
  -F 'push_to_jira=true' \
  -F 'create_finding_groups_for_all_findings=true'
  
  echo '\n'
  echo 'Before Nikito Scan'
  
  curl -X 'POST' \
    'http://3.108.44.52:8080/api/v2/import-scan/' \
    -H 'accept: application/json' \
    -H 'Content-Type: multipart/form-data' \
    -H 'Authorization: Token e596a9d6f75615c59f0a80b4afa7acf695e8df61' \
    -H 'X-CSRFToken: CSRFToken' \
    -F 'minimum_severity=Info' \
    -F 'active=true' \
    -F 'verified=true' \
    -F 'scan_type=Nikto Scan' \
    -F 'file=@scan.xml;type=text/xml' \
    -F 'product_name=Test product' \
    -F 'engagement_name=Nikto Scan' \
    -F 'engagement=8' \
    -F 'close_old_findings=false' \
    -F 'close_old_findings_product_scope=false' \
    -F 'push_to_jira=true' \
    -F 'create_finding_groups_for_all_findings=true'
  
  
  echo 'Before NMAP Scan'
    
  curl -X 'POST' \
    'http://3.108.44.52:8080/api/v2/import-scan/' \
    -H 'accept: application/json' \
    -H 'Content-Type: multipart/form-data' \
    -H 'Authorization: Token e596a9d6f75615c59f0a80b4afa7acf695e8df61' \
    -H 'X-CSRFToken: CSRFToken' \
    -F 'minimum_severity=Info' \
    -F 'active=true' \
    -F 'verified=true' \
    -F 'scan_type=Nmap Scan' \
    -F 'file=@nmap-results.xml;type=text/xml' \
    -F 'product_name=Test product' \
    -F 'engagement_name=NMAP Scan19' \
    -F 'engagement=19' \
    -F 'close_old_findings=false' \
    -F 'close_old_findings_product_scope=false' \
    -F 'push_to_jira=true' \
    -F 'create_finding_groups_for_all_findings=true'
    -X PUT \
    -H "Content-Type: application/json" \
    -H "Authorization: Token e596a9d6f75615c59f0a80b4afa7acf695e8df61" \
    -d '{"jira_epic_name": "NMAP"}' \
    https://http://3.108.44.52:8080/api/v2/jira_finding_mappings/10011/ \
    -H 'accept: application/json' \
    -H 'Content-Type: application/json' \
    -H 'X-CSRFToken: CSRFToken' 
    
  echo '\n'
  
  echo 'Before NMAP Scan'
    
  curl -X 'POST' \
    'http://3.108.44.52:8080/api/v2/import-scan/' \
    -H 'accept: application/json' \
    -H 'Content-Type: multipart/form-data' \
    -H 'Authorization: Token e596a9d6f75615c59f0a80b4afa7acf695e8df61' \
    -H 'X-CSRFToken: CSRFToken' \
    -F 'minimum_severity=Info' \
    -F 'active=true' \
    -F 'verified=true' \
    -F 'scan_type=Trivy Scan' \
    -F 'file=@trivy-results.json;type=application/json' \
    -F 'product_name=Test product' \
    -F 'engagement_name=Trivy Scan' \
    -F 'engagement=21' \
    -F 'close_old_findings=false' \
    -F 'close_old_findings_product_scope=false' \
    -F 'push_to_jira=true' \
    -F 'create_finding_groups_for_all_findings=true'
