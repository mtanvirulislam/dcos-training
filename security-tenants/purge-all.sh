echo "Admin (superuser) login ..."

# Available providers for login:
#   dcos-users - Standard DC/OS user account (username and password)
#   dcos-oidc-auth0 - OpenID Connect ID token that appears in the browser.
#   ldap - LDAP user account (username and password)
#
# More here: https://github.com/dcos/dcos-cli/blob/master/design/login.md

dcos auth login --provider=dcos-users --username admin

echo "Application project delete ..."
dcos marathon group remove project-01
dcos marathon group remove project-02

echo "User delete ..."
dcos security org users delete user-001
dcos security org users delete user-002

echo "Team gruoups delete ..."
dcos security org groups delete project-01-team
dcos security org groups delete project-02-team
echo "Done."
