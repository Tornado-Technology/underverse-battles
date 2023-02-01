{
  "resourceType": "GMExtension",
  "resourceVersion": "1.2",
  "name": "win_dev",
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
  "ConfigValues": {
    "Development": {"copyToTargets":"3035426170322551014",},
  },
  "copyToTargets": -1,
  "date": "2020-10-04T17:42:17.9816143+03:00",
  "description": "Adds several Windows-specific functions for GameMaker: Studio.\r\nSee blog post for details:\r\nhttp://yal.cc/gamemaker-windows-functions-for-gamemaker-studio",
  "exportToGame": true,
  "extensionVersion": "0.0.1",
  "files": [
    {"resourceType":"GMExtensionFile","resourceVersion":"1.0","name":"","constants":[],"copyToTargets":49385710,"filename":"GMS-WinDev.dll","final":"","functions":[
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"delay","argCount":1,"args":[
            2,
          ],"documentation":"","externalName":"delay","help":"delay(ms) : sleep(ms) equivalent.","hidden":false,"kind":12,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"shell_execute","argCount":2,"args":[
            1,
            1,
          ],"documentation":"","externalName":"shell_execute","help":"shell_execute(path, parameters)","hidden":false,"kind":12,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"shell_do","argCount":2,"args":[
            1,
            1,
          ],"documentation":"","externalName":"shell_do","help":"shell_do(action, file) : Perform specified action (open/edit/...) over file","hidden":false,"kind":12,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"shell_execute_at","argCount":3,"args":[
            1,
            1,
            1,
          ],"documentation":"","externalName":"shell_execute_at","help":"shell_execute_at(path, parameters, working_directory)","hidden":false,"kind":12,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"file_text_get","argCount":1,"args":[
            1,
          ],"documentation":"","externalName":"file_text_get","help":"file_text_get(file) : Returns file contents as a string.","hidden":false,"kind":12,"returnType":1,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"file_text_put","argCount":2,"args":[
            1,
            1,
          ],"documentation":"","externalName":"file_text_put","help":"file_text_put(file, contents) : Replaces contents of given file by ones provided.","hidden":false,"kind":12,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"window_set_caption_ext","argCount":2,"args":[
            2,
            1,
          ],"documentation":"","externalName":"window_set_caption_ext","help":"window_set_caption_ext(window_handle, caption)","hidden":false,"kind":12,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"get_color_win","argCount":1,"args":[
            2,
          ],"documentation":"","externalName":"get_color_win","help":"get_color_win(default)","hidden":false,"kind":12,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"file_copy_win","argCount":2,"args":[
            1,
            1,
          ],"documentation":"","externalName":"file_copy_win","help":"file_copy_win(path, newpath) : Non-sandboxed file copy function.","hidden":false,"kind":12,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"shell_do_at","argCount":3,"args":[
            1,
            1,
            1,
          ],"documentation":"","externalName":"shell_do_at","help":"shell_do_at(action, path, working_directory)","hidden":false,"kind":12,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"shell_do_ext","argCount":4,"args":[
            1,
            1,
            1,
            1,
          ],"documentation":"","externalName":"shell_do_ext","help":"shell_do_ext(action, path, params, working_directory)","hidden":false,"kind":12,"returnType":2,},
      ],"init":"","kind":1,"order":[
        {"name":"delay","path":"extensions/win_dev/win_dev.yy",},
        {"name":"shell_execute","path":"extensions/win_dev/win_dev.yy",},
        {"name":"shell_do","path":"extensions/win_dev/win_dev.yy",},
        {"name":"shell_execute_at","path":"extensions/win_dev/win_dev.yy",},
        {"name":"file_text_get","path":"extensions/win_dev/win_dev.yy",},
        {"name":"file_text_put","path":"extensions/win_dev/win_dev.yy",},
        {"name":"window_set_caption_ext","path":"extensions/win_dev/win_dev.yy",},
        {"name":"get_color_win","path":"extensions/win_dev/win_dev.yy",},
        {"name":"file_copy_win","path":"extensions/win_dev/win_dev.yy",},
        {"name":"shell_do_at","path":"extensions/win_dev/win_dev.yy",},
        {"name":"shell_do_ext","path":"extensions/win_dev/win_dev.yy",},
      ],"origname":"extensions\\GMS-WinDev.dll","ProxyFiles":[],"uncompress":false,"usesRunnerInterface":false,},
  ],
  "gradleinject": "",
  "hasConvertedCodeInjection": true,
  "helpfile": "",
  "IncludedResources": [],
  "installdir": "",
  "iosCocoaPodDependencies": "",
  "iosCocoaPods": "",
  "ioscodeinjection": "",
  "iosdelegatename": "",
  "iosplistinject": "",
  "iosProps": true,
  "iosSystemFrameworkEntries": [],
  "iosThirdPartyFrameworkEntries": [],
  "license": "Free to use in commercial and non-commercial projects.\r\nExtension itself may not be sold or sublicensed.",
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
  "productId": "",
  "sourcedir": "",
  "supportedTargets": -1,
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