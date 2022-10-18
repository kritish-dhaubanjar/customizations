#!/bin/bash

SESSION='trayt'
SESSION_EXISTS=$(tmux list-sessions | grep $SESSION)

API='api'
REDIS='redis'
CPAN_PORTAL='cpan-portal'
DATA_EXPORT='data-export'
MISCUTILITIES='miscutilities'
SCHOOL_PORTAL='school-portal'
CLINICIAN_PORTAL='clinician-portal'

API_PATH="/home/jin/lftechnology/trayt/api"
CPAN_PORTAL_PATH='/home/jin/lftechnology/trayt/cpan-portal'
DATA_EXPORT_PATH='/home/jin/lftechnology/trayt/data-export'
MISCUTILITIES_PATH='/home/jin/lftechnology/trayt/miscutilities'
SCHOOL_PORTAL_PATH='/home/jin/lftechnology/trayt/school-portal'
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

  tmux new-window -n $SCHOOL_PORTAL -c $SCHOOL_PORTAL_PATH -d
  tmux split-window -h -t $SCHOOL_PORTAL -c $SCHOOL_PORTAL_PATH -d

  tmux new-window -n $DATA_EXPORT -c $DATA_EXPORT_PATH -d
  tmux split-window -h -t $DATA_EXPORT -c $DATA_EXPORT_PATH -d

  tmux new-window -n $MISCUTILITIES -c $MISCUTILITIES_PATH -d
  tmux split-window -h -t $MISCUTILITIES -c $MISCUTILITIES_PATH -d
  
  tmux new-window -n $REDIS -d
fi

tmux attach-session -t $SESSION
