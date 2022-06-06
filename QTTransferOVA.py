import json
import requests
import wget
import urllib.request
import asyncio
'''
async def io_related(name):
	print(f'{name} started')
	url = 'http://corpora.aifdb.org/list.php/helpers/corporanodesets.php?shortname=qt14102021wtxt'
	nodeset = requests.get(url)
	await asyncio.sleep(5)
	print(f'{name} finished')

async def main():
	await asyncio.gather(
        io_related('first'),
        io_related('second'),
	)  # 1s + 1s = over 1s

if __name__ ==  '__main__':
    loop = asyncio.get_event_loop()
    loop.run_until_complete(main())
'''

url = ''
# QT urls
# url = 'http://corporaqt.arg.tech/cutiestestrun19November2020'
# url = 'http://ova3qt.arg.tech/db/22744'
# url = 'http://txtdbqt.arg.tech/view.php?id=22744'

# AIFdb urls
#url = 'http://ova.arg-tech.org/db/'
url = 'http://corpora.aifdb.org/nodesets.php?shortname=qt14102021wtxt'

'''
url = 'http://aifdbqt.arg.tech/nodesets/t/18997'
'''
url = 'http://localhost:5000/nodesets/t/17857'
nodeset = wget.download(url)

with urllib.request.urlopen(url) as url:
    data = json.loads(url.read().decode())

# print(data)
'''
for nodeid in data["nodeSets"]:
	print("----")
	print('Opening url with ' + str(nodeid))
	url = 'http://www.aifdb.org/json/' + str(nodeid)
	print(url)
	wget.download(url)
'''
# print (nodeset.status_code)
