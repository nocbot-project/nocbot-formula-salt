#######################################################################
# This file is managed by SaltStack. Local changes will be overwritten.
# formula: salt.master
# path: salt://salt/files/srv/reactor/sync_grains.sls
#######################################################################

# Salt will sync all custom types (by running a saltutil.sync_all) on every highstate.
# However, there is a chicken-and-egg issue where, on the initial highstate, a minion
# will not yet have these custom types synced when the top file is first compiled.
# This reactor is a work around
sync_all:
  local.saltutil.sync_all:
    - tgt: {{ data['id'] }}