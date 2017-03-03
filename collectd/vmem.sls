{% from "collectd/map.jinja" import collectd_settings with context %}

include:
  - collectd

{{ collectd_settings.plugindirconfig }}/vmem.conf:
  file.managed:
    - source: salt://collectd/files/vmem.conf
    - user: {{ collectd_settings.user }}
    - group: {{ collectd_settings.group }}
    - mode: 644
    - template: jinja
    - watch_in:
      - service: collectd-service
