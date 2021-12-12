#!/bin/bash

SESSION='trayt'
SESSION_EXISTS=$(tmux list-sessions | grep $SESSION)

API='api'
REDIS='redis'
CPAN_PORTAL='cpan-portal'
CLINICIAN_PORTAL='clinician-portal'

API_PATH="/home/jin/lftechnology/trayt/api"
CPAN_PORTAL_PATH='/home/jin/lftechnology/trayt/cpan-portal'
CLINICIAN_PORTAL_PATH='/home/jin/lftechnology/trayt/clinician-portal'

if [ "$SESSION_EXISTS" = "" ]
then
  tmux new-session -s $SESSION -c $API_PATH -d

  tmux rename-window $API
  tmux split-window -h -t $API -c $API_PATH -d

  tmux new-window -n $CPAN_PORTAL -c $CPAN_PORTAL_PATH -d
  tmux split-window -h -t $CPAN_PORTAL -c $CPAN_PORTAL_PATH -d

  tmux new-window -n $CLINICIAN_PORTAL -c $CLINICIAN_PORTAL_PATH -d
  tmux split-window -h -t $CLINICIAN_PORTAL -c $CLINICIAN_PORTAL_PATH -d

  tmux new-window -n $REDIS -d
fi

tmux attach-session -t $SESSION
