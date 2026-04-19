#!/usr/bin/env bash
set -euo pipefail

TEMPLATE="${1:-templates/README.md.tpl}"
OUTPUT="${2:-README.md}"
SECTION_FILE=$(mktemp)
trap "rm -f $SECTION_FILE" EXIT

EXCLUDED_REPOS='["camilleislasse/memes","Guiziweb/sylius-migration-demo","tempestphp/100-million-row-challenge"]'
EXCLUDED_ORGS='["acseo"]'

gh api graphql -f query='
query {
  viewer {
    pullRequests(first: 99, orderBy: {field: CREATED_AT, direction: DESC}) {
      nodes {
        title
        url
        state
        repository { nameWithOwner isPrivate }
      }
    }
  }
}' --jq "
  [.data.viewer.pullRequests.nodes[]
    | select(.state != \"CLOSED\")
    | select(.repository.isPrivate == false)
    | select(.repository.nameWithOwner as \$n | $EXCLUDED_REPOS | index(\$n) | not)
    | select(.repository.nameWithOwner | split(\"/\")[0] as \$o | $EXCLUDED_ORGS | index(\$o) | not)
  ][0:15]
  | .[]
  | \"- [\(.title | gsub(\"^\\\\s+|\\\\s+$\"; \"\"))](\(.url)) on **\(.repository.nameWithOwner)** (\(if .state == \"MERGED\" then \"merged\" else \"open\" end))\"" > "$SECTION_FILE"

awk -v f="$SECTION_FILE" '
  /<!-- WORKING_ON -->/ {
    while ((getline line < f) > 0) print line
    close(f)
    next
  }
  { print }
' "$TEMPLATE" > "$OUTPUT"

echo "Generated: $OUTPUT"
