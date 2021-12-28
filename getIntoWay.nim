import std/[
  httpclient,
  strutils,
  strformat
]

import pkg/[
  scraper,
  suru
]

proc main(input, output: string) =
  let links = input.readFile.replace("\r\n", "\n").split "\n"
  var client = newHttpClient()
  var okLinks: string

  echo "To get the download url of 'shortner.getintoway.com' you need to run the `getIntoWay.js` in the console of a page of the site itself"

  for link in suru links:
    if link.len > 0:
      if link[8..10] == "fs":
        let
          html = parseHtml client.getContent link
          okLink = html.findAll("a", {"id": "download_link"}).attr "href"
          name = link[28..^1].replace(".html", "")
        okLinks.add fmt"{name},{okLink}" & "\l"
    output.writeFile "name,url\l" & okLinks

when isMainModule:
  import pkg/cligen
  dispatch main
