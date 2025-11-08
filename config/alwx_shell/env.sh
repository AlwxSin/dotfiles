source "$(dirname "$0")/aliases.sh"
source "$(dirname "$0")/exports.sh"
source "$(dirname "$0")/functions.sh"

local_env="$(dirname "$0")/local.sh"
if [ -f $local_env ]; then
    source $local_env
fi
