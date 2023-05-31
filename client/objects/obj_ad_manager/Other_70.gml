// Early exit if there is no 'type' key defined
if (!ds_map_exists(async_load, "type")) exit;

// All the events triggered by the AdMob extension have a “type” key
// containing a string that starts with “AdMob_”.
switch(async_load[? "type"])
{
    // AdMob_Initialize() finished initializing the API
    case "AdMob_OnInitialized":

        // Now that we are sure that the API got initialized we can load
        // a new interstitial ad.(more info: AdMob_Interstitial_Load).
        // This function will generate an ASYNC SOCIAL EVENT.
		show_debug_message("AdMob_OnInitialized");
        AdMob_Interstitial_Load();
        break;

    // AdMob_Interstitial_Load() succeeded
    case "AdMob_Interstitial_OnLoaded":

        // At this point we should now have the interstitial ad loaded and
        // and we can check that using the ´AdMob_Interstitial_IsLoaded´
        // function. We are now ready to show the interstitial ad to the
        // user (more info: AdMob_Interstitial_Show). This function will
        // generate an ASYNC SOCIAL EVENT.
		show_debug_message("AdMob_Interstitial_OnLoaded");
        break;

    // AdMob_Interstitial_Load() failed
    case "AdMob_Interstitial_OnLoadFailed":

        // At this point there was a problem while loading the
        // interstitial ad. Here we can add some code to deal with it.

        // NOTE: Don’t try to reload the interstitial ad here because
        // it can lead to an infinite loop.
		show_debug_message("AdMob_Interstitial_OnLoadFailed");
        break;

    // AdMob_Interstitial_Show() succeeded
    case "AdMob_Interstitial_OnFullyShown":

        // At this point the interstitial ad is on screen and the user is
        // looking at it. Note that at this point in time your game is
        // paused and will remain paused until the interstitial gets
        // dismissed.
		show_debug_message("AdMob_Interstitial_OnFullyShown");
        break;

    // AdMob_Interstitial_Show() failed
    case "AdMob_Interstitial_OnShowFailed":

        // At this point the interstitial ad failed to get shown to the
        // user. You can add code to deal with the problem here.

        // NOTE: Don’t try to reload/show the interstitial ad here
        // because it can lead to an infinite loop.
		show_debug_message("AdMob_Interstitial_OnShowFailed");
        break;

    // Interstitial got dismissed
    case "AdMob_Interstitial_OnDismissed":

        // At this point the interstitial ad got dismissed by the user and
        // the game logic is running again.
		show_debug_message("AdMob_Interstitial_OnDismissed");
		AdMob_Interstitial_Load();
        break;

}