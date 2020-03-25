#######################################################################
# This file is managed by SaltStack. Local changes will be overwritten.
# formula: salt.master
# path: salt://salt/files/srv/reactor/saltclass.sls
#######################################################################

{% set postdata = data.get('post', {}) %}

{% if postdata.secretkey == "secretgoeshere" %}

reactor_git_saltclass:
  local.state.single:
    - tgt: 'salt.example.com'
    - arg:
      - git.latest
      - https://user@git.example.com/saltclass.git
      - kwarg:
          target: /srv/saltclass

{% endif %}
