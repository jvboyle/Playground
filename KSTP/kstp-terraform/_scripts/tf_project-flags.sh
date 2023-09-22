#!/bin/bash

if [[ -z "$@" ]]
    then
        echo >&2 "Missing required arguments '--env', --project' & '--tf_config' optional, --con_service & --customer"
        exit 1
fi

# Loop through arguments and process them
for arg in "$@"
do
    case $arg in
        --project=*)
        PROJECT="${arg#*=}"
        shift
        ;;
        --project)
        PROJECT="$2"
        shift
        shift
        ;;
        --customer=*)
        CUSTOMER="${arg#*=}"
        shift
        ;;
        --customer)
        CUSTOMER="$2"
        shift
        shift
        ;;
        --con_service=*)
        CON_SERVICE="${arg#*=}"
        shift
        ;;
        --con_service)
        CON_SERVICE="$2"
        shift
        shift
        ;;
        --env=*)
        ENV="${arg#*=}"
        shift
        ;;
        --env)
        ENV="$2"
        shift
        shift
        ;;
        --tf_config=*)
        TF_CONFIG="${arg#*=}"
        shift
        ;;
        --tf_config)
        TF_CONFIG="$2"
        shift
        shift
        ;;
        --tf_action=*)
        TF_ACTION="${arg#*=}"
        shift
        ;;
        --tf_action)
        TF_ACTION="$2"
        shift
        shift
        ;;
        -auto-approve)
        TF_ACTION="$TF_ACTION -auto-approve"
        shift
        ;;
    esac
done

if [[ -z "$TF_CONFIG" ]]
    then
        echo >&2 "Missing required argument '--tf_config'"
        exit 1
elif [[ -z "$ENV" ]]
    then
        echo >&2 "Missing required argumen '--env' example AP1,AG1,EU1"
        exit 1
elif [[ -z "$PROJECT" ]]
    then
        echo >&2 "Missing required argument '--project'"
        exit 1
fi