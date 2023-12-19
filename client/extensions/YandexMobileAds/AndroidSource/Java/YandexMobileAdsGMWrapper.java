package ${YYAndroidPackageName};

import ${YYAndroidPackageName}.R;
import com.yoyogames.runner.RunnerJNILib;

import android.os.Build;
import android.os.Handler;
import android.view.Gravity;
import android.view.ViewGroup;
import android.widget.FrameLayout;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import com.yandex.mobile.ads.banner.BannerAdSize;
import com.yandex.mobile.ads.banner.BannerAdView;
import com.yandex.mobile.ads.common.AdError;
import com.yandex.mobile.ads.common.AdRequest;
import com.yandex.mobile.ads.common.AdRequestConfiguration;
import com.yandex.mobile.ads.common.AdRequestError;
import com.yandex.mobile.ads.common.ImpressionData;
import com.yandex.mobile.ads.common.MobileAds;
import com.yandex.mobile.ads.interstitial.InterstitialAd;
import com.yandex.mobile.ads.interstitial.InterstitialAdEventListener;
import com.yandex.mobile.ads.interstitial.InterstitialAdLoadListener;
import com.yandex.mobile.ads.interstitial.InterstitialAdLoader;
import com.yandex.mobile.ads.rewarded.Reward;
import com.yandex.mobile.ads.rewarded.RewardedAd;
import com.yandex.mobile.ads.rewarded.RewardedAdEventListener;
import com.yandex.mobile.ads.rewarded.RewardedAdLoadListener;
import com.yandex.mobile.ads.rewarded.RewardedAdLoader;

public class YandexMobileAdsGMWrapper {

    private final static int EVENT_OTHER_SOCIAL = 70;
    private final static int ASYNC_RESPONSE_YMA_INITIALIZED = 87432;
    private final static int ASYNC_RESPONSE_YMA_ON_REWARDED = 87433;
    private final static int ASYNC_RESPONSE_YMA_REWARDED_AD_DISAPPEAR = 87434;

    private final static int BANNER_POSITION_TOP = 0;
    private final static int BANNER_POSITION_BOTTOM = 1;

    private static InterstitialAd interstitialAd;
    private static RewardedAd rewardedAd;

    private static AdRequest adRequest;

    private static BannerAdView bannerAdView;

    public static void initialize(final double userConsent) {
        MobileAds.setUserConsent(userConsent == 1);
        MobileAds.initialize(RunnerActivity.CurrentActivity, () -> {
            int map = RunnerJNILib.jCreateDsMap(null, null, null);
            RunnerJNILib.DsMapAddDouble(map, "id", ASYNC_RESPONSE_YMA_INITIALIZED);
            RunnerJNILib.CreateAsynEventWithDSMap(map, EVENT_OTHER_SOCIAL);
        });
    }

    public static void initializeInterstitial(final String adUnitId) {

        InterstitialAdLoader interstitialAdLoader = new InterstitialAdLoader(RunnerActivity.CurrentActivity);
        interstitialAdLoader.setAdLoadListener(new InterstitialAdLoadListener() {
            @Override
            public void onAdLoaded(@NonNull InterstitialAd _interstitialAd) {
                interstitialAd = _interstitialAd;

                interstitialAd.setAdEventListener(new InterstitialAdEventListener() {
                    @Override
                    public void onAdShown() {
                        interstitialAd = null;
                    }

                    @Override
                    public void onAdFailedToShow(@NonNull AdError adError) {}

                    @Override
                    public void onAdDismissed() {
                        initializeInterstitial(adUnitId);
                    }

                    @Override
                    public void onAdClicked() {}

                    @Override
                    public void onAdImpression(@Nullable ImpressionData impressionData) {}
                });
            }

            @Override
            public void onAdFailedToLoad(@NonNull AdRequestError adRequestError) {
                (new Handler(RunnerActivity.CurrentActivity.getMainLooper())).postDelayed(() -> initializeInterstitial(adUnitId), 5000);
            }
        });
        interstitialAdLoader.loadAd(new AdRequestConfiguration.Builder(adUnitId).build());
    }

    public static double showInterstitial() {
        if (interstitialAd != null) {
            interstitialAd.show(RunnerActivity.CurrentActivity);
            return 1;
        }
        else
            return 0;
    }

    public static void initializeRewardedAd(final String adUnitId) {
        RewardedAdLoader rewardedAdLoader = new RewardedAdLoader(RunnerActivity.CurrentActivity);
        rewardedAdLoader.setAdLoadListener(new RewardedAdLoadListener() {
            @Override
            public void onAdLoaded(@NonNull RewardedAd _rewardedAd) {
                rewardedAd = _rewardedAd;

                rewardedAd.setAdEventListener(new RewardedAdEventListener() {
                    @Override
                    public void onAdShown() {
                        rewardedAd = null;
                    }

                    @Override
                    public void onAdFailedToShow(@NonNull AdError adError) {}

                    @Override
                    public void onAdDismissed() {
                        initializeRewardedAd(adUnitId);

                        int map = RunnerJNILib.jCreateDsMap(null, null, null);
                        RunnerJNILib.DsMapAddDouble(map, "id", ASYNC_RESPONSE_YMA_REWARDED_AD_DISAPPEAR);
                        RunnerJNILib.CreateAsynEventWithDSMap(map, EVENT_OTHER_SOCIAL);
                    }

                    @Override
                    public void onAdClicked() {}

                    @Override
                    public void onAdImpression(@Nullable ImpressionData impressionData) {}

                    @Override
                    public void onRewarded(@NonNull Reward reward) {
                        int map = RunnerJNILib.jCreateDsMap(null, null, null);
                        RunnerJNILib.DsMapAddDouble(map, "id", ASYNC_RESPONSE_YMA_ON_REWARDED);
                        RunnerJNILib.DsMapAddDouble(map, "amount", reward.getAmount());
                        RunnerJNILib.DsMapAddString(map, "type", reward.getType());
                        RunnerJNILib.CreateAsynEventWithDSMap(map, EVENT_OTHER_SOCIAL);
                    }
                });
            }

            @Override
            public void onAdFailedToLoad(@NonNull AdRequestError adRequestError) {
                (new Handler(RunnerActivity.CurrentActivity.getMainLooper())).postDelayed(() -> initializeInterstitial(adUnitId), 5000);
            }
        });
        rewardedAdLoader.loadAd(new AdRequestConfiguration.Builder(adUnitId).build());
    }

    public static double showRewardedAd() {
        if (rewardedAd != null) {
            rewardedAd.show(RunnerActivity.CurrentActivity);
            return 1;
        }
        else
            return 0;
    }

    public static void showBanner(String adUnitId, double bannerPosition) {
        RunnerActivity.CurrentActivity.runOnUiThread(() -> {
            bannerAdView = new BannerAdView(RunnerActivity.CurrentActivity);
            bannerAdView.setAdUnitId(adUnitId);
            bannerAdView.setAdSize(BannerAdSize.stickySize(RunnerActivity.CurrentActivity, RunnerActivity.CurrentActivity.getResources().getDisplayMetrics().widthPixels));

            FrameLayout container = RunnerActivity.CurrentActivity.findViewById(R.id.yandex_banner_container);
            bannerAdView.setLayoutParams(new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT, bannerPosition == BANNER_POSITION_TOP ? Gravity.TOP : Gravity.BOTTOM));
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M)
                bannerAdView.setForegroundGravity(Gravity.CENTER);
            container.addView(bannerAdView);

            AdRequest adRequest = new AdRequest.Builder().build();
            bannerAdView.loadAd(adRequest);
        });
    }

    public static void removeBanner() {
        if (bannerAdView != null) {
            RunnerActivity.CurrentActivity.runOnUiThread(() -> {
                FrameLayout container = RunnerActivity.CurrentActivity.findViewById(R.id.yandex_banner_container);
                container.removeView(bannerAdView);
                bannerAdView = null;
            });
        }
    }

    private static AdRequest getAdRequest() {
        if (adRequest == null)
            adRequest = new AdRequest.Builder().build();
        return adRequest;
    }

}
