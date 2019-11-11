#!/bin/bash

AGENT_CONF_FILE=$1

FLUME_CONF_DIR=${FLUME_CONF_DIR:-$FLUME_HOME/examples}
AGENT_CONF_FILE=${AGENT_CONF_FILE:-http-agent.properties}
FLUME_AGENT_NAME=${FLUME_AGENT_NAME:-AGENT1}
FLUME_CONF_FILE=${FLUME_CONF_DIR}/${AGENT_CONF_FILE}

[[ -z "${FLUME_AGENT_NAME}" ]] && { echo "FLUME_AGENT_NAME required"; exit 1; }

echo "Starting flume agent '${FLUME_AGENT_NAME}' with Configfile '${FLUME_CONF_FILE}'"

$FLUME_HOME/bin/flume-ng agent -n ${FLUME_AGENT_NAME} -c ${FLUME_CONF_DIR} -f ${FLUME_CONF_FILE} -Dflume.root.logger=INFO,console
