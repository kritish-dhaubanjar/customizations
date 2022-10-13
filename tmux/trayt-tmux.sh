#!/bin/bash

SESSION='trayt'
SESSION_EXISTS=$(tmux list-sessions | grep $SESSION)

PROJECT_ROOT="$HOME/lftechnology/trayt/"
PROJECTS=($(ls -d "$PROJECT_ROOT"*))

if [ "$SESSION_EXISTS" = "" ]; then
  for i in ${!PROJECTS[@]}
  do
    PROJECT_PATH=${PROJECTS[$i]}
    PROJECT_NAME=$(basename $PROJECT_PATH)

    if [ $i = 0 ]; then
      tmux new-session -s $SESSION -c $PROJECT_PATH -d
      tmux rename-window $PROJECT_NAME
    else
      tmux new-window -n $PROJECT_NAME -c $PROJECT_PATH -d
    fi

    tmux split-window -h -t $PROJECT_NAME -c $PROJECT_PATH -d
  done
fi

tmux attach-session -t $SESSION
