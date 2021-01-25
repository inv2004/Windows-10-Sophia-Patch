import sequtils
import os
import strutils
import httpclient
import json
import osproc
import strformat

const USER = "farag2"
const REPO = "Windows-10-Sophia-Script"
const URL = fmt"https://api.github.com/repos/{USER}/{REPO}/releases/latest"
const FILE = "Sophia/Sophia.ps1"
const TARGET = "Sophia"

proc checkout() =
  echo "checkout"
  let j = newHttpClient().getContent(URL).parseJson()
  let lastTag = j["tag_name"].getStr()
  echo "Last Tag: ", lastTag
  doAssert 0 == execCmd fmt"git clone https://github.com/{USER}/{REPO} --branch {lastTag} --single-branch"

proc copy() =
  echo "copy"
  copyDir(fmt"{REPO}/Sophia", TARGET)
  removeDir(fmt"{TARGET}/PowerShell 7.x")

proc read(fName: string): seq[string] =
  toSeq(lines(fName))
    .mapIt(it.strip(true, true))
    .filterIt(it.len > 0)
    .filterIt(not it.startsWith("#"))

proc patch() =
  echo "patch"
  let toExclude = read("exclude.txt")
  let toInclude = read("include.txt").mapIt("# " & it)

  var script: seq[string]
  for l in lines(FILE):
    if toExclude.anyIt(l.startsWith(it)):
      script.add ("#PATCH " & l)
    if toInclude.anyIt(l.startsWith(it)):
      script.add (l[2..^1] & "  #PATCH")
    else:
      script.add l

  writeFile(FILE, script.join("\n"))

when isMainModule:
  checkout()
  copy()
  patch()
  echo "done"
