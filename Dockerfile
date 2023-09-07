FROM alpine
COPY _opt /opt/homebrew
VOLUME /opt/homebrew
CMD ["/bin/sh", "-c", "trap 'exit 147' TERM; tail -f /dev/null & wait ${!}"]
