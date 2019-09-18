# Application group making. The project must be assigned
# to application groups. The application group is the
# foundation for project isolation.

cat <<EOF | dcos marathon group add
{
  "id": "project-01"

}
EOF

cat <<EOF | dcos marathon group add
{
  "id": "project-02"

}
EOF

dcos marathon group list

