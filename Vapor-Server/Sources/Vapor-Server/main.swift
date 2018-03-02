import Vapor

let drop = try Droplet()

drop.get("hello") { req in
  return "Hello Vapor"
}

drop.get("users/shashikant86") { request in
    var json = JSON()
    try json.set("location", "StubLocation")
    try json.set("name", "StubName")
    try json.set("blog", "http://shashikantjagtap.net")
    try json.set("avatar_url", "https://avatars0.githubusercontent.com/u/2176586?v=4")
    try json.set("followers", 1000)
    try json.set("public_repos", 100)
    return json
}

try drop.run()
