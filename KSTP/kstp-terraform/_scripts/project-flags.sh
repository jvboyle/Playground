#!/bin/bash

if [[ -z "$@" ]]
    then
        echo >&2 "Missing required arguments '--env', --project' & '--parse_stage' "
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
        --parse_stage)
        PARSE_STAGE="$2"
        shift
        shift
        ;;
        --gen_tf)
        GEN_TF="$2"
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
        --init)
        INIT="$2"
        shift
        shift
        ;;
    esac
done

echo "ENV is set to $ENV"

if [[ -z "$PROJECT" ]]
    then
        echo >&2 "Missing required argument '--project'"
        exit 1
elif [[ -z "$ENV" ]]
    then
        echo >&2 "Missing required argumen '--env' example AP1,AG1,EU1"
        exit 1
elif [[ -z "$PARSE_STAGE" ]]
    then
        echo >&2 "Missing required argument '--parse_stage' use 1 or 2 "
        exit 1
fi