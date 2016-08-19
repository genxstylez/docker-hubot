#!/usr/bin/env sh
set -e

if [ ! -r "external-scripts.json" ]; then
    echo "Generating external-scripts.json...";

    if [ ! -z "$HUBOT_EXTERNAL_SCRIPTS" ]; then
        echo "Using HUBOT_EXTERNAL_SCRIPTS to generate...";

        echo $HUBOT_EXTERNAL_SCRIPTS | xargs node -e "console.log(JSON.stringify(process.argv.slice(1), null, '\t'))" > external-scripts.json;
    else
        echo "Auto-detecting from installed npm modules...";

        echo $(
          for package in $(grep node_modules/*/package.json -e peerDependencies | awk '{print $1}' | sort -u | sed "s/:$//")
          do
            node -e "(function(package) {package.peerDependencies && console.log(package.name)})(JSON.parse(require('fs').readFileSync(process.argv[1])))" $package
          done) | xargs node -e "console.log(JSON.stringify(process.argv.slice(1), null, '\t'))" > external-scripts.json
    fi
fi

exec "$@"
