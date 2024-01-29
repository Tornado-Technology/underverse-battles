{
  "resourceType": "GMExtension",
  "resourceVersion": "1.2",
  "name": "YandexMobileAds",
  "androidactivityinject": "",
  "androidclassname": "YandexMobileAdsGMWrapper",
  "androidcodeinjection": "//minSdkVersion 21\r\n\r\n<YYAndroidGradleDependencies >\r\nimplementation 'com.yandex.android:mobileads-mediation:6.2.0.0'\r\n</YYAndroidGradleDependencies >\n\n<YYAndroidTopLevelGradleAllprojectsRepositories>\r\n        maven { // IronSource\r\n            url 'https://android-sdk.is.com/'\r\n        }\r\n        maven { // Pangle\r\n            url 'https://artifact.bytedance.com/repository/pangle'\r\n        }\r\n        maven { // Tapjoy\r\n            url \"https://sdk.tapjoy.com/\"\r\n        }\r\n        maven { // Mintegral\r\n            url \"https://dl-maven-android.mintegral.com/repository/mbridge_android_sdk_oversea\"\r\n        }\r\n        maven { // Chartboost\r\n            url \"https://cboost.jfrog.io/artifactory/chartboost-ads/\"\r\n        }\r\n</YYAndroidTopLevelGradleAllprojectsRepositories>\r\n\r\n<YYAndroidManifestApplicationInject>\r\n        <meta-data\r\n            android:name=\"com.google.android.gms.ads.APPLICATION_ID\"\r\n            android:value=\"ca-app-pub-8858162097015410~4385267910\"/>\r\n</YYAndroidManifestApplicationInject>\r\n\r\n<YYAndroidGradleAndroid>\r\n    compileOptions {\r\n        sourceCompatibility JavaVersion.VERSION_1_8\r\n        targetCompatibility JavaVersion.VERSION_1_8\r\n    }\r\n</YYAndroidGradleAndroid>\r\n\r\n<YYAndroidLayout>\r\n<FrameLayout\r\n    xmlns:android=\"http://schemas.android.com/apk/res/android\"\r\n    android:id=\"@+id/yandex_banner_container\"\r\n    android:layout_width=\"match_parent\"\r\n    android:layout_height=\"match_parent\"/>\r\n</YYAndroidLayout>\r\n\r\n<YYIosPlist>\n<key>SKAdNetworkItems</key>\n<array>\n    <dict>\n        <key>SKAdNetworkIdentifier</key>\n        <string>zq492l623r.skadnetwork</string>\n    </dict>\n</array>\n</YYIosPlist>",
  "androidinject": "\r\n        <meta-data android:name=\"com.google.android.gms.ads.APPLICATION_ID\" android:value=\"ca-app-pub-8858162097015410~4385267910\"></meta-data>\r\n",
  "androidmanifestinject": "",
  "androidPermissions": [],
  "androidProps": true,
  "androidsourcedir": "",
  "author": "",
  "classname": "YandexMobileAdsGMWrapper",
  "copyToTargets": 12,
  "date": "2022-08-02T14:41:27.4341742+03:00",
  "description": "",
  "exportToGame": true,
  "extensionVersion": "0.0.1",
  "files": [
    {"resourceType":"GMExtensionFile","resourceVersion":"1.0","name":"YandexMobileAds.ext","constants":[
        {"resourceType":"GMExtensionConstant","resourceVersion":"1.0","name":"YandexMobileAds_ASYNC_RESPONSE_YMA_INITIALIZED","hidden":false,"value":"87432",},
        {"resourceType":"GMExtensionConstant","resourceVersion":"1.0","name":"YandexMobileAds_ASYNC_RESPONSE_YMA_ON_REWARDED","hidden":false,"value":"87433",},
        {"resourceType":"GMExtensionConstant","resourceVersion":"1.0","name":"YandexMobileAds_ASYNC_RESPONSE_YMA_REWARDED_AD_DISAPPEAR","hidden":false,"value":"87434",},
        {"resourceType":"GMExtensionConstant","resourceVersion":"1.0","name":"YandexMobileAds_BANNER_TOP","hidden":false,"value":"0",},
        {"resourceType":"GMExtensionConstant","resourceVersion":"1.0","name":"YandexMobileAds_BANNER_BOTTOM","hidden":false,"value":"1",},
        {"resourceType":"GMExtensionConstant","resourceVersion":"1.0","name":"YandexMobileAds_IOS_TRACKING_STATUS_AUTHORIZED","hidden":false,"value":"0",},
        {"resourceType":"GMExtensionConstant","resourceVersion":"1.0","name":"YandexMobileAds_IOS_TRACKING_STATUS_DENIED","hidden":false,"value":"1",},
        {"resourceType":"GMExtensionConstant","resourceVersion":"1.0","name":"YandexMobileAds_IOS_TRACKING_STATUS_NOT_DETERMINED","hidden":false,"value":"2",},
        {"resourceType":"GMExtensionConstant","resourceVersion":"1.0","name":"YandexMobileAds_IOS_TRACKING_STATUS_RESTRICTED","hidden":false,"value":"3",},
        {"resourceType":"GMExtensionConstant","resourceVersion":"1.0","name":"YandexMobileAds_IOS_ASYNC_RESPONSE_REQUEST_TRACKING_STATUS","hidden":false,"value":"87440",},
      ],"copyToTargets":12,"filename":"YandexMobileAds.ext","final":"","functions":[
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"YandexMobileAds_initialize","argCount":0,"args":[
            2,
          ],"documentation":"","externalName":"initialize","help":"YandexMobileAds_initialize(userConsent)","hidden":false,"kind":4,"returnType":1,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"YandexMobileAds_initializeInterstitial","argCount":0,"args":[
            1,
          ],"documentation":"","externalName":"initializeInterstitial","help":"YandexMobileAds_initializeInterstitial(adUnitId)","hidden":false,"kind":4,"returnType":1,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"YandexMobileAds_showInterstitial","argCount":0,"args":[],"documentation":"","externalName":"showInterstitial","help":"YandexMobileAds_showInterstitial()","hidden":false,"kind":4,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"YandexMobileAds_initializeRewardedAd","argCount":0,"args":[
            1,
          ],"documentation":"","externalName":"initializeRewardedAd","help":"YandexMobileAds_initializeRewardedAd(adUnitId)","hidden":false,"kind":4,"returnType":1,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"YandexMobileAds_showRewardedAd","argCount":0,"args":[],"documentation":"","externalName":"showRewardedAd","help":"YandexMobileAds_showRewardedAd()","hidden":false,"kind":4,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"YandexMobileAds_iOS_getTrackingAuthorizationStatus","argCount":0,"args":[],"documentation":"","externalName":"getTrackingAuthorizationStatus","help":"YandexMobileAds_iOS_getTrackingAuthorizationStatus()","hidden":false,"kind":4,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"YandexMobileAds_iOS_requestTrackingAuthorization","argCount":0,"args":[],"documentation":"","externalName":"requestTrackingAuthorization","help":"YandexMobileAds_iOS_requestTrackingAuthorization()","hidden":false,"kind":4,"returnType":1,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"YandexMobileAds_iOS_openAppSettingsScreen","argCount":0,"args":[],"documentation":"","externalName":"openAppSettingsScreen","help":"YandexMobileAds_iOS_openAppSettingsScreen()","hidden":false,"kind":4,"returnType":1,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"YandexMobileAds_showBanner","argCount":0,"args":[
            1,
            2,
          ],"documentation":"","externalName":"showBanner","help":"YandexMobileAds_showBanner(adUnitId, bannerPosition)","hidden":false,"kind":4,"returnType":1,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"YandexMobileAds_removeBanner","argCount":0,"args":[],"documentation":"","externalName":"removeBanner","help":"YandexMobileAds_removeBanner()","hidden":false,"kind":4,"returnType":1,},
      ],"init":"","kind":4,"order":[
        {"name":"YandexMobileAds_initialize","path":"extensions/YandexMobileAds/YandexMobileAds.yy",},
        {"name":"YandexMobileAds_initializeInterstitial","path":"extensions/YandexMobileAds/YandexMobileAds.yy",},
        {"name":"YandexMobileAds_showInterstitial","path":"extensions/YandexMobileAds/YandexMobileAds.yy",},
        {"name":"YandexMobileAds_initializeRewardedAd","path":"extensions/YandexMobileAds/YandexMobileAds.yy",},
        {"name":"YandexMobileAds_showRewardedAd","path":"extensions/YandexMobileAds/YandexMobileAds.yy",},
        {"name":"YandexMobileAds_showBanner","path":"extensions/YandexMobileAds/YandexMobileAds.yy",},
        {"name":"YandexMobileAds_removeBanner","path":"extensions/YandexMobileAds/YandexMobileAds.yy",},
        {"name":"YandexMobileAds_iOS_getTrackingAuthorizationStatus","path":"extensions/YandexMobileAds/YandexMobileAds.yy",},
        {"name":"YandexMobileAds_iOS_requestTrackingAuthorization","path":"extensions/YandexMobileAds/YandexMobileAds.yy",},
        {"name":"YandexMobileAds_iOS_openAppSettingsScreen","path":"extensions/YandexMobileAds/YandexMobileAds.yy",},
      ],"origname":"","ProxyFiles":[],"uncompress":false,"usesRunnerInterface":false,},
  ],
  "gradleinject": "\r\nimplementation 'com.yandex.android:mobileads-mediation:6.2.0.0'\r\n",
  "hasConvertedCodeInjection": true,
  "helpfile": "",
  "HTML5CodeInjection": "",
  "html5Props": false,
  "IncludedResources": [],
  "installdir": "",
  "iosCocoaPodDependencies": "\n",
  "iosCocoaPods": "\n  pod 'YandexMobileAdsAdMobAdapters'\n  pod 'YandexMobileAdsIronSourceAdapters'\n  pod 'YandexMobileAdsMediation'\n",
  "ioscodeinjection": "<YYIosCocoaPods>\n  pod 'YandexMobileAdsAdMobAdapters'\n  pod 'YandexMobileAdsIronSourceAdapters'\n  pod 'YandexMobileAdsMediation'\n</YYIosCocoaPods>\n\n<YYIosCocoaPodsDependencies>\n</YYIosCocoaPodsDependencies>\n\n<YYIosPlist>\n<key>SKAdNetworkItems</key>\n<array>\n        <!-- Yandex Ads -->\n    <dict>\n        <key>SKAdNetworkIdentifier</key>\n        <string>zq492l623r.skadnetwork</string>\n    </dict>\n    <dict>\n        <!-- AdMob -->\n        <key>SKAdNetworkIdentifier</key>\n        <string>cstr6suwn9.skadnetwork</string>\n    </dict>\n    <dict>\n        <!-- MyTarget -->\n        <key>SKAdNetworkIdentifier</key>\n        <string>n9x2a789qt.skadnetwork</string>\n    </dict>\n    <dict>\n        <!-- MyTarget -->\n        <key>SKAdNetworkIdentifier</key>\n        <string>r26jy69rpl.skadnetwork</string>\n    </dict>\n    <dict>\n        <!-- Start.io -->\n        <key>SKAdNetworkIdentifier</key>\n        <string>5l3tpt7t6e.skadnetwork</string>\n    </dict>\n    <dict>\n        <!-- UnityAds -->\n        <key>SKAdNetworkIdentifier</key>\n        <string>4dzt52r2t5.skadnetwork</string>\n    </dict>\n    <dict>\n        <!-- IronSource -->\n        <key>SKAdNetworkIdentifier</key>\n        <string>su67r6k2v3.skadnetwork</string>\n    </dict> \n    <dict>\n        <!-- Applovin -->\n        <key>SKAdNetworkIdentifier</key>\n        <string>ludvb6z3bs.skadnetwork</string>\n    </dict>\n    <dict>\n        <!-- Mintegral -->\n        <key>SKAdNetworkIdentifier</key>\n        <string>KBD757YWX3.skadnetwork</string>\n    </dict>\n</array>\n\n<key>GADApplicationIdentifier</key>\n\t<string>ca-app-pub-3940256099942544~1458002511</string>\n\n<key>NSUserTrackingUsageDescription</key>\n<string>This identifier will be used to deliver personalized ads to you.</string>\n</YYIosPlist>",
  "iosdelegatename": "",
  "iosplistinject": "\n<key>SKAdNetworkItems</key>\n<array>\n        <!-- Yandex Ads -->\n    <dict>\n        <key>SKAdNetworkIdentifier</key>\n        <string>zq492l623r.skadnetwork</string>\n    </dict>\n    <dict>\n        <!-- AdMob -->\n        <key>SKAdNetworkIdentifier</key>\n        <string>cstr6suwn9.skadnetwork</string>\n    </dict>\n    <dict>\n        <!-- MyTarget -->\n        <key>SKAdNetworkIdentifier</key>\n        <string>n9x2a789qt.skadnetwork</string>\n    </dict>\n    <dict>\n        <!-- MyTarget -->\n        <key>SKAdNetworkIdentifier</key>\n        <string>r26jy69rpl.skadnetwork</string>\n    </dict>\n    <dict>\n        <!-- Start.io -->\n        <key>SKAdNetworkIdentifier</key>\n        <string>5l3tpt7t6e.skadnetwork</string>\n    </dict>\n    <dict>\n        <!-- UnityAds -->\n        <key>SKAdNetworkIdentifier</key>\n        <string>4dzt52r2t5.skadnetwork</string>\n    </dict>\n    <dict>\n        <!-- IronSource -->\n        <key>SKAdNetworkIdentifier</key>\n        <string>su67r6k2v3.skadnetwork</string>\n    </dict> \n    <dict>\n        <!-- Applovin -->\n        <key>SKAdNetworkIdentifier</key>\n        <string>ludvb6z3bs.skadnetwork</string>\n    </dict>\n    <dict>\n        <!-- Mintegral -->\n        <key>SKAdNetworkIdentifier</key>\n        <string>KBD757YWX3.skadnetwork</string>\n    </dict>\n</array>\n\n<key>GADApplicationIdentifier</key>\n\t<string>ca-app-pub-3940256099942544~1458002511</string>\n\n<key>NSUserTrackingUsageDescription</key>\n<string>This identifier will be used to deliver personalized ads to you.</string>\n",
  "iosProps": true,
  "iosSystemFrameworkEntries": [
    {"resourceType":"GMExtensionFrameworkEntry","resourceVersion":"1.0","name":"AppTrackingTransparency.framework","embed":0,"weakReference":false,},
  ],
  "iosThirdPartyFrameworkEntries": [],
  "license": "",
  "maccompilerflags": "-fobjc-arc",
  "maclinkerflags": "",
  "macsourcedir": "",
  "options": [],
  "optionsFile": "options.json",
  "packageId": "",
  "parent": {
    "name": "YandexAdsAndroid",
    "path": "folders/Extensions/YandexAdsAndroid.yy",
  },
  "productId": "",
  "sourcedir": "",
  "supportedTargets": -1,
  "tvosclassname": null,
  "tvosCocoaPodDependencies": "",
  "tvosCocoaPods": "",
  "tvoscodeinjection": "",
  "tvosdelegatename": null,
  "tvosmaccompilerflags": "",
  "tvosmaclinkerflags": "",
  "tvosplistinject": "",
  "tvosProps": false,
  "tvosSystemFrameworkEntries": [],
  "tvosThirdPartyFrameworkEntries": [],
}