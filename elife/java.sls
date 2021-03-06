{% if salt['grains.get']('osrelease') == "16.04" %}

# note: we might want to treat this java.sls as 'java7.sls' and remove this state
openjdk-jre:
    pkg.installed:
        - pkgs:
            - openjdk-8-jre-headless
        - refresh: True

{% else %}

openjdk7-jre:
    pkg.installed:
        - pkgs:
            - openjdk-7-jre-headless
        - refresh: True

openjdk-jre:
    cmd.run:
        - name: echo "alias for deprecated openjdk7-jre"
        - require:
            - openjdk7-jre

{% endif %}
