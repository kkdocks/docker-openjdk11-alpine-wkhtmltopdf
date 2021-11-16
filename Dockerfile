FROM surnet/alpine-wkhtmltopdf:3.9-0.12.5-full as wkhtmltopdf
FROM nekoimi/openjdk:11-alpine3.10

LABEL maintainer="nekoimi <nekoimime@gmail.com>"

COPY fonts/ /usr/share/fonts/

# Install dependencies for wkhtmltopdf
RUN apk add --no-cache \
  libstdc++ \
  libx11 \
  libxrender \
  libxext \
  libssl1.1 \
  ca-certificates \
  fontconfig \
  freetype \
  ttf-dejavu \
\
&& fc-cache -f \
\
# Clean up when done
&& rm -rf /tmp/*

# Copy wkhtmltopdf files from docker-wkhtmltopdf image
COPY --from=wkhtmltopdf /bin/wkhtmltopdf /bin/wkhtmltopdf
COPY --from=wkhtmltopdf /bin/wkhtmltoimage /bin/wkhtmltoimage
COPY --from=wkhtmltopdf /bin/libwkhtmltox* /bin/

VOLUME /usr/share/fonts/chinese