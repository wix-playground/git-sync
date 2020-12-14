#!/bin/sh
GIT_SYNC_PASSWORD=`cat /configs/git-token.secret`
export GIT_SYNC_PASSWORD
/git-sync
