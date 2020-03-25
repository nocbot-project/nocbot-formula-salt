{%- from "salt/map.jinja" import master with context %}

{%- if master.get('enabled', False) %}
salt_master__service:
  service.running:
    - name: {{ master.service }}
    - enable: True
    - require:
      - pkg: salt_master__pkg
{%- endif %}