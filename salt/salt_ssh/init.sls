{%- if salt['pillar.get']('salt:salt_ssh') is defined %}

include:
  - salt.salt_ssh.install
  - salt.salt_ssh.config

{%- endif %}