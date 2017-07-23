import hashlib
import os

containerHashTable = {}

def hashFile(fileName):
    hasher = hashlib.md5()
    filePath = os.path.realpath(fileName)
    with open(filePath, 'rb') as afile:
        buf = afile.read()
        hasher.update(buf)
    hashSum = (hasher.hexdigest())
    containerHashTable[hashSum] = filePath

hashFile("proof1.txt")
hashFile("proof2.txt")
hashFile("proof3.txt")
hashFile("proof4.txt")
hashFile("proof5.txt")

for x in containerHashTable:
    print x
    print containerHashTable[x]
