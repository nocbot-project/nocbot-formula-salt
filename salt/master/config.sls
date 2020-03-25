{%- from 'salt/map.jinja' import master with context %}

{%- if master.get('enabled', False) %}
salt_master__dirs:
  file.directory:
    - user: root
    - group: root
    - mode: 700
    - makedirs: True
    - names:
      - /srv/reactor
      - /srv/pillar
      - /srv/salt/_modules
      - /srv/salt/_states

salt_master__/etc/salt/master.d:
  file.recurse:
    - name: /etc/salt/master.d
    - source: salt://salt/files/etc/salt/master.d
    - template: jinja
    - user: root
    - group: root
    - dir_mode: '0700'
    - file_mode: '640'
    - exclude_pat: _*
    - clean: True
    - require:
      - pkg: salt_master__pkg
    - listen_in:
      - service: salt_master__service

{%- if master.auto_sign %}
{%- if master.auto_sign_path is defined %}
salt_master__/etc/salt/{{ master.auto_sign_path }}:
  file.managed:
    - name: {{ master.auto_sign_path }}
    - contents: |
        {{ master.auto_sign_content | indent(8) }}
    - user: root
    - group: root
    - mode: '600'
    - require:
      - pkg: salt_master__pkg
    - listen_in:
      - service: salt_master__service
{%- endif %}
{%- endif %}

/salt_master__/etc/salt/gitfs:
  file.directory:
    - name: /etc/salt/gitfs
    - user: root
    - group: root
    - mode: '0700'
    - makedirs: True

salt_master__/etc/salt/gitfs/id_rsa:
  file.managed:
    - name: /etc/salt/gitfs/id_rsa
    - contents: |
        {{ master.rsa_private | indent(8) }}
    - user: root
    - group: root
    - mode: '400'
    - require:
      - file: /salt_master__/etc/salt/gitfs

salt_master__/etc/salt/gitfs/id_rsa.pub:
  file.managed:
    - name: /etc/salt/gitfs/id_rsa.pub
    - contents: |
        {{ master.rsa_public }}
    - user: root
    - group: root
    - require:
      - file: /etc/salt/gitfs

salt_master__/root/.ssh/config:
  file.managed:
    - name: /root/.ssh/config
    - source: salt://salt/files/root/.ssh/config
    - user: root
    - group: root
    - mode: '400'
    - makedirs: True
    - dir_mode: '0700'

salt_master__/srv/reactor/directory:
  file.recurse:
    - name: /srv/reactor
    - source: salt://salt/files/srv/reactor
    - user: root
    - group: root
    - file_mode: '640'
    - dir_mode: '0700'
    - clean: True
    - require:
      - pkg: salt_master__pkg
      - file: salt_master__dirs
    - listen_in:
      - service: salt_master__service
{%- endif %}