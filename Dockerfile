FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y fortune-mod cowsay netcat-openbsd && \
    apt-get clean

ENV PATH="/usr/games:${PATH}"

COPY wisecow.sh /app/wisecow.sh
WORKDIR /app

RUN sed -i 's/\r//' wisecow.sh

RUN chmod +x wisecow.sh

EXPOSE 4499

CMD ["./wisecow.sh"]