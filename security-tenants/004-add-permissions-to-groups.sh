# Define the permissions to groups

# Usage: dcos security org groups grant [OPTIONS] GID RID ACTION
#    GID - Group ID
#    RID - Resource ID
#    ACTION - Action identifiers (create, read, update, delete, or full)

# dcos security org groups grant ${TEAM} dcos:service:marathon:marathon:services:/${TEAM} full

GIDS="project-01-team project-02-team"

for GID in $GIDS; do
    dcos security org groups grant ${GID} dcos:adminrouter:service:marathon full
    dcos security org groups grant ${GID} dcos:adminrouter:service:nginx full
    dcos security org groups grant ${GID} dcos:service:marathon:marathon:services:/${GID%-team} full
    dcos security org groups grant ${GID} dcos:adminrouter:ops:slave full
    dcos security org groups grant ${GID} dcos:adminrouter:ops:mesos full
    dcos security org groups grant ${GID} dcos:adminrouter:package full
done

