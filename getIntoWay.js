// Just add the links and paste it in browser console in one of those pages

(() => {
  // Links here
  const links = `https://shortener.getintoway.com/2021/12/the-5-best-hosting-to-host-website.html#?o=52365beab58b4b17f240c67ac8bc270addf2118f44b97ec3ad55f9ea934270d1d4fa9148179eef496f0a81eb99ac0a02b663235299e73a9a6e96d4e5ad996e038965918820af1d24acd85f0e0760c3e6d31e0a00fa0bf8ab
https://shortener.getintoway.com/2021/12/what-should-have-good-hosting.html#?o=7f8e10e1514fee011cbd235bf52bd97ec3157696af6d9092fd7beedd3cea1d42e63a26ff8656b6316867cabb0aaab33c3e8a791c1d12d10055383528fe0da8f52fb06cc81fdd7125e112002f79b0921ee1ff1f8d5c3e85e5`.split("\n")

  let res = "name,url"
  for (const link of links) {
    const parts = link.split(".html#?o=")
    res += parts[0].substr(42)
    res += ","
    res += aesCrypto.decrypt(convertstr(parts[1]), convertstr('root'))
    res += "\n"
  }
  console.log(res)

})()
