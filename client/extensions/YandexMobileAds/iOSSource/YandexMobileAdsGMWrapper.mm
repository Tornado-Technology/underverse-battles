#import "YandexMobileAdsGMWrapper.h"
#import <AppTrackingTransparency/AppTrackingTransparency.h>

@implementation YandexMobileAdsGMWrapper

const int EVENT_OTHER_SOCIAL = 70;
const int ASYNC_RESPONSE_YMA_ON_REWARDED = 87433;
const int ASYNC_RESPONSE_YMA_REWARDED_AD_DISAPPEAR = 87434;

const int ASYNC_RESPONSE_YMA_REQUEST_TRACKING_STATUS = 87440;

const int TRACKING_STATUS_AUTHORIZED = 0;
const int TRACKING_STATUS_DENIED = 1;
const int TRACKING_STATUS_NOT_DETERMINED = 2;
const int TRACKING_STATUS_RESTRICTED = 3;

extern UIViewController *g_controller;

extern "C" int dsMapCreate();
extern "C" void dsMapAddInt(int _dsMap, char* _key, int _value);
extern "C" void dsMapAddString(int _dsMap, char* _key, char* _value);
extern "C" void CreateAsyncEventOfTypeWithDSMap(int dsmapindex, int event_index);

NSString *interstitialAdUnitId, *rewardedAdUnitId;

//interstitial
-(void)initializeInterstitial:(NSString *) adUnitId {
    interstitialAdUnitId = adUnitId;
    self.interstitialAd = [[YMAInterstitialAd alloc] initWithAdUnitID:adUnitId];
    self.interstitialAd.delegate = self;
    [self.interstitialAd load];
}

- (void)interstitialAdDidFailToLoad:(nonnull YMAInterstitialAd *)interstitialAd error:(nonnull NSError *)error {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 5), dispatch_get_main_queue(), ^{
        [self initializeInterstitial:interstitialAdUnitId];
    });
}

- (void)interstitialAdDidDisappear:(nonnull YMAInterstitialAd *)interstitialAd {
    [self initializeInterstitial:interstitialAdUnitId];
}

-(double)showInterstitial {
    if (self.interstitialAd && self.interstitialAd.loaded) {
        [self.interstitialAd presentFromViewController:g_controller];
        return 1;
    }
    else
        return 0;
}

//rewarded ad
-(void)initializeRewardedAd:(NSString  *) adUnitId {
    rewardedAdUnitId = adUnitId;
    self.rewardedAd = [[YMARewardedAd alloc] initWithAdUnitID:adUnitId];
    self.rewardedAd.delegate = self;
    [self.rewardedAd load];
}

- (void)rewardedAdDidFailToLoad:(nonnull YMARewardedAd *)rewardedAd error:(nonnull NSError *)error {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 5), dispatch_get_main_queue(), ^{
        [self initializeRewardedAd:rewardedAdUnitId];
    });
}

- (void)rewardedAdDidDisappear:(nonnull YMARewardedAd *)rewardedAd {
    [self initializeRewardedAd:rewardedAdUnitId];
    
    int map = dsMapCreate();
    dsMapAddInt(map, (char *)"id", ASYNC_RESPONSE_YMA_REWARDED_AD_DISAPPEAR);
    CreateAsyncEventOfTypeWithDSMap(map, EVENT_OTHER_SOCIAL);
}

- (void)rewardedAd:(nonnull YMARewardedAd *)rewardedAd didReward:(nonnull id<YMAReward>)reward {
    int map = dsMapCreate();
    dsMapAddInt(map, (char *)"id", ASYNC_RESPONSE_YMA_ON_REWARDED);
    dsMapAddInt(map, (char *)"amount", reward.amount);
    dsMapAddString(map, (char *)"type", (char *)[reward.type UTF8String]);
    CreateAsyncEventOfTypeWithDSMap(map, EVENT_OTHER_SOCIAL);
}

-(double)showRewardedAd {
    if (self.rewardedAd && self.rewardedAd.loaded) {
        [self.rewardedAd presentFromViewController:g_controller];
        return 1;
    }
    else
        return 0;
}

//IDFA stuff
-(double)getTrackingAuthorizationStatus {
    if (@available(iOS 14, *)) {
        switch (ATTrackingManager.trackingAuthorizationStatus) {
            case ATTrackingManagerAuthorizationStatusNotDetermined:
                return TRACKING_STATUS_NOT_DETERMINED;
            case ATTrackingManagerAuthorizationStatusRestricted:
                return TRACKING_STATUS_RESTRICTED;
            case ATTrackingManagerAuthorizationStatusDenied:
                return TRACKING_STATUS_DENIED;
            case ATTrackingManagerAuthorizationStatusAuthorized:
                return TRACKING_STATUS_AUTHORIZED;
        }
    }
    else
        return TRACKING_STATUS_AUTHORIZED;
}

-(void)requestTrackingAuthorization {
    char *statusKey = (char *)"status";
    if (@available(iOS 14, *)) {
        [ATTrackingManager requestTrackingAuthorizationWithCompletionHandler:^(ATTrackingManagerAuthorizationStatus status) {
            int map = dsMapCreate();
            dsMapAddInt(map, (char *)"id", ASYNC_RESPONSE_YMA_REQUEST_TRACKING_STATUS);
            switch (status) {
                case ATTrackingManagerAuthorizationStatusAuthorized:
                    dsMapAddInt(map, statusKey, TRACKING_STATUS_AUTHORIZED);
                    break;
                case ATTrackingManagerAuthorizationStatusDenied:
                    dsMapAddInt(map, statusKey, TRACKING_STATUS_DENIED);
                    break;
                case ATTrackingManagerAuthorizationStatusNotDetermined:
                    dsMapAddInt(map, statusKey, TRACKING_STATUS_NOT_DETERMINED);
                    break;
                case ATTrackingManagerAuthorizationStatusRestricted:
                    dsMapAddInt(map, statusKey, TRACKING_STATUS_RESTRICTED);
                    break;
            }
            CreateAsyncEventOfTypeWithDSMap(map, EVENT_OTHER_SOCIAL);
        }];
    }
    else {
        int map = dsMapCreate();
        dsMapAddInt(map, statusKey, TRACKING_STATUS_AUTHORIZED);
        CreateAsyncEventOfTypeWithDSMap(map, EVENT_OTHER_SOCIAL);
    }
}

@end
