{
  "resourceType": "GMExtension",
  "resourceVersion": "1.2",
  "name": "win_dev",
  "ConfigValues": {
    "Development": {"copyToTargets":"3035426170322551014",},
  },
  "optionsFile": "options.json",
  "options": [],
  "exportToGame": true,
  "supportedTargets": -1,
  "extensionVersion": "0.0.1",
  "packageId": "",
  "productId": "",
  "author": "",
  "date": "2020-10-05T00:42:17.9816143+10:00",
  "license": "Free to use in commercial and non-commercial projects.\r\nExtension itself may not be sold or sublicensed.",
  "description": "Adds several Windows-specific functions for GameMaker: Studio.\r\nSee blog post for details:\r\nhttp://yal.cc/gamemaker-windows-functions-for-gamemaker-studio",
  "helpfile": "",
  "iosProps": true,
  "tvosProps": false,
  "androidProps": true,
  "installdir": "",
  "files": [
    {"resourceType":"GMExtensionFile","resourceVersion":"1.0","name":"","filename":"GMS-WinDev.dll","origname":"extensions\\GMS-WinDev.dll","init":"","final":"","kind":1,"uncompress":false,"functions":[
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"delay","externalName":"delay","kind":12,"help":"delay(ms) : sleep(ms) equivalent.","hidden":false,"returnType":2,"argCount":1,"args":[
            2,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"shell_execute","externalName":"shell_execute","kind":12,"help":"shell_execute(path, parameters)","hidden":false,"returnType":2,"argCount":2,"args":[
            1,
            1,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"shell_do","externalName":"shell_do","kind":12,"help":"shell_do(action, file) : Perform specified action (open/edit/...) over file","hidden":false,"returnType":2,"argCount":2,"args":[
            1,
            1,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"shell_execute_at","externalName":"shell_execute_at","kind":12,"help":"shell_execute_at(path, parameters, working_directory)","hidden":false,"returnType":2,"argCount":3,"args":[
            1,
            1,
            1,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"file_text_get","externalName":"file_text_get","kind":12,"help":"file_text_get(file) : Returns file contents as a string.","hidden":false,"returnType":1,"argCount":1,"args":[
            1,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"file_text_put","externalName":"file_text_put","kind":12,"help":"file_text_put(file, contents) : Replaces contents of given file by ones provided.","hidden":false,"returnType":2,"argCount":2,"args":[
            1,
            1,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"window_set_caption_ext","externalName":"window_set_caption_ext","kind":12,"help":"window_set_caption_ext(window_handle, caption)","hidden":false,"returnType":2,"argCount":2,"args":[
            2,
            1,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"get_color_win","externalName":"get_color_win","kind":12,"help":"get_color_win(default)","hidden":false,"returnType":2,"argCount":1,"args":[
            2,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"file_copy_win","externalName":"file_copy_win","kind":12,"help":"file_copy_win(path, newpath) : Non-sandboxed file copy function.","hidden":false,"returnType":2,"argCount":2,"args":[
            1,
            1,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"shell_do_at","externalName":"shell_do_at","kind":12,"help":"shell_do_at(action, path, working_directory)","hidden":false,"returnType":2,"argCount":3,"args":[
            1,
            1,
            1,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"shell_do_ext","externalName":"shell_do_ext","kind":12,"help":"shell_do_ext(action, path, params, working_directory)","hidden":false,"returnType":2,"argCount":4,"args":[
            1,
            1,
            1,
            1,
          ],"documentation":"",},
      ],"constants":[],"ProxyFiles":[],"copyToTargets":49385710,"usesRunnerInterface":false,"order":[
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
      ],},
  ],
  "classname": "",
  "tvosclassname": "",
  "tvosdelegatename": "",
  "iosdelegatename": "",
  "androidclassname": "",
  "sourcedir": "",
  "androidsourcedir": "",
  "macsourcedir": "",
  "maccompilerflags": "",
  "tvosmaccompilerflags": "",
  "maclinkerflags": "",
  "tvosmaclinkerflags": "",
  "iosplistinject": "",
  "tvosplistinject": "",
  "androidinject": "",
  "androidmanifestinject": "",
  "androidactivityinject": "",
  "gradleinject": "",
  "androidcodeinjection": "",
  "hasConvertedCodeInjection": true,
  "ioscodeinjection": "",
  "tvoscodeinjection": "",
  "iosSystemFrameworkEntries": [],
  "tvosSystemFrameworkEntries": [],
  "iosThirdPartyFrameworkEntries": [],
  "tvosThirdPartyFrameworkEntries": [],
  "IncludedResources": [],
  "androidPermissions": [],
  "copyToTargets": -1,
  "iosCocoaPods": "",
  "tvosCocoaPods": "",
  "iosCocoaPodDependencies": "",
  "tvosCocoaPodDependencies": "",
  "parent": {
    "name": "DLLs",
    "path": "folders/Extensions/DLLs.yy",
  },
}