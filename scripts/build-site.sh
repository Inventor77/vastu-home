#!/usr/bin/env bash
# Rebuild site/: the mermaid-floorplan 3D viewer (GPL-3.0) with
# vastu-home.floorplan as its default plan.
set -euo pipefail
cd "$(dirname "$0")/.."

UPSTREAM=https://github.com/malarbase/mermaid-floorplan.git
COMMIT=ab2053df11ea09d8f3505a008b66bc5a2189d9ab
DIR=mermaid-floorplan # build checkout, git-ignored

[ -d "$DIR" ] || git clone "$UPSTREAM" "$DIR"
git -C "$DIR" checkout --quiet --force "$COMMIT"
mkdir -p "$DIR/vastu"
cp vastu-home.floorplan "$DIR/vastu/"
git -C "$DIR" apply "$PWD/scripts/viewer-default-plan.patch"

(
  cd "$DIR"
  npm install --ignore-scripts --no-audit --no-fund
  echo | npm run langium:generate
  for w in floorplan-common floorplan-language floorplan-3d-core floorplan-viewer-core floorplan-viewer; do
    npm run build -w "$w"
  done
)

rm -rf site/assets site/index.html
cp -R "$DIR/floorplan-viewer/dist/." site/
cp "$DIR/floorplan-viewer/LICENSE" site/LICENSE-GPL-3.0.txt
cp vastu-home.floorplan site/
cp scripts/viewer-default-plan.patch site/
