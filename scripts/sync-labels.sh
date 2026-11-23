#!/usr/bin/env bash
# One-time label setup for the club's engineering repos.
# Creates each label, or updates its colour and description if it exists.
# Never deletes labels. Needs write access to each repo:
#   scripts/sync-labels.sh nexus-software nexus-dev-setup
set -euo pipefail
ORG=TalTech-Drone-Club

LABELS=(
  "area::handoff|1d76db|UAV to UGV handoff node (handoff/)"
  "area::perception|1d76db|Detection, pixel to lat/lon (perception/)"
  "area::ground-station|1d76db|Operator view (ground_station/)"
  "area::interfaces|1d76db|ICD: topics, messages and IDs shared between nodes"
  "area::simulation|1d76db|PX4 SITL, Gazebo, QGroundControl, ROS 2 setup"
  "area::ci|1d76db|colcon build, CI, GitHub repo and project setup"
  "security|b60205|Affects safety, secrets or access"
  "documentation|0075ca|Docs work; add the area the page is about"
  "needs-discussion|d876e3|Talk it through before anyone starts"
  "upstream|bfd4f2|Caused by PX4, ROS 2, Gazebo or another upstream project"
  "breaking::change|d93f0b|Changes topics, messages, IDs or setup others rely on"
  "good first issue|7057ff|Small, well described, good for a new member"
  "duplicate|cfd3d7|Already covered by another issue or PR"
  "dependencies|0366d6|Dependency updates (Dependabot)"
)

[ "$#" -gt 0 ] || { echo "usage: $0 repo [repo...]"; exit 1; }
for repo in "$@"; do
  for entry in "${LABELS[@]}"; do
    IFS='|' read -r name color desc <<< "$entry"
    gh label create "$name" --color "$color" --description "$desc" --force -R "$ORG/$repo"
  done
done
