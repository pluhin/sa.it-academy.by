#!/bin/bash
set -u

TODAY=$(date +%F)
YEAR=$(date +%Y)

echo "===================================================="
echo " Belarus daily report - ${TODAY}"
echo "===================================================="

echo
echo "--- 1. Is today a holiday in Belarus? ---"

HOLIDAY=""
if [ -n "${HOLIDAY_API_KEY:-}" ]; then
  RESP=$(curl -sS "https://holidayapi.com/v1/holidays?key=${HOLIDAY_API_KEY}&country=BY&year=${YEAR}" 2>/dev/null || true)
  HOLIDAY=$(echo "${RESP}" | tr '{' '\n' | grep -F "\"date\":\"${TODAY}\"" \
            | sed -n 's/.*"name":"\([^"]*\)".*/\1/p' | head -n1)
else
  RESP=$(curl -sS "https://date.nager.at/api/v3/PublicHolidays/${YEAR}/BY" 2>/dev/null || true)
  HOLIDAY=$(echo "${RESP}" | tr '{' '\n' | grep -F "\"date\":\"${TODAY}\"" \
            | sed -n 's/.*"localName":"\([^"]*\)".*/\1/p' | head -n1)
fi

if [ -n "${HOLIDAY}" ]; then
  echo "YES - today is a public holiday: ${HOLIDAY}"
else
  echo "No - regular working day."
fi

echo
echo "--- 2. Official exchange rates (NBRB) ---"

RESP=$(curl -sS "https://api.nbrb.by/exrates/rates?periodicity=0" 2>/dev/null || true)
OBJECTS=$(echo "${RESP}" | tr '{' '\n')

for CUR in USD EUR RUB PLN CNY; do
  LINE=$(echo "${OBJECTS}" | grep -F "\"Cur_Abbreviation\":\"${CUR}\"" | head -n1)
  if [ -z "${LINE}" ]; then
    printf '%-4s rate not available\n' "${CUR}"
    continue
  fi
  SCALE=$(echo "${LINE}" | sed -n 's/.*"Cur_Scale":\([0-9]*\).*/\1/p')
  RATE=$(echo "${LINE}"   | sed -n 's/.*"Cur_OfficialRate":\([0-9.]*\).*/\1/p')
  NAME=$(echo "${LINE}"   | sed -n 's/.*"Cur_Name":"\([^"]*\)".*/\1/p')
  printf '%-4s %10s BYN for %s %s\n' "${CUR}" "${RATE}" "${SCALE}" "${NAME}"
done
