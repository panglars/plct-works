#!/bin/bash

REPO_URL="https://api.github.com/repos/ruyisdk/support-matrix/pulls?state=closed"
USER_AGENT="Bash"

response=$(curl -s -H "User-Agent: $USER_AGENT" "$REPO_URL")

merged_prs=$(echo "$response" | jq -c '[.[] | select(.merged_at != null)] | sort_by(.number) | .[]')

echo "$merged_prs" | while read -r pr; do
    title=$(echo "$pr" | jq -r '.title')
    pr_url=$(echo "$pr" | jq -r '.html_url')
    echo "- [$title]($pr_url)"
done
