"""import lxml.etree as ET

#MAIN IDEA :
# resumee infos stored in the cvInfos.xml -> xsl-fo or html or latex using xsl (and python extensions)
# -> html (for online cv)
# -> xsml-fo (for pdf and printing)
# -> latex if the above solution are not good enough

xml_filename = "cvInfos.xml"
xsl_filename = "transformer.xsl"
template = "t6"

dom = ET.parse(xml_filename)
xslt = ET.parse(xsl_filename)
transform = ET.XSLT(xslt)
newdom = transform(dom)
res = ET.tostring(newdom, pretty_print=True,encoding=str)
file = open("dist/generated.html","w", encoding="UTF8")
print(res)
file.write(res)
"""

from saxonche import *

with PySaxonProcessor(license=False) as proc:
    xsltproc = proc.new_xslt30_processor()
    document = proc.parse_xml(xml_file_name="cvInfos.xml")
    executable = xsltproc.compile_stylesheet(stylesheet_file="transformer.xsl")
    output = executable.transform_to_string(xdm_node=document)
    file = open("dist/generated.html","w", encoding="UTF-8")
    print(output)
    file.write(output)