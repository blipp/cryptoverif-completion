#!/bin/bash

RLWRAP_HIST_FILE="${RLWRAP_HIST_FILE:-${HOME}/.rlwrap_hist_cryptoverif}"
RLWRAP_GLOBAL_COMPLETION_FILE="${RLWRAP_GLOBAL_COMPLETION_FILE:-${HOME}/.rlwrap_cryptoverif_completion.conf}"
RLWRAP_LOCAL_COMPLETION_FILE="${RLWRAP_LOCAL_COMPLETION_FILE:-./rlwrap_cryptoverif_completion.conf}"

RLWRAP_CHARS=$'--break-chars \"(){}[],+=&^%$#@\"\";|\\\"'
RLWRAP_CMD="rlwrap --history-filename ${RLWRAP_HIST_FILE} ${RLWRAP_CHARS} --file ${RLWRAP_GLOBAL_COMPLETION_FILE} --file ${RLWRAP_LOCAL_COMPLETION_FILE} --complete-filenames --prompt-colour"
