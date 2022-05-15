#!/usr/bin/env bash
#Created by Artsiom Dziavitski

#COLORS
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;36m'
NC='\033[0m' # No Color

#ALIAS
shopt -s expand_aliases
alias echo="echo -e"
alias red_echo="echo '${RED}'"
alias green_echo="echo '${GREEN}'"
alias blue_echo="echo '${BLUE}'"
alias no_echo="echo '${NC}'"
###########


if (which git)
then {
	for origin in $(git remote)
	do
		git push -u "${origin}" --all
	done
	}
else {
		red_echo "No git in system"
		no_echo
	}
fi
exit 
