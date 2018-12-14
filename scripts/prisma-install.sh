#!/bin/bash

if [[ $CIRCLE_BRANCH == "client-alpha" ]]; then
  sudo yarn global add prisma@alpha
elif [[ $CIRCLE_BRANCH == "client-beta" ]]; then
  sudo yarn global add prisma@beta
else
  sudo yarn global add prisma
fi