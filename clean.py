import sys
import csv

with open(sys.argv[1], 'r') as file:
    save = []
    for line in file:
        save.append([x.strip() for x in line.split('|')])
    with open(sys.argv[2], 'w') as out:
        writer = csv.writer(out)
        writer.writerows(save[2:-2])
