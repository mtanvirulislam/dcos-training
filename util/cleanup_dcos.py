#!/usr/bin/env python3

import json
import requests
import time

print('cleaning up mesos cluster')

# get mesos slaves json
response = requests.get("http://master1-dcosce.node.keedio.cloud:5050/slaves")
todos = json.loads(response.text)

for slave in todos["slaves"]:

    slaveId = slave["id"]

    for role in slave["reserved_resources_full"]:

        for reserve in slave["reserved_resources_full"][role]:

            # Check if volume exists
            if "disk" in reserve:

                data = {
                  'slaveId': slaveId,
                  'volumes': "[" + json.dumps(reserve) + "]"
                }

                response = requests.post('http://master1-dcosce.node.keedio.cloud:5050/destroy-volumes', data=data)

                print(response)
                print("Destroyed volume from " + slaveId)
                time.sleep(1)

# get mesos slaves json
response = requests.get("http://master1-dcosce.node.keedio.cloud:5050/slaves")
todos = json.loads(response.text)

for slave in todos["slaves"]:

    slaveId = slave["id"]

    for role in slave["reserved_resources_full"]:

        if role != "slave_public":

            for reserve in slave["reserved_resources_full"][role]:

                data = {
                   'slaveId': slaveId,
                   'resources': "[" + json.dumps(reserve) + "]"
                }

                response = requests.post('http://master1-dcosce.node.keedio.cloud:5050/unreserve', data=data)
                print(response)
                print ("Unreserved resource from " + slaveId)
                time.sleep(1)

print("DONE")
