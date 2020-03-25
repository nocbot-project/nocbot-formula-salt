{%- if salt['pillar.get']('salt:minion') is defined %}

include:
  - salt.minion.install
  - salt.minion.config
  - salt.minion.service

{%- endif %}