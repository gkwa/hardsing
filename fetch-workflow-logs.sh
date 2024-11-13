#!/usr/bin/env bash

set -euo pipefail

# Workflow run ID
RUN_ID="11826642215"
REPO="gkwa/hardsing"

# Create logs directory
mkdir -p workflow-logs

# Fetch all jobs for the workflow run
echo "Fetching jobs for workflow run ${RUN_ID}..."
gh run view "$RUN_ID" --repo "$REPO" --json jobs --jq '.jobs[] | {name: .name, status: .status, id: .databaseId}' >workflow-logs/jobs.json

# Download logs for each job
while IFS= read -r job; do
    name=$(echo "$job" | jq -r '.name')
    id=$(echo "$job" | jq -r '.id')
    status=$(echo "$job" | jq -r '.status')

    echo "Downloading logs for job: $name (ID: $id, Status: $status)"
    gh run view --repo "$REPO" --job "$id" --log >"workflow-logs/${name// /_}.log"
done < <(jq -c '.' workflow-logs/jobs.json)

echo "Logs downloaded to workflow-logs directory"
ls -l workflow-logs/
