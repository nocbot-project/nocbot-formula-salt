{% from "salt/map.jinja" import salt_ssh with context %}

{%- if salt_ssh.get('enabled', False) %}
salt_ssh__/usr/local/admin/bin:
  file.directory:
    - name: /usr/local/admin/bin
    - user: root
    - group: root
    - mode: '0755'
    - makedirs: True

# Script for generating a salt-ssh roster from different cloud providers
salt_ssh__/usr/local/admin/bin/gen_roster.py:
  file.managed:
    - name: /usr/local/admin/bin/gen_roster.py
    - source: salt://salt/files/usr/local/admin/bin/gen_roster.py
    - user: root
    - group: root
    - mode: '700'

# Script for easily running shell commands across many servers using Salt.
salt_ssh__/usr/local/admin/bin/omnishell.py:
  file.managed:
    - name: /usr/local/admin/bin/omnishell.py
    - source: salt://salt/files/usr/local/admin/bin/omnishell.py
    - user: root
    - group: root
    - mode: '700'

salt_ssh__/etc/salt/roster:
  file.managed:
    - name: /etc/salt/roster
    - source: salt://salt/files/etc/salt/roster
    - template: jinja
    - user: root
    - group: root
    - mode: '600'
{%- endif %}