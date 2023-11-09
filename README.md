# gitea-runner-ci-demo

A gitea runner ci demo


### gitea runner
``` shell
docker run -itd \
    -e GITEA_INSTANCE_URL=<gitea-server> \
    -e GITEA_RUNNER_REGISTRATION_TOKEN=<gitea-runner-token> \
    -v /var/run/docker.sock:/var/run/docker.sock \
    --name gitea_runner \
    gitea/act_runner:latest

```