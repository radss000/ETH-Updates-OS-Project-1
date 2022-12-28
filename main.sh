#!/bin/bash

URL="https://www.cryptocompare.com/coins/eth/overview/USD"

# Download url
wget "$URL" -O webpage.html

# Extract interesting informations

PRICE=$(grep -oP 'data-price="\K[^"]+' webpage.html)
MARKET_CAP=$(grep -oP 'data-market-cap="\K[^"]+' webpage.html)
VOLUME_24H=$(grep -oP 'data-volume="\K[^"]+' webpage.html)
LOW_24H=$(grep -oP 'data-low="\K[^"]+' webpage.html)
HIGH_24H=$(grep -oP 'data-high="\K[^"]+' webpage.html)

# Calculate the price variation and average price
VARIATION=$(echo "$HIGH_24H-$LOW_24H" | bc -l)
AVG_PRICE=$(echo "($HIGH_24H+$LOW_24H)/2" | bc -l)

# CConfigration of the message to send to telegrm
MESSAGE="ETH current price: $PRICE
Market cap: $MARKET_CAP
Total 24h volume: $VOLUME_24H
Low/high 24h: $LOW_24H/$HIGH_24H
Price variation 24h: $VARIATION
Average price 24h: $AVG_PRICE"

# Setting of telegram 
API_TOKEN="5841286497:AAEeJCKSSdyh7GNpLjE59UoDdZi9g-uXydk"
CHAT_ID="1672450594"

# Send message 
curl -X POST "https://api.telegram.org/bot$API_TOKEN/sendMessage" \
     -d "chat_id=$CHAT_ID&text=$MESSAGE"

# Clean up
rm webpage.html
