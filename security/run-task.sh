dcos marathon app add <<EOF
{
  "id": "/${1}/basic-task-in-${1}",
  "backoffFactor": 1.15,
  "backoffSeconds": 1,
  "cmd": "python3 -m http.server 8080",
  "container": {
    "portMappings": [
      {
        "containerPort": 8080,
        "hostPort": 0,
        "protocol": "tcp",
        "servicePort": 10000
      }
    ],
    "type": "DOCKER",
    "volumes": [],
    "docker": {
      "image": "python:3",
      "forcePullImage": false,
      "privileged": false,
      "parameters": []
    }
  },
  "cpus": 0.5,
  "disk": 0,
  "instances": 1,
  "maxLaunchDelaySeconds": 300,
  "mem": 32,
  "gpus": 0,
  "networks": [
    {
      "mode": "container/bridge"
    }
  ],
  "requirePorts": false,
  "upgradeStrategy": {
    "maximumOverCapacity": 1,
    "minimumHealthCapacity": 1
  },
  "killSelection": "YOUNGEST_FIRST",
  "unreachableStrategy": {
    "inactiveAfterSeconds": 0,
    "expungeAfterSeconds": 0
  },
  "healthChecks": [],
  "fetch": [],
  "constraints": []
}
EOF
