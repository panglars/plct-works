#!/bin/bash

USERNAME="panglars" 

API_URL="https://api.github.com/search/issues?q=author:$USERNAME+is:pr&per_page=100"
USER_AGENT="Bash"

response=$(curl -s -H "User-Agent: $USER_AGENT" "$API_URL")

all_prs=$(echo "$response" | jq -c '.items[] | {title: .title, url: .html_url, state: .state, repo: .repository_url}')

echo "$all_prs" | while read -r pr; do
    title=$(echo "$pr" | jq -r '.title')
    pr_url=$(echo "$pr" | jq -r '.url')
    echo "- [$title]($pr_url)"
done
