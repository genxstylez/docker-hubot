## Getting started

This is to build hubot with slack integration and the example hubot script included from yeoman generator

Notes:
* ```example.coffee``` ```badgers``` does't work great with channels that have multiple ```hubots``` listening since the response contains ```badgers``` and it seems to create a loop and slack will issue a rate limit error.

1. ```docker build .```
2. ```docker run -it --rm -e HUBOT_SLACK_TOKEN=... IMAGE```
3. Go to slack and message ```hubot```
  * ```hubot ping```
  * ```hubot badgers```
