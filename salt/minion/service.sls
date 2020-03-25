{%- from "salt/map.jinja" import minion with context %}

{%- if minion.get('enabled', False) %}
salt_minion__service:
  service.running:
    - name: {{ minion.service }}
    - enable: True
    - require:
      - pkg: salt_minion__pkg
{%- endif %}