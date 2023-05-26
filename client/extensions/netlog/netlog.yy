{
  "resourceType": "GMExtension",
  "resourceVersion": "1.2",
  "name": "netlog",
  "androidactivityinject": "",
  "androidclassname": "",
  "androidcodeinjection": "",
  "androidinject": "",
  "androidmanifestinject": "",
  "androidPermissions": [],
  "androidProps": true,
  "androidsourcedir": "",
  "author": "",
  "classname": "",
  "ConfigValues": {},
  "copyToTargets": 105554172285166,
  "date": "2022-08-13T23:56:42.9718768+10:00",
  "description": "",
  "exportToGame": true,
  "extensionVersion": "1.0.0",
  "files": [
    {"resourceType":"GMExtensionFile","resourceVersion":"1.0","name":"","constants":[
        {"resourceType":"GMExtensionConstant","resourceVersion":"1.0","name":"netlog_is_ready","hidden":true,"value":"(global.netlog_ready)",},
      ],"copyToTargets":105554172285166,"filename":"netlog.gml","final":"netlog_cleanup","functions":[
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"netlog_preinit","argCount":0,"args":[],"documentation":"","externalName":"netlog_preinit","help":"","hidden":false,"kind":11,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"netlog_cleanup","argCount":0,"args":[],"documentation":"","externalName":"netlog_cleanup","help":"","hidden":false,"kind":11,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"netlog_init","argCount":2,"args":[
            2,
            2,
          ],"documentation":"","externalName":"netlog_init","help":"netlog_init(url, port) : Attempts connecting to netlog server (if available).","hidden":false,"kind":11,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"netlog_async_net","argCount":0,"args":[],"documentation":"","externalName":"netlog_async_net","help":"netlog_async_net() : Should be added to Async - Networking event","hidden":false,"kind":11,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"netlog","argCount":1,"args":[
            1,
          ],"documentation":"","externalName":"netlog","help":"netlog(message) : Sends a message either to server (if connected) or to show_debug_message.","hidden":false,"kind":11,"returnType":2,},
      ],"init":"netlog_preinit","kind":2,"order":[],"origname":"extensions\\gml.gml","ProxyFiles":[],"uncompress":false,"usesRunnerInterface":false,},
  ],
  "gradleinject": "",
  "hasConvertedCodeInjection": true,
  "helpfile": "",
  "HTML5CodeInjection": "",
  "html5Props": false,
  "IncludedResources": [
    "Included Files\\netlog\\netlog.exe",
    "Included Files\\netlog\\netlog.n",
  ],
  "installdir": "",
  "iosCocoaPodDependencies": "",
  "iosCocoaPods": "",
  "ioscodeinjection": "",
  "iosdelegatename": "",
  "iosplistinject": "",
  "iosProps": true,
  "iosSystemFrameworkEntries": [],
  "iosThirdPartyFrameworkEntries": [],
  "license": "Proprietary",
  "maccompilerflags": "",
  "maclinkerflags": "",
  "macsourcedir": "",
  "options": [],
  "optionsFile": "options.json",
  "packageId": "",
  "parent": {
    "name": "DLLs",
    "path": "folders/Extensions/DLLs.yy",
  },
  "productId": "ACBD3CFF4E539AD869A0E8E3B4B022DD",
  "sourcedir": "",
  "supportedTargets": 105554172285166,
  "tvosclassname": "",
  "tvosCocoaPodDependencies": "",
  "tvosCocoaPods": "",
  "tvoscodeinjection": "",
  "tvosdelegatename": "",
  "tvosmaccompilerflags": "",
  "tvosmaclinkerflags": "",
  "tvosplistinject": "",
  "tvosProps": false,
  "tvosSystemFrameworkEntries": [],
  "tvosThirdPartyFrameworkEntries": [],
}