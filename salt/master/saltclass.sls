{%- from "salt/map.jinja" import master with context %}

{%- if master.pillar.engine == 'saltclass' %}
/salt_master__srv/salt/saltclass:
  file.directory:
    - name: /srv/saltclass
    - user: root
    - group: root
    - mode: '0700'
{%- endif %}