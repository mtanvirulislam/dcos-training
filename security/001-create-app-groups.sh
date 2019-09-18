# Restricting Access to DC/OS Service Groups

# Create service groups: the tenants

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

