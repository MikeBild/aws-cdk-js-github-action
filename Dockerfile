FROM alpine:edge

LABEL name="aws-cdk-js-github-action"
LABEL version="1.0.0"
LABEL repository="https://github.com/mikebild/aws-cdk-js-github-action"
LABEL homepage="https://github.com/mikebild/aws-cdk-js-github-action"

LABEL "com.github.actions.name"="aws-cdk-js-github-action"
LABEL "com.github.actions.description"="GitHub Action using AWS CDK for JavaScript"
LABEL "com.github.actions.icon"="box"
LABEL "com.github.actions.color"="blue"

LABEL "maintainer"="Mike Bild <mike.bild@googlemail.com>"

RUN apk --no-cache add nodejs nodejs-npm
RUN npm install -g aws-cdk

COPY entrypoint.sh /entrypoint.sh
RUN ["chmod", "+x", "/entrypoint.sh"]
ENTRYPOINT ["/entrypoint.sh"]
CMD ["--help"]
