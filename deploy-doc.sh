#!/bin/bash

: ${KEY?'missing github private key do deploy docker run -e KEY=XXXX'}

[ -n "$DEBUG" ] && echo debug on ... && set -x

: ${COMMIT_NAME:=jenkins}
: ${COMMIT_EMAIL:=jenkins@sequenceiq.com}
: ${PROJECT:=cloudbreak}

# private github key comes from env variable KEY
# docker run -e KEY=XXXX
mkdir -p /root/.ssh
chmod 700 /root/.ssh

# switch off debug to hide private key
set +x
echo $KEY|base64 -d> /root/.ssh/id_rsa
[ -n "$DEBUG" ] && echo debug on ... && set -x

chmod 600 /root/.ssh/id_rsa

# saves githubs host to known_hosts
ssh -T -o StrictHostKeyChecking=no  git@github.com

git config --global user.name "$COMMIT_NAME"
git config --global user.email "$COMMIT_EMAIL"

rm -rf /tmp/$PROJECT
git clone git@github.com:sequenceiq/$PROJECT.git /tmp/$PROJECT
mkdir /tmp/$PROJECT-temp
cd /tmp/$PROJECT
mkdocs build
cp -R /tmp/cloudbreak/site /tmp/$PROJECT-temp
rm -rf site/
git checkout gh-pages
cp -R /tmp/$PROJECT-temp/site/ .
git add -A
git commit -m "updated documentation"
git push origin gh-pages --force
