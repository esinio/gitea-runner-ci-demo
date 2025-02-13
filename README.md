# gitea-runner-ci-demo

A gitea runner ci demo


### gitea runner
``` shell
docker run -itd \
    -e GITEA_RUNNER_NAME=<gitea-runner-name> \
    -e GITEA_INSTANCE_URL=<gitea-server> \
    -e GITEA_RUNNER_REGISTRATION_TOKEN=<gitea-runner-token> \
    -v /var/run/docker.sock:/var/run/docker.sock \
    --name gitea_runner \
    gitea/act_runner:latest

```

``` shell
docker run \
    -v $PWD/config.yaml:/config.yaml \
    -v $PWD/data:/data \
    -v $PWD/cache:/root/.cache \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -e CONFIG_FILE=/config.yaml \
    -e GITEA_INSTANCE_URL=https://gitea.example.com/ \
    -e GITEA_RUNNER_REGISTRATION_TOKEN=mytoken \
    -e GITEA_RUNNER_NAME=local-cached \
    -p 18000:18000 \
    -d gitea/act_runner:nightly
```
