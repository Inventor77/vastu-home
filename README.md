# Vastu Home

A two-storey Vastu home plan (24'7" x 34'5" plot, SE-facing, road on the
south) as a [mermaid-floorplan](https://github.com/malarbase/mermaid-floorplan)
file, with an interactive 3D viewer site.

| Path | What it is |
| --- | --- |
| `vastu-home.floorplan` | The plan: ground floor, first floor and roof. Edit this. |
| `source/Vastu-Home-Plan.html` | The original concept page the plan was converted from. |
| `renders/` | 2D plan of all floors and a 3D axonometric view. |
| `site/` | Built 3D viewer with this plan loaded. Deployed to Vercel. |
| `scripts/build-site.sh` | Rebuilds `site/` from the upstream viewer at a pinned commit. |

The header of `vastu-home.floorplan` lists how the plan differs from the
original page and which design fixes were made, each kept within the Vastu
rules the original page states.

## Rebuild and deploy

```bash
scripts/build-site.sh
vercel deploy
```

`site/` is committed, so a deploy needs no build step. Rebuild only after
changing the plan.

## Licence

The viewer in `site/` is GPL-3.0 (see `site/NOTICE.txt`). This is a concept
plan, not a sanctioned drawing: setbacks, structure and local bylaws are not
drawn.
