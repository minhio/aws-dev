#!/bin/bash
# source /home/glue_user/.bashrc

# override the default jupyter_start.sh that's in the glue image
# the difference is we are adding the ServerApp.disable_check_xsrf and ServerApp.allow_origin flag
# to the jupyter lab command, this is to fix the issue with VS Code not being able to connect to
# the jupyter server
# https://stackoverflow.com/questions/75343770/problem-with-kernel-creation-in-vscode-while-connected-to-remote-jupyter-server

if [[ ! "$?" -eq 1 ]]; then
    livy-server start
    if [[ -z ${DISABLE_SSL} ]]; then
        echo "Starting Jupyter with SSL"
        jupyter lab --ServerApp.disable_check_xsrf=True --ServerApp.allow_origin='*' --no-browser --ip=0.0.0.0 --allow-root --ServerApp.root_dir=/home/glue_user/workspace/jupyter_workspace/ --ServerApp.token='' --ServerApp.password='' --certfile=/home/glue_user/.certs/container_certs/my_key_store.pem --keyfile /home/glue_user/.certs/container_certs/my_key_store_key.key
    else
        echo "SSL Disabled"
        jupyter lab --ServerApp.disable_check_xsrf=True --ServerApp.allow_origin='*' --no-browser --ip=0.0.0.0 --allow-root --ServerApp.root_dir=/home/glue_user/workspace/jupyter_workspace/ --ServerApp.token='' --ServerApp.password=''
    fi
fi