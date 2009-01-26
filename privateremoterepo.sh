#!/bin/sh

# privateremoterepo.sh - create remote GIT repository.
# Copyright (C) 2008  Will Harris
# 
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License along
# with this program; if not, write to the Free Software Foundation, Inc.,
# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

REPO_NAME=$1
REPO_SERVER='will@slice.shareyourpopcorn.com'
REPO_SERVER_GIT_PATH='/home/will/git'
REPO_SERVER_REPO_PATH="$REPO_SERVER_GIT_PATH/$REPO_NAME.git"
echo "Create bare repo at $REPO_SERVER:$REPO_SERVER_REPO_PATH"
ssh $REPO_SERVER "set +x &&
                     mkdir $REPO_SERVER_REPO_PATH && \
                     cd $REPO_SERVER_REPO_PATH &&
                     git --bare init"


echo "Setup remote"
git remote add origin "ssh://$REPO_SERVER$REPO_SERVER_REPO_PATH"
echo "Push"
git push origin master
