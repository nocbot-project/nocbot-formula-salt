{%- from "salt/map.jinja" import minion with context %}

{%- if minion.get('enabled', False) %}
salt_minion__/etc/salt/minion.d:
  file.recurse:
    - name: /etc/salt/minion.d
    - source: salt://salt/files/etc/salt/minion.d
    - template: jinja
    - user: root
    - group: root
    - dir_mode: '0700'
    - file_mode: '600'
    - exclude_pat: _*
    - clean: true
    - require:
      - pkg: salt_minion__pkg
    - listen_in:
      - service: salt_minion__service

salt_minion__/etc/salt/grains:
  file.managed:
    - name: /etc/salt/grains
    - source: salt://salt/files/etc/salt/grains
    - user: root
    - group: root
    - mode: '600'
    - require:
      - pkg: salt_minion__pkg
    - listen_in:
      - service: salt_minion__service
{%- endif %}