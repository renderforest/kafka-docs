# Renderforest AsyncAPI Kafka Documentation

## Overview

This project provides centralized documentation for Kafka topics used across multiple Renderforest microservices using AsyncAPI. It includes both servers, channels, operations, schemas specific documents.

## Project Structure
```
kafka-docs/
├── asyncapi/
| ├── servers.yaml # Common servers.
| ├── components/ # All components which are channels, operations, schemas are inside this directory.
| ├── components/channels # every file in this folder is about specific channel. Use **kebab-case** for file naming and end with **topic** suffix.
| ├── components/operations # every file in this folder is about operations which belongs to specific channel. Use **kebab-case** for file naming. Start with channel name and end with **operations** suffix. 
| ├── components/schemas # every file in this folder is about one specific schema. Use **PascalCase** for file naming. 
├── scripts/
| ├── mergeDocuments.sh # Script to merge AsyncAPI documents.
| ├── buildHtmlDocs.sh # Script to generate HTML page for AsyncAPI document.
├── package.json # Scripts, dependencies.
└── README.md # Project documentation.
```

## Install Prerequisites

**yq** - a YAML processor that will help you manipulate YAML files
**Node.js** >= v18
**npm**


## Merging AsyncAPI Documents

npm run merge-docs

## Create visualization

npm run build-html-doc

## Run project with one command
npm run start

## To Improve
To contribute on this documentation here are some improvements which can be done:
* use [asyncapi-react](https://github.com/asyncapi/asyncapi-react) to generating documentation. For now the generation of the documents is done using html-template, but it is preferable to use asyncapi-react. There is an issue on react template, we will start to use it when the issue will be fixed. [Issue 956](https://github.com/asyncapi/asyncapi-react/issues/956)




