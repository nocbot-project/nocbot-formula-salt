{%- from "salt/map.jinja" import salt_ssh with context %}

{%- if salt_ssh.get('enabled', False) %}
salt_ssh__pkg:
  pkg.installed:
    - name: {{ salt_ssh.pkg }}
    {%- if salt_ssh.version is defined %}
    - version: {{ salt_ssh.version }}
    {%- endif %}
 {%- endif %}