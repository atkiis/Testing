import urllib2
url="http://blog.kiiskinen.at"
page=urllib2.urlopen(url)
data=page.read().split("</a>")
tag="<a href=\""
endtag="\">"
for item in data:
    if "<a href" in item:
        try:
            ind = item.index(tag)
            item=item[ind+len(tag):]
            end=item.index(endtag)
        except: pass
        else:
            print item[:end]
