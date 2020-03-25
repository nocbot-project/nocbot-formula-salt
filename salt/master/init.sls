{%- if salt['pillar.get']('salt.master') is defined %}

include:
{%- if salt['pillar.get']('salt.master.pillar.engine') == 'saltclass' %}
  - salt.master.saltclass
{%- endif %}
  - salt.master.install
  - salt.master.config
  - salt.master.service

{%- endif %}