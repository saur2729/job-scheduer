#!/bin/bash
source scripts/constants.sh
DIR_PATH="./mongo_dump/job-scheduler"

echol "${LCYAN}This script will restore the mongo database ${NC}job-scheduler${LCYAN} from the specified folder".
echol "${LCYAN}The data is restored from the path ${NC}<parent_folder>/mongo_dump/job-scheduler/"
echol "${LCYAN}It's always recommended to restore DB after git pull. ${NC}\n\n"

echol "${YELLOW}Checking the mongoDB run status...."

if pgrep -x "mongod" > /dev/null
then
    echol "${GREEN}MongoDB is running with PID ${NC} `pgrep mongod`"
    echol "${GREEN}Preparing to retore the database - job-scheduler"

    if [ -d ${DIR_PATH} ]; then
        
      if [ -z `ls -A ${DIR_PATH}` ]; then
        echol "${RED}The directory path - ${NC} ${DIR_PATH} ${RED}is empty. Cannot restore the data from the database."
        echol "${RED}Exiting now..."
      else
        echol "${YELLOW}Trying to restore the data now..."
        mongorestore --db job-scheduler mongo_dump/job-scheduler/
        echol "${GREEN}Restoe complete..."
        echol "${RED}Exiting the script now..."
      fi
    else
      echol "${RED} The directory doesn't exist - ${NC}mongo_dump/job-scheduler/"
    fi
else
    echol "${RED}MongoDB is not running. Please ensure the mongoDB is running before triggering this script."
    echol "${RED}Exiting the script now..."
    exit 1
fi
