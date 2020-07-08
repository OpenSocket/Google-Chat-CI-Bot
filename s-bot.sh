#!/bin/bash

#todo- parametarize all variables, create json object on the fly [https://stedolan.github.io/jq/].
webhook_url=""
CIRCLE_JOB="deploy-prod"
CIRCLE_PROJECT_REPONAME="CI-bot"
CIRCLE_BRANCH="master"
CIRCLE_TAG="1.0"
CIRCLE_USERNAME="sacOO7"
CIRCLE_BUILD_URL="https://circleci.com/gh/sacOO7/Pytest-BDD-Samples/3";


# error curl request
curl --header "Content-Type: application/json" \
--request POST \
--data "{\"cards\":[{\"header\":{\"title\":\"Oops. ${CIRCLE_JOB} failed.\",\"subtitle\":\"${CIRCLE_PROJECT_REPONAME}-${CIRCLE_BRANCH}\",\"imageUrl\":\"https://png.pngtree.com/svg/20170406/icon_failed__1325447.png\",\"imageStyle\":\"IMAGE\"},\"sections\":[{\"widgets\":[{\"keyValue\":{\"topLabel\":\"${CIRCLE_TAG}\",\"content\":\"Credits - ${CIRCLE_USERNAME}\"}}]},{\"widgets\":[{\"buttons\":[{\"textButton\":{\"text\":\"DETAILS\",\"onClick\":{\"openLink\":{\"url\":\"${CIRCLE_BUILD_URL}\"}}}}]}]}]}]}" \
"$webhook_url"

# success curl request
curl --header "Content-Type: application/json" \
--request POST \
--data "{\"cards\":[{\"header\":{\"title\":\"${CIRCLE_JOB} successful.\",\"subtitle\":\"${CIRCLE_PROJECT_REPONAME}-${CIRCLE_BRANCH}\",\"imageUrl\":\"https://png.pngtree.com/svg/20170510/success_404253.png\",\"imageStyle\":\"IMAGE\"},\"sections\":[{\"widgets\":[{\"keyValue\":{\"topLabel\":\"${CIRCLE_TAG}\",\"content\":\"Credits - ${CIRCLE_USERNAME}\"}}]},{\"widgets\":[{\"buttons\":[{\"textButton\":{\"text\":\"DETAILS\",\"onClick\":{\"openLink\":{\"url\":\"${CIRCLE_BUILD_URL}\"}}}}]}]}]}]}" \
"$webhook_url"