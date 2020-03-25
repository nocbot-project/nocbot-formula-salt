{%- from 'salt/map.jinja' import master with context %}

{%- if master.get('enabled', False) %}
salt_master__pkg:
  pkg.installed:
    - name: {{ master.pkg }}
    {%- if master.version is defined %}
    - version: {{ master.version }}
    {%- endif %}
    - require_in:
        - service: salt_master__service
    - watch_in:
        - service: salt_master__service
{%- endif %}