FROM busybox:1.29
ENV RCLONE_VERSION 1.45
RUN wget -O - "https://github.com/ncw/rclone/releases/download/v${RCLONE_VERSION}/rclone-v${RCLONE_VERSION}-linux-amd64.zip" \
		| unzip -p - "rclone-v${RCLONE_VERSION}-linux-amd64/rclone" > /rclone \
	&& chmod +x /rclone

FROM gcr.io/distroless/base
COPY --from=0 /rclone /rclone
ENTRYPOINT ["/rclone"]
