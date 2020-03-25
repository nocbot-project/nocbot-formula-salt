{%- if salt['pillar.get']('salt') is defined %}
include:
{%- if salt['pillar.get']('salt.master') is defined %}
  - salt.master
{%- endif %}
{%- if salt['pillar.get']('salt.minion') is defined %}
  - salt.minion
{%- endif %}
{%- if salt['pillar.get']('salt.salt_ssh') is defined %}
  - salt.salt_ssh
{%- endif %}
{%- endif %}
