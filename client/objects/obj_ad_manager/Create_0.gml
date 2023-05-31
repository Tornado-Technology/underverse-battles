// Ad initialize
if (!default_mode) {
	AdMob_SetTestDeviceId();
}

AdMob_Initialize();

// Show ads for under-age users
AdMob_Targeting_UnderAge(true);

// Show ads for children
AdMob_Targeting_COPPA(true);
	
// Set a maximum content rating of the ads to be displayed
AdMob_Targeting_MaxAdContentRating(AdMob_ContentRating_GENERAL);

var interstitial_id = "ca-app-pub-4606187378129498/2697239852";
AdMob_Interstitial_Init(interstitial_id);