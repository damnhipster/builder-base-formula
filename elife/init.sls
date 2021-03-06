# adding 'elife' to your application's state top.sls file will include all these below
# https://docs.saltstack.com/en/latest/ref/states/include.html

include:
    - .base
    - .python
    - .hostname
    - .dhcp
    - .known-hosts
    - .deploy-user
    - .cron
    - .time-correction
    - .backups
    - .coveralls
    {% if salt['elife.cfg']('project.node', 1) == 1 %}
    # first server of a cluster
    - .backups-cron
    {% endif %}
    - .security
    - .logging
    - .upstart-monitoring
    {% if salt['elife.only_on_aws']() %}
    - .daily-system-updates
    {% endif %}
    - .environment-name
    - .smoke
    - .utils
    - .forced-dns
    {% if (salt['elife.cfg']('project.ec2') | string) != 'True' %}
    {% if salt['elife.cfg']('project.ec2.masterless') %}
    - .masterless
    {% endif %}
    {% endif %}
