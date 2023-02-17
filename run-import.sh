#!/bin/bash

# Define variables
export URL="http://3.108.44.52:8080/api/v2/import-scan/"
export TOKEN="e596a9d6f75615c59f0a80b4afa7acf695e8df61"
export SEVERITY="Info"
export #SCAN_TYPE="oast-results Scan"
export #FILE_PATH="oast-results.json"
export PRODUCT_NAME="Capstone Project"
export ENGAGEMENT_NAME="Bandit-Scan"
export ENGAGEMENT_ID="1"

curl -X 'POST' \
  'http://3.108.44.52:8080/api/v2/import-scan/' \
  -H 'accept: application/json' \
  -H 'Content-Type: multipart/form-data' \
  -H 'Authorization: Token e596a9d6f75615c59f0a80b4afa7acf695e8df61' \
  -F 'minimum_severity=Info' \
  -F 'active=true' \
  -F 'verified=true' \
  -F 'scan_type=Bandit Scan' \
  -F 'file=@bandit-results.json;type=application/json' \
  -F 'product_name=Capstone Project' \
  -F 'engagement_name=Bandit-Scan' \
  -F 'engagement=1' \
  -F 'auto_create_context=true' \
  -F 'close_old_findings=false' \
  -F 'close_old_findings_product_scope=false' \
  -F 'push_to_jira=false' \
  -F 'create_finding_groups_for_all_findings=true'

curl -X 'POST' \
  'http://3.108.44.52:8080/api/v2/import-scan/' \
  -H 'accept: application/json' \
  -H 'Content-Type: multipart/form-data' \
  -H 'Authorization: Token e596a9d6f75615c59f0a80b4afa7acf695e8df61' \
  -F 'minimum_severity=Info' \
  -F 'active=true' \
  -F 'verified=true' \
  -F 'scan_type=Retire.js Scan' \
  -F 'file=@retirejs-report.json;type=application/json' \
  -F 'product_name=Capstone Project' \
  -F 'engagement_name=Retire.js Scan' \
  -F 'engagement=2' \
  -F 'close_old_findings=false' \
  -F 'close_old_findings_product_scope=false' \
  -F 'push_to_jira=false' \
  -F 'create_finding_groups_for_all_findings=true'
