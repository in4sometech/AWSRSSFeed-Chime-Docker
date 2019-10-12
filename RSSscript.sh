#!/bin/sh
#RSS_URL=https://aws.amazon.com/new/feed/
RSS_URL=https://aws.amazon.com/about-aws/whats-new/recent/feed/
newsfeed=$(wget ${RSS_URL} -O - 2>/dev/null | xmlstarlet sel -t -m "/rss/channel/item" -n -v "title" -n -n)

echo "${newsfeed}" | while read line
do
   curl -X POST "https://hooks.chime.aws/incomingwebhooks/$tokencode" -H "Content-Type:application/json" --data "{\"Content\": \"$line\"}"
done
