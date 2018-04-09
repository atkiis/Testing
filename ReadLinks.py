
import urllib2

i=0
url="http://blog.kiiskinen.at"
page=urllib2.urlopen(url)
data=page.read().split("</a>")
tag="<a href=\""
endtag="\">"

print("Counting links...\n")

for item in data:
    if "<a href" in item:
        try:
            ind = item.index(tag)
            item = item[ind+len(tag):]
            end = item.index(endtag)

        except: pass
        else:
            i+=1
            print (i)
            print item[:end]
