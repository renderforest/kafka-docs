rm -rf ./public
asyncapi generate fromTemplate asyncapi/asyncapi.yaml node_modules/@asyncapi/html-template -o ./public
