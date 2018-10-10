param(
    [string]$buildCorePowershellUrl = "https://opbuildstorageprod.blob.core.windows.net/opps1container/.openpublishing.buildcore.ps1",
    [string]$parameters
)
# Main=
<!DOCTYPE html>
<html lang="en-US">
  <head>
    <meta charset="UTF-8" />
    
      <meta id="meta-viewport" name="viewport" content="width=1100, initial-scale=1.0">
    
    <link rel="apple-touch-icon" href="/ac-favicon-152.png">
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">
    <title>App Center</title>

    <script src="https://cdn.optimizely.com/js/10880742244.js"></script>

      window.initProps = {"user":{"id":"4249f68b-c600-413a-a7a6-72354cf0bc39","display_name":"moimassmason","email":"themassmason@gmail.com","name":"Musicore","avatar_url":null,"can_change_password":false,"created_at":"2018-10-10T10:42:03.000Z","origin":"appcenter","next_nps_survey_date":"2018-10-13T10:42:40.365Z","feature_flags":["react_native","xamarin","crash_analytics","crash_analytics_tab","distribution_group","test_cloud","allow_app_delete","test_espresso","test_appium","analytics_events","analytics_log_flow","change_username","tester_invite","delete_release","azure_push","build_unit_tests_android_react_native","build_unit_tests_ios_react_native","manage_organization","create_organization","test_xcuitest","sdk_in_app_updates","create_windows_apps","mandatory_update","collect_udid","test_named_device_sets","api_token_ui","manage_app_roles","crash_uwp","distribution_devices","distribution_stores","notification_settings","push_audiences","transfer_app_to_org","test_named_device_sets_new_test_run","hockeyapp_support","code_push","edge_bulk_delete_testers","push_delete_notifications","push_custom_props","push_detail","distribution_stores_intune","build_prepost_scripts","distribution_build_selection","publish_devices","build_vsts_no_import","distribution_public_groups","teams","app_settings_team_actions","distribution_stores_apple","azure_subscriptions","webhooks","previous_releases","build_configure_badge","build_carthage_support","build_xamarin_ios_csproj_enabled","register_devices_on_new_release","crash_crash_events","resign_app","new_app_list","services","manage_analytics_export","manage_invites","build_new_connect_ui","build_new_vsts_connect_ui","create_macos_apps","build_xamarin_sdk_bundles_enabled","build_custom_env_variables","github_bug_tracker","distribution_redistribute","billing_management","billing_notifications","distribution_multiple_destinations","build_new_branch_secure_files","release_stats","build_support_macos","distribution_stores_menu","build_xamarin_mono_5_4_1_enabled","build_xcode_project_schemes","show_opt_in_ui","crash_join_hockeyapp_preview","build_configure_badge_appcenter","build_support_macos_manual_distribution","store_publish_status_update","jira_bug_tracker","create_cordova_apps","distribution_redistribute_same_group","build_configure_empty_state","build_configure_new_loading_state","crash_android_ndk","crash_android_proguard","devices","role_update_pending_org_invite","hide_distribution_survey","distribution_group_statistics_ui","crash_errors","distribute_release_auto_provision","distribution_stores_shared_credentials_apple","register_devices_shared_connection","distribution_group_statistics_sessions","distribution_group_statistics_session_duration","distribute_release_shared_credentials","build_github_integration","build_bitbucket_no_import","alerting_completed_builds","alerting_completed_builds_polite","build_configure_limit_exceeded","build_notification_safe_link","user_developer_accounts","build_distribute_to_store","distribution_autoprovisioning_2fa","build_github_pr_onboarding","build_github_one_to_one","auto_provision_async_publish_devices","admin_include_soft_deleted","build_commits_support_short_sha","alerting_completed_test_runs","install_first_run_experience","install_profile_button","distribution_resend_email","build_redistribute_store","transfer_app_between_orgs","admin_show_org_admins","build-test-on-real-devices-abtest","management_upload_org_icon","distribution_stores_settings_apple","link_aad_tenant","daily_new_app_release_notifications","org_distribution_groups","show_tester_apps","distribution_edit_release","remove_tester_button","mobile","build_xamarin_preview_ios","build_enable_xcode_10_for_reactnative","management_upload_app_icon","multi_email_pills","distribution_stores_apple_2fa"],"settings":{},"is_microsoft_internal":false},"config":{"env":"production","hockeyAppRootUrl":"https://rink.hockeyapp.net","intercomAppId":"r33tq287","rootPathsNotInNav":["beacon"],"enforceRegisterRedirect":"true","aiInstrumentationKey":"d2520d6e-507b-4765-aeaa-cfa16b964e7a","googleAnalyticsId":"UA-62780441-35","showTesterApps":"true","commit":"cee0271c72f5e02d5f23ae807703f25b4c886ba2","bifrostHost":"https://appcenter.ms/api","bifrostInstallHost":"https://install.appcenter.ms/api","cookieDomainSecondary":"appcenter.ms"},"enableIntercom":true,"apps":[{"id":"8f368d14-46d7-48df-9602-f68b76efc8f3","app_secret":"6e085082-aaf9-4225-8797-18b0cad2ded3","description":"Bitcoin.$","display_name":"Bitcoin","name":"Bitcoin","os":"iOS","platform":"Cordova","origin":"appcenter","icon_url":null,"created_at":"2018-10-10T10:44:03.000Z","updated_at":"2018-10-10T10:44:03.000Z","owner":{"id":"4249f68b-c600-413a-a7a6-72354cf0bc39","avatar_url":null,"display_name":"moimassmason","email":"themassmason@gmail.com","name":"Musicore","type":"user","feature_flags":["react_native","xamarin","crash_analytics","crash_analytics_tab","distribution_group","test_cloud","allow_app_delete","test_espresso","test_appium","analytics_events","analytics_log_flow","change_username","tester_invite","delete_release","azure_push","build_unit_tests_android_react_native","build_unit_tests_ios_react_native","manage_organization","create_organization","test_xcuitest","sdk_in_app_updates","create_windows_apps","mandatory_update","collect_udid","test_named_device_sets","api_token_ui","manage_app_roles","crash_uwp","distribution_devices","distribution_stores","notification_settings","push_audiences","transfer_app_to_org","test_named_device_sets_new_test_run","hockeyapp_support","code_push","edge_bulk_delete_testers","push_delete_notifications","push_custom_props","push_detail","distribution_stores_intune","build_prepost_scripts","distribution_build_selection","publish_devices","build_vsts_no_import","distribution_public_groups","teams","app_settings_team_actions","distribution_stores_apple","azure_subscriptions","webhooks","previous_releases","build_configure_badge","build_carthage_support","build_xamarin_ios_csproj_enabled","register_devices_on_new_release","crash_crash_events","resign_app","new_app_list","services","manage_analytics_export","manage_invites","build_new_connect_ui","build_new_vsts_connect_ui","create_macos_apps","build_xamarin_sdk_bundles_enabled","build_custom_env_variables","github_bug_tracker","distribution_redistribute","billing_management","billing_notifications","distribution_multiple_destinations","build_new_branch_secure_files","release_stats","build_support_macos","distribution_stores_menu","build_xamarin_mono_5_4_1_enabled","build_xcode_project_schemes","show_opt_in_ui","crash_join_hockeyapp_preview","build_configure_badge_appcenter","build_support_macos_manual_distribution","store_publish_status_update","jira_bug_tracker","create_cordova_apps","distribution_redistribute_same_group","build_configure_empty_state","build_configure_new_loading_state","crash_android_ndk","crash_android_proguard","devices","role_update_pending_org_invite","hide_distribution_survey","distribution_group_statistics_ui","crash_errors","distribute_release_auto_provision","distribution_stores_shared_credentials_apple","register_devices_shared_connection","distribution_group_statistics_sessions","distribution_group_statistics_session_duration","distribute_release_shared_credentials","build_github_integration","build_bitbucket_no_import","alerting_completed_builds","alerting_completed_builds_polite","build_configure_limit_exceeded","build_notification_safe_link","user_developer_accounts","build_distribute_to_store","distribution_autoprovisioning_2fa","build_github_pr_onboarding","build_github_one_to_one","auto_provision_async_publish_devices","admin_include_soft_deleted","build_commits_support_short_sha","alerting_completed_test_runs","install_first_run_experience","install_profile_button","distribution_resend_email","build_redistribute_store","transfer_app_between_orgs","admin_show_org_admins","build-test-on-real-devices-abtest","management_upload_org_icon","distribution_stores_settings_apple","link_aad_tenant","daily_new_app_release_notifications","org_distribution_groups","show_tester_apps","distribution_edit_release","remove_tester_button","mobile","build_xamarin_preview_ios","build_enable_xcode_10_for_reactnative","management_upload_app_icon","multi_email_pills","distribution_stores_apple_2fa"]},"azure_subscription":null,"member_permissions":["manager"],"feature_flags":["react_native","xamarin","crash_analytics","crash_analytics_tab","distribution_group","test_cloud","allow_app_delete","test_espresso","test_appium","analytics_events","analytics_log_flow","change_username","tester_invite","delete_release","azure_push","build_unit_tests_android_react_native","build_unit_tests_ios_react_native","manage_organization","create_organization","test_xcuitest","sdk_in_app_updates","create_windows_apps","mandatory_update","collect_udid","test_named_device_sets","api_token_ui","manage_app_roles","crash_uwp","distribution_devices","distribution_stores","notification_settings","push_audiences","transfer_app_to_org","test_named_device_sets_new_test_run","hockeyapp_support","code_push","edge_bulk_delete_testers","push_delete_notifications","push_custom_props","push_detail","distribution_stores_intune","build_prepost_scripts","distribution_build_selection","publish_devices","build_vsts_no_import","distribution_public_groups","teams","app_settings_team_actions","distribution_stores_apple","azure_subscriptions","webhooks","previous_releases","build_configure_badge","build_carthage_support","build_xamarin_ios_csproj_enabled","register_devices_on_new_release","crash_crash_events","resign_app","new_app_list","services","manage_analytics_export","manage_invites","build_new_connect_ui","build_new_vsts_connect_ui","create_macos_apps","build_xamarin_sdk_bundles_enabled","build_custom_env_variables","github_bug_tracker","distribution_redistribute","billing_management","billing_notifications","distribution_multiple_destinations","build_new_branch_secure_files","release_stats","build_support_macos","distribution_stores_menu","build_xamarin_mono_5_4_1_enabled","build_xcode_project_schemes","show_opt_in_ui","crash_join_hockeyapp_preview","build_configure_badge_appcenter","build_support_macos_manual_distribution","store_publish_status_update","jira_bug_tracker","create_cordova_apps","distribution_redistribute_same_group","build_configure_empty_state","build_configure_new_loading_state","crash_android_ndk","crash_android_proguard","devices","role_update_pending_org_invite","hide_distribution_survey","distribution_group_statistics_ui","crash_errors","distribute_release_auto_provision","distribution_stores_shared_credentials_apple","register_devices_shared_connection","distribution_group_statistics_sessions","distribution_group_statistics_session_duration","distribute_release_shared_credentials","build_github_integration","build_bitbucket_no_import","alerting_completed_builds","alerting_completed_builds_polite","build_configure_limit_exceeded","build_notification_safe_link","user_developer_accounts","build_distribute_to_store","distribution_autoprovisioning_2fa","build_github_pr_onboarding","build_github_one_to_one","auto_provision_async_publish_devices","admin_include_soft_deleted","build_commits_support_short_sha","alerting_completed_test_runs","install_first_run_experience","install_profile_button","distribution_resend_email","build_redistribute_store","transfer_app_between_orgs","admin_show_org_admins","build-test-on-real-devices-abtest","management_upload_org_icon","distribution_stores_settings_apple","link_aad_tenant","daily_new_app_release_notifications","org_distribution_groups","show_tester_apps","distribution_edit_release","remove_tester_button","mobile","build_xamarin_preview_ios","build_enable_xcode_10_for_reactnative","management_upload_app_icon","multi_email_pills","distribution_stores_apple_2fa"],"repositories":[]}],"orgs":[],"intercomUserHash":"79ab0d92d81e58f13a83665911d20271425745ca68d18f2cd2e4c46e4801d4e6","isNewAccount":0,"csrfToken":"XNRYRnlh-EenQQm7WDh_UVLqxFhAQyjjjiJw"};
      window.initProps.mscc = {};
      window.initProps.mscc.hasConsent = true;

      document.documentElement.setAttribute('data-supports-mobile', 'true');
      var meta = document.getElementById('meta-viewport');
      if (meta) {
        meta.setAttribute('content', 'width=device-width, initial-scale=1.0, maximum-scale=1.0')
      }

      var pd = {};
      if (location.search) {
        location.search.slice(1).split("&").forEach(function(pair) {
          var s = pair.split("="), key = s[0], value = s[1] && decodeURIComponent(s[1]);
          (pd[key] = pd[key] || []).push(value);
        });
      }

      var queryProps = pd["initProps"];
      if (queryProps && Object.assign) {
        var p = JSON.parse(atob(queryProps));
        Object.assign(window.initProps, p);
      }
    </script>
    <!-- only collect GA before the user is signed-in -->
    
    
  </head>
  <body>
    <div id="consent-banner">
      
    </div>

    <div id="app">
      
    </div>
    <div id="portal-root">
      
    </div>

    
    <script src="https://mobilecenter.azureedge.net/generated/vendor-251035464538e2cb1996.js"></script>
    
    <script src="https://mobilecenter.azureedge.net/generated/shared-3c089b7cac4756c63358.js"></script>

    
    <script src="https://mobilecenter.azureedge.net/generated/app-1e5850046a734180631e.js"></script>
  </body>
</html>

$errorActionPreference = 'Stop'

# Step-1: Download buildcore script to local
echo "download build core script to local with source url: $buildCorePowershellUrl"
$repositoryRoot = Split-Path -Parent $MyInvocation.MyCommand.Definition
$buildCorePowershellDestination = "$repositoryRoot\.openpublishing.buildcore.ps1"
Invoke-WebRequest $buildCorePowershellUrl -OutFile "$buildCorePowershellDestination"

# Step-2: Run build core
echo "run build core script with parameters: $parameters"
& "$buildCorePowershellDestination" "$parameters"
exit $LASTEXITCODE
