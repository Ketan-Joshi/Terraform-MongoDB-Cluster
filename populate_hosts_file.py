#!/usr/bin/env python3

import json
import sys
import os
import time

data = json.load(sys.stdin)

replica_set_name = sys.argv[1]
mongo_database = sys.argv[2]
mongo_username = sys.argv[3]
mongo_pasword = sys.argv[4]
domain_name = sys.argv[5]
custom_domain = sys.argv[6]

if custom_domain:
    config = {"_id": replica_set_name, "members": [{ "_id": 0, "host": "mongo1"+domain_name+":27017", "priority": 1000 }]}

    secondary_nodes = []

    for reservation in data['Reservations']:
        private_ip = reservation["Instances"][0]["PrivateIpAddress"]
        tags = reservation["Instances"][0]["Tags"]
        for tag in tags:
            if tag["Key"] == "Name":
                node_index = tag["Value"][-1]
                secondary_node_without_dns = "mongo{0}".format(str(int(node_index)+1))
                secondary_node_with_dns = secondary_node_without_dns+domain_name
                config["members"].append({"_id": int(node_index), "host": secondary_node_with_dns+":27017", "priority": 0.5})
                with open('/etc/hosts', 'a') as f:
                    secondary_nodes.append([secondary_node_with_dns, False])
                    f.writelines('{0} '.format(private_ip)+secondary_node_with_dns+'\n')

    allPassed = False
else:
    config = {"_id": replica_set_name, "members": [{ "_id": 0, "host": "mongo1:27017", "priority": 1000 }]}

    secondary_nodes = []

    for reservation in data['Reservations']:
        private_ip = reservation["Instances"][0]["PrivateIpAddress"]
        tags = reservation["Instances"][0]["Tags"]
        for tag in tags:
            if tag["Key"] == "Name":
                node_index = tag["Value"][-1]
                secondary_node_without_dns = "mongo{0}".format(str(int(node_index)+1))
                config["members"].append({"_id": int(node_index), "host": secondary_node_without_dns+":27017", "priority": 0.5})
                with open('/etc/hosts', 'a') as f:
                    secondary_nodes.append([secondary_node_without_dns, False])
                    f.writelines('{0} '.format(private_ip)+secondary_node_without_dns+'\n')

    allPassed = False   

while allPassed != True:
    time.sleep(5)
    for index, node in enumerate(secondary_nodes):
        response = os.system("ping -c 1 -w5 " + node[0] + " > /dev/null 2>&1")
        if response == 0:
            secondary_nodes[index][1] = True
    
    print(secondary_nodes)
    if all(node[1] == True for node in secondary_nodes):
        allPassed = True

with open('/cluster_setup.js', 'a') as f:
    f.writelines("sleep(1000);\n")
    f.writelines("rs.initiate({0})".format(config))
    f.writelines(";\nsleep(1000);\n")

with open('/user_setup.js', 'a') as f:
    f.writelines("db = db.getSiblingDB('{0}');\n".format(mongo_database))
    f.writelines("db.createUser( {{user: '{0}', pwd: '{1}', roles: [{{ role: 'root', db: '{2}' }}] }});\n".format(mongo_username, mongo_pasword, mongo_database))