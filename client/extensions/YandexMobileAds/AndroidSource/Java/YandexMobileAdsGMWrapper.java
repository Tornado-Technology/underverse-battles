/*+*/package ${YYAndroidPackageName};

/*+*/import ${YYAndroidPackageName}.R;
/*+*/import com.yoyogames.runner.RunnerJNILib;

import android.os.Handler;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import com.yandex.mobile.ads.common.AdRequest;
import com.yandex.mobile.ads.common.AdRequestError;
import com.yandex.mobile.ads.common.ImpressionData;
import com.yandex.mobile.ads.common.InitializationListener;
import com.yandex.mobile.ads.common.MobileAds;
import com.yandex.mobile.ads.interstitial.InterstitialAd;
import com.yandex.mobile.ads.interstitial.InterstitialAdEventListener;
import com.yandex.mobile.ads.rewarded.Reward;
import com.yandex.mobile.ads.rewarded.RewardedAd;
import com.yandex.mobile.ads.rewarded.RewardedAdEventListener;

public class YandexMobileAdsGMWrapper {

    private final static int EVENT_OTHER_SOCIAL = 70;
    private final static int ASYNC_RESPONSE_YMA_INITIALIZED = 87432;
    private final static int ASYNC_RESPONSE_YMA_ON_REWARDED = 87433;

    private static InterstitialAd interstitialAd;
    private static RewardedAd rewardedAd;

    private static AdRequest adRequest;

    public static void initialize(final double userConsent) {
        MobileAds.setUserConsent(userConsent == 1);
        MobileAds.initialize(RunnerActivity.CurrentActivity, new InitializationListener() {
            @Override
            public void onInitializationCompleted() {
                int map = RunnerJNILib.jCreateDsMap(null, null, null);
                RunnerJNILib.DsMapAddDouble(map, "id", ASYNC_RESPONSE_YMA_INITIALIZED);
                RunnerJNILib.CreateAsynEventWithDSMap(map, EVENT_OTHER_SOCIAL);
            }
        });
    }

    public static void initializeInterstitial(final String adUnitId) {
        interstitialAd = new InterstitialAd(RunnerActivity.CurrentActivity);
        interstitialAd.setAdUnitId(adUnitId);

        interstitialAd.setInterstitialAdEventListener(new InterstitialAdEventListener() {
            @Override
            public void onAdLoaded() {}

            @Override
            public void onAdFailedToLoad(@NonNull AdRequestError adRequestError) {
                (new Handler(RunnerActivity.CurrentActivity.getMainLooper())).postDelayed(() -> initializeInterstitial(adUnitId), 5000);
            }

            @Override
            public void onAdShown() {
                interstitialAd = null;
            }

            @Override
            public void onAdDismissed() {
                initializeInterstitial(adUnitId);
            }

            @Override
            public void onAdClicked() {}

            @Override
            public void onLeftApplication() {}

            @Override
            public void onReturnedToApplication() {}

            @Override
            public void onImpression(@Nullable ImpressionData impressionData) {}
        });

        interstitialAd.loadAd(getAdRequest());
    }

    public static double showInterstitial() {
        if (interstitialAd != null && interstitialAd.isLoaded()) {
            interstitialAd.show();
            return 1;
        }
        else
            return 0;
    }

    public static void initializeRewardedAd(final String adUnitId) {
        rewardedAd = new RewardedAd(RunnerActivity.CurrentActivity);
        rewardedAd.setAdUnitId(adUnitId);

        rewardedAd.setRewardedAdEventListener(new RewardedAdEventListener() {
            @Override
            public void onAdLoaded() {}

            @Override
            public void onAdFailedToLoad(@NonNull AdRequestError adRequestError) {
                (new Handler(RunnerActivity.CurrentActivity.getMainLooper())).postDelayed(() -> initializeInterstitial(adUnitId), 5000);
            }

            @Override
            public void onAdShown() {
                rewardedAd = null;
            }

            @Override
            public void onAdDismissed() {
                initializeRewardedAd(adUnitId);
            }

            @Override
            public void onRewarded(@NonNull Reward reward) {
                int map = RunnerJNILib.jCreateDsMap(null, null, null);
                RunnerJNILib.DsMapAddDouble(map, "id", ASYNC_RESPONSE_YMA_ON_REWARDED);
                RunnerJNILib.DsMapAddDouble(map, "amount", reward.getAmount());
                RunnerJNILib.DsMapAddString(map, "type", reward.getType());
                RunnerJNILib.CreateAsynEventWithDSMap(map, EVENT_OTHER_SOCIAL);
            }

            @Override
            public void onAdClicked() {}

            @Override
            public void onLeftApplication() {}

            @Override
            public void onReturnedToApplication() {}

            @Override
            public void onImpression(@Nullable ImpressionData impressionData) {}
        });

        rewardedAd.loadAd(getAdRequest());
    }

    public static double showRewardedAd() {
        if (rewardedAd != null && rewardedAd.isLoaded()) {
            rewardedAd.show();
            return 1;
        }
        else
            return 0;
    }

    private static AdRequest getAdRequest() {
        if (adRequest == null)
            adRequest = new AdRequest.Builder().build();
        return adRequest;
    }

}
