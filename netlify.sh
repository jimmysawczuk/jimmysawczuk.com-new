#!/bin/sh

set -e

wget https://github.com/jimmysawczuk/tmpl/releases/download/v2.0.0/tmpl-v2.0.0-linux-amd64
mv tmpl-v2.0.0-linux-amd64 $GOPATH/bin/tmpl
chmod +x $GOPATH/bin/tmpl

wget https://github.com/jimmysawczuk/scm-status/releases/download/v2.2.0/scm-status-v2.2.0-linux-amd64
mv scm-status-v2.2.0-linux-amd64 $GOPATH/bin/scm-status
chmod +x $GOPATH/bin/scm-status

export PATH=$GOPATH/bin:$PATH

scm-status -out=REVISION.json
yarn dark-mode
tmpl
yarn build
cp -R img *.png *.xml *.ico REVISION.json manifest.json _redirects _headers public/
