#!/bin/bash

# Define the root directory of asyncapi documents
ASYNCAPI_DIR="asyncapi"
# Define the final output asyncapi.yaml file
CENTRAL_ASYNCAPI_FILE="asyncapi/asyncapi.yaml"

# Start the asyncapi.yaml content
cp "$ASYNCAPI_DIR/info.yaml" $CENTRAL_ASYNCAPI_FILE
echo "" >> $CENTRAL_ASYNCAPI_FILE

# Add servers
echo "servers:" >> $CENTRAL_ASYNCAPI_FILE
sed 's/^/ /' "$ASYNCAPI_DIR/servers.yaml" >> $CENTRAL_ASYNCAPI_FILE
echo "" >> $CENTRAL_ASYNCAPI_FILE
echo "Basic asyncapi structure created."

# Add channels content
echo "Adding channels content..."
echo "channels:" >> $CENTRAL_ASYNCAPI_FILE

for file in "$ASYNCAPI_DIR/components/channels"/*.yaml; do
  if [ -e "$file" ]; then
    filename=$(basename -- "$file")
    channelname="${filename%.*}"
    echo "  Adding channel: $channelname"
    echo "  $channelname:" >> $CENTRAL_ASYNCAPI_FILE
    # Indent the content of the channel file and append to CENTRAL_ASYNCAPI_FILE
    sed 's/^/    /' "$file" >> $CENTRAL_ASYNCAPI_FILE
    echo "" >> $CENTRAL_ASYNCAPI_FILE
  else
    echo "No channel files found."
  fi
done
echo "" >> $CENTRAL_ASYNCAPI_FILE

# Add operations content
echo "Adding operations content..."
echo "operations:" >> $CENTRAL_ASYNCAPI_FILE
for file in "$ASYNCAPI_DIR/components/operations"/*.yaml; do
  if [ -e "$file" ]; then
    filename=$(basename -- "$file")
    operationname="${filename%.*}"
    echo "  Adding operation: $operationname"
    # echo "    $operationname:" >> $CENTRAL_ASYNCAPI_FILE
    # Indent the content of the operation file and append to CENTRAL_ASYNCAPI_FILE
    sed 's/^/     /' "$file" >> $CENTRAL_ASYNCAPI_FILE
    echo "" >> $CENTRAL_ASYNCAPI_FILE

  else
    echo "No operation files found."
  fi
done
echo "" >> $CENTRAL_ASYNCAPI_FILE

# Add shemas content
echo "Adding schemas content..."
echo "components:" >> $CENTRAL_ASYNCAPI_FILE
echo "  schemas:" >> $CENTRAL_ASYNCAPI_FILE
for file in "$ASYNCAPI_DIR/components/schemas"/*.yaml; do
  if [ -e "$file" ]; then
    filename=$(basename -- "$file")
    schemaname="${filename%.*}"
    echo "  Adding schema: $schemaname"
    echo "    $schemaname:" >> $CENTRAL_ASYNCAPI_FILE
    # Indent the content of the schema file and append to CENTRAL_ASYNCAPI_FILE
    sed 's/^/      /' "$file" >> $CENTRAL_ASYNCAPI_FILE
    echo "" >> $CENTRAL_ASYNCAPI_FILE

  else
    echo "No schema files found in $SCHEMAS_DIR."
  fi
done
echo "" >> $CENTRAL_ASYNCAPI_FILE

echo "asyncapi.yaml generated successfully."
