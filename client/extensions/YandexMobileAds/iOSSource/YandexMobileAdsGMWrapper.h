#import "YandexMobileAds/YandexMobileAds.h"

@interface YandexMobileAdsGMWrapper : NSObject<YMAInterstitialAdDelegate, YMARewardedAdDelegate>

@property (nonatomic, strong) YMAInterstitialAd *interstitialAd;
@property (nonatomic, strong) YMARewardedAd *rewardedAd;

-(void)initializeInterstitial:(NSString *) adUnitId;
-(double)showInterstitial;
-(void)initializeRewardedAd:(NSString  *) adUnitId;
-(double)showRewardedAd;

-(double)getTrackingAuthorizationStatus;
-(void)requestTrackingAuthorization;

@end
