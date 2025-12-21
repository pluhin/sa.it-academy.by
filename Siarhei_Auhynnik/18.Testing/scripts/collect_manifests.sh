
#!/usr/bin/env bash
set -euo pipefail
find . \
  -type f \( -name '*.yaml' -o -name '*.yml' -o -name '*.json' \) \
  -not -path '*/.git/*' -not -path '*/.github/*' \
  | sed 's|^\./||' | sort
















