FROM ubuntu:latest
RUN apt-get update &&  apt-get install -y xmlstarlet curl wget
# Copy Script
ADD RSSscript.sh /usr/local/bin/RSSscript.sh
# Execute the sxcript
RUN chmod +x /usr/local/bin/RSSscript.sh
CMD ["/usr/local/bin/RSSscript.sh"]
EXPOSE 443
