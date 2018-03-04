# Vapor-XCTest
Demo of using Vapor for stubing network requests for XCUITests in iOS apps. 

# Requirements 

* Xcode 9 + 
* `openssl`
* Swift 4+ 

# Usage

## Run Example App and Real UITests 

* Clone this repository on macOS 

```
$ git clone https://github.com/Shashikant86/Vapor-XCTest
$ cd Vapor-XCTest
```

* Open the iOS app in Xcode using the Xcode Project

        $ open Vapor-XCTest.xcodeproj
        
This is example app showing the Github user information. It ak to enter your Github `username` and once clicked on `Submit` button, it displays all the user details. 
Now that, you will see an example app with couple of demo UITests. One with real network request and another with stubbed network request with Vapor 

Try, running `LocationCheckWithoutStub.swift` which makes real network request. YOu can see that it uses the `launchEnvironment` value 
from real server `app.launchEnvironment = ["BASEURL" : "https://api.github.com"]` 


## Run Vapor Server and Stubbed UITest 

### Run Vapor Server from command line 

Now, navigate to the `Vapor-Server` directory where we have all `Vapor` setup. Build the project and run server. The server will send the dummy response that stubbed in the `main.swift` 

         $ cd Vapor-Server
         $ swift build
         $ .build/debug/Vapor-Server serve
         

This will start vapor server on port `8080` and listen to response from local vapor server. 

Now run the UITest `LocationCheckWithVaporStub.swift` which uses local response, you can see that `launchEnvironment` value fro local network. 
`app.launchEnvironment = ["BASEURL" : "http://localhost:8080"]` 
You can see that test wil pass with the response Stubbed data from `main.swift 




