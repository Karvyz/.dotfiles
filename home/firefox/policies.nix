{
  programs.firefox.policies = {
    DisableAppUpdate = true;
    DisableSystemAddonUpdate = true;
    DisableProfileImport = true;
    DisableFirefoxStudies = true;
    DisableTelemetry = true;
    DisableFeedbackCommands = true;
    DisablePocket = true;
    DisableDeveloperTools = false;
		OfferToSaveLogins = false;
		AutofillAddressEnabled = false;
		AutofillCreditCardEnabled = false;

		Homepage.Startpage = "none";
		DisplayBookmarksToolbar = "never";
    NoDefaultBookmarks = true;
    FirefoxHome = {
      Search = true;
      TopSites = false;
      SponsoredTopSites = false;
      Highlights = false;
      Pocket = false;
      SponsoredPocket = false;
      Snippets = false;
      Locked = false;
    };

    FirefoxSuggest = {
      WebSuggestions = false;
      SponsoredSuggestions = false;
      ImproveSuggest = false;
    };
    OverrideFirstRunPage = "";
    Extensions = {
      Install = [
        "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi"
        "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi"
      ];
      Uninstall = [
        "google@search.mozilla.org"
        "bing@search.mozilla.org"
        "amazondotcom@search.mozilla.org"
        "ebay@search.mozilla.org"
        "wikipedia@search.mozilla.org"
      ];
    };
    ExtensionSettings = {
      "google@search.mozilla.org".installation_mode = "blocked";
      "bing@search.mozilla.org".installation_mode = "blocked";
      "amazondotcom@search.mozilla.org".installation_mode = "blocked";
      "ebay@search.mozilla.org".installation_mode = "blocked";
      "wikipedia@search.mozilla.org".installation_mode = "blocked";
    };
    SearchEngines = {
      PreventInstalls = false;
      Remove = [
        "Google"
        "Bing"
        "Amazon.com"
        "eBay"
        "Wikipedia"
      ];
      Default = "StartPage";
      Add = [
        {
          Name = "StartPage";
          Description = "The world's most private search engine";
          Alias = "";
          Method = "GET";
          URLTemplate = "https://www.startpage.com/sp/search?query={searchTerms}&cat=web&pl=opensearch";
          IconURL = "https://www.startpage.com/favicon.ico";
        }
      ];
    };
  };
}
