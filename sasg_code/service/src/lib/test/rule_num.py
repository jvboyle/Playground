import re

data = open('rules.txt', 'r').read()
print(data)

rule_start = 7
rule_end = 8000
rule_num = rule_start

for line in data.split('\r\n'):
    sline = re.sub( '\s+', ' ', line).strip().split()
    if len(sline) == 6 and 'daddr' in sline:
        if rule_start <= int(sline[0]) <= rule_end:
            if rule_num != int(sline[0]):
                break
            rule_num += 1

print(rule_num)
