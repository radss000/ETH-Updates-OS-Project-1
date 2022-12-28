# ETH-Updates-OS-Project-1

This bash script is dmade to track the price of ETH on https://www.cryptocompare.com/coins/eth/overview/USD and send updates via Telegram.

# Requirements

wget: for downloading the webpage

grep: for extracting information from the webpage

curl: for sending messages via Telegram

bc: for performing mathematical calculations

# Usage

To use the script, simply run it at the desired frequency using a cron job.

Telegram Integration

To send updates via Telegram, you will need to set your Telegram API token and chat ID in the script. You can obtain your API token by creating a bot and chat ID by starting a conversation with the bot and asking it for the chat ID.

#Output

The script will send a message via Telegram with the following information:
-Current price of ETH

-Market cap of ETH

-Total 24h volume of ETH

-Low/high 24h of ETH

-Price variation 24h

-Average price 24h
