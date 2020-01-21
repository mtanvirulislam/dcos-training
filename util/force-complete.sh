dcos $1 plan status deploy --name=$2 --json | jq --raw-output '.phases[] | select(.name | test("unreserve")) | "\(.name) \(.steps[].name)"' | while read phase step; do
  dcos $1 plan force-complete deploy $phase $step --name=$2
done
