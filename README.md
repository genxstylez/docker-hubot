# docker-hubot
Easy to use Hubot via docker onbuild style building

Pre-installed ```hubot``` modules:
* ```hubot-ping```
* ```hubot-diagnostics```
* ```hubot-help```
* ```hubot-redis-brain```

## Getting started
1. Add your code dependencies
  * ```scripts/```: Custom hubot scripts
  * ```package.json```: Any dependencies you require. ie External hubot scripts like ```hubot-slack```
2. ```docker build .```
3. ```docker run ... -e HUBOT_NAME= -e HUBOT_ADAPTER= IMAGE```
  * ```HUBOT_NAME```: The name of the hubot (default: ```hubot```)
  * ```HUBOT_ADAPTER```: The adapter to use (default: ```shell```)
  * ```HUBOT_EXTERNAL_SCRIPTS```: Space seperated list of hubot modules.  If this is not set, the image will automatically generate this list based on installed npm packages that have ```hubot``` as a ```peerDependencies```.
  (default: Auto-detect from installed packages)

## Examples
Check out [examples](examples) for a slackbot to get started.
