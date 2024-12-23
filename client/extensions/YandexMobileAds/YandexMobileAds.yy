{
  "$GMExtension":"",
  "%Name":"YandexMobileAds",
  "androidactivityinject":"",
  "androidclassname":"YandexMobileAdsGMWrapper",
  "androidcodeinjection":"//minSdkVersion 21\r\n\r\n<YYAndroidGradleDependencies >\r\nimplementation 'com.yandex.android:mobileads-mediation:6.2.0.0'\r\n</YYAndroidGradleDependencies >\n\n<YYAndroidTopLevelGradleAllprojectsRepositories>\r\n        maven { // IronSource\r\n            url 'https://android-sdk.is.com/'\r\n        }\r\n        maven { // Pangle\r\n            url 'https://artifact.bytedance.com/repository/pangle'\r\n        }\r\n        maven { // Tapjoy\r\n            url \"https://sdk.tapjoy.com/\"\r\n        }\r\n        maven { // Mintegral\r\n            url \"https://dl-maven-android.mintegral.com/repository/mbridge_android_sdk_oversea\"\r\n        }\r\n        maven { // Chartboost\r\n            url \"https://cboost.jfrog.io/artifactory/chartboost-ads/\"\r\n        }\r\n</YYAndroidTopLevelGradleAllprojectsRepositories>\r\n\r\n<YYAndroidManifestApplicationInject>\r\n        <meta-data\r\n            android:name=\"com.google.android.gms.ads.APPLICATION_ID\"\r\n            android:value=\"ca-app-pub-8858162097015410~4385267910\"/>\r\n</YYAndroidManifestApplicationInject>\r\n\r\n<YYAndroidGradleAndroid>\r\n    compileOptions {\r\n        sourceCompatibility JavaVersion.VERSION_1_8\r\n        targetCompatibility JavaVersion.VERSION_1_8\r\n    }\r\n</YYAndroidGradleAndroid>\r\n\r\n<YYAndroidLayout>\r\n<FrameLayout\r\n    xmlns:android=\"http://schemas.android.com/apk/res/android\"\r\n    android:id=\"@+id/yandex_banner_container\"\r\n    android:layout_width=\"match_parent\"\r\n    android:layout_height=\"match_parent\"/>\r\n</YYAndroidLayout>\r\n\r\n<YYIosPlist>\n<key>SKAdNetworkItems</key>\n<array>\n    <dict>\n        <key>SKAdNetworkIdentifier</key>\n        <string>zq492l623r.skadnetwork</string>\n    </dict>\n</array>\n</YYIosPlist>",
  "androidinject":"\r\n        <meta-data android:name=\"com.google.android.gms.ads.APPLICATION_ID\" android:value=\"ca-app-pub-8858162097015410~4385267910\"></meta-data>\r\n",
  "androidmanifestinject":"",
  "androidPermissions":[],
  "androidProps":true,
  "androidsourcedir":"",
  "author":"",
  "classname":"YandexMobileAdsGMWrapper",
  "copyToTargets":12,
  "description":"",
  "exportToGame":true,
  "extensionVersion":"0.0.1",
  "files":[
    {"$GMExtensionFile":"","%Name":"YandexMobileAds.ext","constants":[
        {"$GMExtensionConstant":"","%Name":"YandexMobileAds_ASYNC_RESPONSE_YMA_INITIALIZED","hidden":false,"name":"YandexMobileAds_ASYNC_RESPONSE_YMA_INITIALIZED","resourceType":"GMExtensionConstant","resourceVersion":"2.0","value":"87432",},
        {"$GMExtensionConstant":"","%Name":"YandexMobileAds_ASYNC_RESPONSE_YMA_ON_REWARDED","hidden":false,"name":"YandexMobileAds_ASYNC_RESPONSE_YMA_ON_REWARDED","resourceType":"GMExtensionConstant","resourceVersion":"2.0","value":"87433",},
        {"$GMExtensionConstant":"","%Name":"YandexMobileAds_ASYNC_RESPONSE_YMA_REWARDED_AD_DISAPPEAR","hidden":false,"name":"YandexMobileAds_ASYNC_RESPONSE_YMA_REWARDED_AD_DISAPPEAR","resourceType":"GMExtensionConstant","resourceVersion":"2.0","value":"87434",},
        {"$GMExtensionConstant":"","%Name":"YandexMobileAds_BANNER_TOP","hidden":false,"name":"YandexMobileAds_BANNER_TOP","resourceType":"GMExtensionConstant","resourceVersion":"2.0","value":"0",},
        {"$GMExtensionConstant":"","%Name":"YandexMobileAds_BANNER_BOTTOM","hidden":false,"name":"YandexMobileAds_BANNER_BOTTOM","resourceType":"GMExtensionConstant","resourceVersion":"2.0","value":"1",},
        {"$GMExtensionConstant":"","%Name":"YandexMobileAds_IOS_TRACKING_STATUS_AUTHORIZED","hidden":false,"name":"YandexMobileAds_IOS_TRACKING_STATUS_AUTHORIZED","resourceType":"GMExtensionConstant","resourceVersion":"2.0","value":"0",},
        {"$GMExtensionConstant":"","%Name":"YandexMobileAds_IOS_TRACKING_STATUS_DENIED","hidden":false,"name":"YandexMobileAds_IOS_TRACKING_STATUS_DENIED","resourceType":"GMExtensionConstant","resourceVersion":"2.0","value":"1",},
        {"$GMExtensionConstant":"","%Name":"YandexMobileAds_IOS_TRACKING_STATUS_NOT_DETERMINED","hidden":false,"name":"YandexMobileAds_IOS_TRACKING_STATUS_NOT_DETERMINED","resourceType":"GMExtensionConstant","resourceVersion":"2.0","value":"2",},
        {"$GMExtensionConstant":"","%Name":"YandexMobileAds_IOS_TRACKING_STATUS_RESTRICTED","hidden":false,"name":"YandexMobileAds_IOS_TRACKING_STATUS_RESTRICTED","resourceType":"GMExtensionConstant","resourceVersion":"2.0","value":"3",},
        {"$GMExtensionConstant":"","%Name":"YandexMobileAds_IOS_ASYNC_RESPONSE_REQUEST_TRACKING_STATUS","hidden":false,"name":"YandexMobileAds_IOS_ASYNC_RESPONSE_REQUEST_TRACKING_STATUS","resourceType":"GMExtensionConstant","resourceVersion":"2.0","value":"87440",},
      ],"copyToTargets":12,"filename":"YandexMobileAds.ext","final":"","functions":[
        {"$GMExtensionFunction":"","%Name":"YandexMobileAds_initialize","argCount":0,"args":[2,],"documentation":"","externalName":"initialize","help":"YandexMobileAds_initialize(userConsent)","hidden":false,"kind":4,"name":"YandexMobileAds_initialize","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":1,},
        {"$GMExtensionFunction":"","%Name":"YandexMobileAds_initializeInterstitial","argCount":0,"args":[1,],"documentation":"","externalName":"initializeInterstitial","help":"YandexMobileAds_initializeInterstitial(adUnitId)","hidden":false,"kind":4,"name":"YandexMobileAds_initializeInterstitial","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":1,},
        {"$GMExtensionFunction":"","%Name":"YandexMobileAds_showInterstitial","argCount":0,"args":[],"documentation":"","externalName":"showInterstitial","help":"YandexMobileAds_showInterstitial()","hidden":false,"kind":4,"name":"YandexMobileAds_showInterstitial","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"YandexMobileAds_initializeRewardedAd","argCount":0,"args":[1,],"documentation":"","externalName":"initializeRewardedAd","help":"YandexMobileAds_initializeRewardedAd(adUnitId)","hidden":false,"kind":4,"name":"YandexMobileAds_initializeRewardedAd","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":1,},
        {"$GMExtensionFunction":"","%Name":"YandexMobileAds_showRewardedAd","argCount":0,"args":[],"documentation":"","externalName":"showRewardedAd","help":"YandexMobileAds_showRewardedAd()","hidden":false,"kind":4,"name":"YandexMobileAds_showRewardedAd","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"YandexMobileAds_iOS_getTrackingAuthorizationStatus","argCount":0,"args":[],"documentation":"","externalName":"getTrackingAuthorizationStatus","help":"YandexMobileAds_iOS_getTrackingAuthorizationStatus()","hidden":false,"kind":4,"name":"YandexMobileAds_iOS_getTrackingAuthorizationStatus","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"YandexMobileAds_iOS_requestTrackingAuthorization","argCount":0,"args":[],"documentation":"","externalName":"requestTrackingAuthorization","help":"YandexMobileAds_iOS_requestTrackingAuthorization()","hidden":false,"kind":4,"name":"YandexMobileAds_iOS_requestTrackingAuthorization","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":1,},
        {"$GMExtensionFunction":"","%Name":"YandexMobileAds_iOS_openAppSettingsScreen","argCount":0,"args":[],"documentation":"","externalName":"openAppSettingsScreen","help":"YandexMobileAds_iOS_openAppSettingsScreen()","hidden":false,"kind":4,"name":"YandexMobileAds_iOS_openAppSettingsScreen","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":1,},
        {"$GMExtensionFunction":"","%Name":"YandexMobileAds_showBanner","argCount":0,"args":[1,2,],"documentation":"","externalName":"showBanner","help":"YandexMobileAds_showBanner(adUnitId, bannerPosition)","hidden":false,"kind":4,"name":"YandexMobileAds_showBanner","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":1,},
        {"$GMExtensionFunction":"","%Name":"YandexMobileAds_removeBanner","argCount":0,"args":[],"documentation":"","externalName":"removeBanner","help":"YandexMobileAds_removeBanner()","hidden":false,"kind":4,"name":"YandexMobileAds_removeBanner","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":1,},
      ],"init":"","kind":4,"name":"YandexMobileAds.ext","order":[
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
      ],"origname":"","ProxyFiles":[],"resourceType":"GMExtensionFile","resourceVersion":"2.0","uncompress":false,"usesRunnerInterface":false,},
  ],
  "gradleinject":"\r\nimplementation 'com.yandex.android:mobileads-mediation:6.2.0.0'\r\n",
  "hasConvertedCodeInjection":true,
  "helpfile":"",
  "HTML5CodeInjection":"",
  "html5Props":false,
  "IncludedResources":[],
  "installdir":"",
  "iosCocoaPodDependencies":"\n",
  "iosCocoaPods":"\n  pod 'YandexMobileAdsAdMobAdapters'\n  pod 'YandexMobileAdsIronSourceAdapters'\n  pod 'YandexMobileAdsMediation'\n",
  "ioscodeinjection":"<YYIosCocoaPods>\n  pod 'YandexMobileAdsAdMobAdapters'\n  pod 'YandexMobileAdsIronSourceAdapters'\n  pod 'YandexMobileAdsMediation'\n</YYIosCocoaPods>\n\n<YYIosCocoaPodsDependencies>\n</YYIosCocoaPodsDependencies>\n\n<YYIosPlist>\n<key>SKAdNetworkItems</key>\n<array>\n        <!-- Yandex Ads -->\n    <dict>\n        <key>SKAdNetworkIdentifier</key>\n        <string>zq492l623r.skadnetwork</string>\n    </dict>\n    <dict>\n        <!-- AdMob -->\n        <key>SKAdNetworkIdentifier</key>\n        <string>cstr6suwn9.skadnetwork</string>\n    </dict>\n    <dict>\n        <!-- MyTarget -->\n        <key>SKAdNetworkIdentifier</key>\n        <string>n9x2a789qt.skadnetwork</string>\n    </dict>\n    <dict>\n        <!-- MyTarget -->\n        <key>SKAdNetworkIdentifier</key>\n        <string>r26jy69rpl.skadnetwork</string>\n    </dict>\n    <dict>\n        <!-- Start.io -->\n        <key>SKAdNetworkIdentifier</key>\n        <string>5l3tpt7t6e.skadnetwork</string>\n    </dict>\n    <dict>\n        <!-- UnityAds -->\n        <key>SKAdNetworkIdentifier</key>\n        <string>4dzt52r2t5.skadnetwork</string>\n    </dict>\n    <dict>\n        <!-- IronSource -->\n        <key>SKAdNetworkIdentifier</key>\n        <string>su67r6k2v3.skadnetwork</string>\n    </dict> \n    <dict>\n        <!-- Applovin -->\n        <key>SKAdNetworkIdentifier</key>\n        <string>ludvb6z3bs.skadnetwork</string>\n    </dict>\n    <dict>\n        <!-- Mintegral -->\n        <key>SKAdNetworkIdentifier</key>\n        <string>KBD757YWX3.skadnetwork</string>\n    </dict>\n</array>\n\n<key>GADApplicationIdentifier</key>\n\t<string>ca-app-pub-3940256099942544~1458002511</string>\n\n<key>NSUserTrackingUsageDescription</key>\n<string>This identifier will be used to deliver personalized ads to you.</string>\n</YYIosPlist>",
  "iosdelegatename":"",
  "iosplistinject":"\n<key>SKAdNetworkItems</key>\n<array>\n        <!-- Yandex Ads -->\n    <dict>\n        <key>SKAdNetworkIdentifier</key>\n        <string>zq492l623r.skadnetwork</string>\n    </dict>\n    <dict>\n        <!-- AdMob -->\n        <key>SKAdNetworkIdentifier</key>\n        <string>cstr6suwn9.skadnetwork</string>\n    </dict>\n    <dict>\n        <!-- MyTarget -->\n        <key>SKAdNetworkIdentifier</key>\n        <string>n9x2a789qt.skadnetwork</string>\n    </dict>\n    <dict>\n        <!-- MyTarget -->\n        <key>SKAdNetworkIdentifier</key>\n        <string>r26jy69rpl.skadnetwork</string>\n    </dict>\n    <dict>\n        <!-- Start.io -->\n        <key>SKAdNetworkIdentifier</key>\n        <string>5l3tpt7t6e.skadnetwork</string>\n    </dict>\n    <dict>\n        <!-- UnityAds -->\n        <key>SKAdNetworkIdentifier</key>\n        <string>4dzt52r2t5.skadnetwork</string>\n    </dict>\n    <dict>\n        <!-- IronSource -->\n        <key>SKAdNetworkIdentifier</key>\n        <string>su67r6k2v3.skadnetwork</string>\n    </dict> \n    <dict>\n        <!-- Applovin -->\n        <key>SKAdNetworkIdentifier</key>\n        <string>ludvb6z3bs.skadnetwork</string>\n    </dict>\n    <dict>\n        <!-- Mintegral -->\n        <key>SKAdNetworkIdentifier</key>\n        <string>KBD757YWX3.skadnetwork</string>\n    </dict>\n</array>\n\n<key>GADApplicationIdentifier</key>\n\t<string>ca-app-pub-3940256099942544~1458002511</string>\n\n<key>NSUserTrackingUsageDescription</key>\n<string>This identifier will be used to deliver personalized ads to you.</string>\n",
  "iosProps":true,
  "iosSystemFrameworkEntries":[
    {"$GMExtensionFrameworkEntry":"","%Name":"AppTrackingTransparency.framework","embed":0,"name":"AppTrackingTransparency.framework","resourceType":"GMExtensionFrameworkEntry","resourceVersion":"2.0","weakReference":false,},
  ],
  "iosThirdPartyFrameworkEntries":[],
  "license":"",
  "maccompilerflags":"-fobjc-arc",
  "maclinkerflags":"",
  "macsourcedir":"",
  "name":"YandexMobileAds",
  "options":[],
  "optionsFile":"options.json",
  "packageId":"",
  "parent":{
    "name":"YandexAdsAndroid",
    "path":"folders/Extensions/YandexAdsAndroid.yy",
  },
  "productId":"",
  "resourceType":"GMExtension",
  "resourceVersion":"2.0",
  "sourcedir":"",
  "supportedTargets":-1,
  "tvosclassname":null,
  "tvosCocoaPodDependencies":"",
  "tvosCocoaPods":"",
  "tvoscodeinjection":"",
  "tvosdelegatename":null,
  "tvosmaccompilerflags":"",
  "tvosmaclinkerflags":"",
  "tvosplistinject":"",
  "tvosProps":false,
  "tvosSystemFrameworkEntries":[],
  "tvosThirdPartyFrameworkEntries":[],
}