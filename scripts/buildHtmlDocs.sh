rm -rf ./public
asyncapi generate fromTemplate asyncapi/asyncapi.yaml @asyncapi/html-template@2.3.5 -o ./public