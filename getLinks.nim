import std/[
  httpclient,
  strutils,
  strformat,
]

import pkg/[
  scraper,
  suru
]

proc main(input, output: string) =
  let links = input.readFile.split "\r\n"
  var client = newHttpClient()

  var okLinks: string

  for link in suru links:
    if link.len > 0:
      let
        html = parseHtml client.getContent link
        okLink = html.findAll("a", {"id": "download_link"}).attr "href"
        name = link[28..^1].replace(".html", "")
      okLinks.add fmt"{name},{okLink}" & "\l"
    output.writeFile "name,url\l" & okLinks

when isMainModule:
  import pkg/cligen
  dispatch main
