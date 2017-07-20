FROM alpine:3.5

RUN apk --no-cache update && apk --no-cache --update add ruby ruby-irb ruby-json ruby-rdoc ruby-rake bash ruby-bigdecimal ruby-io-console libstdc++ tzdata postgresql-client postgresql nodejs git openssl
#RUN apk add --update nodejs nodejs-npm && npm install npm@latest 
RUN apk --no-cache --update add --virtual build-dependencies build-base libxml2-dev libxslt-dev  ruby-dev libffi-dev postgresql-dev libc-dev linux-headers

COPY ./package.json /src/package.json
RUN cd /src
#RUN npm install
COPY  ./ /src

WORKDIR /src
#ENV DEBUG=*


CMD ["npm", "start"]
