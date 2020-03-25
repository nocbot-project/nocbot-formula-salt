{%- from "salt/map.jinja" import minion with context %}

{%- if minion.get('enabled', False) %}
salt_minion__pkg:
  pkg.installed:
    - name: salt-minion
    {%- if minion.version is defined %}
    - version: {{ minion.version }}
    {%- endif %}
    - require_in:
        - service: salt_minion__service
    - watch_in:
        - service: salt_minion__service
{%- endif %}