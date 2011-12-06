
import csv
import sys
import xml.etree.ElementTree as ET


dados = csv.reader(open(sys.argv[1], 'r'), delimiter='\t', quotechar='\"')
flag = True
header = None

root = ET.Element('rows')
for d in dados:
    if flag:
        header = d
        flag = False
        continue
    row = ET.SubElement(root,'row')
    for i in range(len(d)):
        col = ET.SubElement(row,header[i])
        col.text = d[i].decode("utf-8")

tree = ET.ElementTree(root)
tree.write(sys.argv[2], encoding = "utf-8", xml_declaration = True)
