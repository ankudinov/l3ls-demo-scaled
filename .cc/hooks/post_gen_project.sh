#!/bin/bash
mkdir -p clab/sn
# add spine serials
{%- for a_switch in cookiecutter.in.fabric_spine_inventory %}
    {%- set id_int = a_switch.id | int %}
echo "SERIALNUMBER=1C68470A1E0CD6EF7418D78A958271{{ '%02d' | format(id_int) }}" > clab/sn/{{ a_switch.hostname }}.txt
echo -n "SYSTEMMACADDR=001c.7301.f1{{ '%02d' | format(id_int) }}" >> clab/sn/{{ a_switch.hostname }}.txt
{% endfor %}
# add leaf serials
{%- for a_switch in cookiecutter.in.fabric_leaf_inventory %}
    {%- set id_int = a_switch.id | int %}
echo "SERIALNUMBER=1C68470A1E0CD6EF7418D78A958272{{ '%02d' | format(id_int) }}" > clab/sn/{{ a_switch.hostname }}.txt
echo -n "SYSTEMMACADDR=001c.7301.f2{{ '%02d' | format(id_int) }}" >> clab/sn/{{ a_switch.hostname }}.txt
{% endfor %}
# add l2leaf serials
{%- for a_switch in cookiecutter.in.fabric_l2leaf_inventory %}
    {%- set id_int = a_switch.id | int %}
echo "SERIALNUMBER=1C68470A1E0CD6EF7418D78A958273{{ '%02d' | format(id_int) }}" > clab/sn/{{ a_switch.hostname }}.txt
echo -n "SYSTEMMACADDR=001c.7301.f3{{ '%02d' | format(id_int) }}" >> clab/sn/{{ a_switch.hostname }}.txt
{% endfor %}
