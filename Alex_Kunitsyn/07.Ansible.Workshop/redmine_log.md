# log of ansible deploy

```bash

07 $ ansible-playbook -i inv.yaml play.yaml 

PLAY [redmine] ***************************************************************************************************************************************************************

TASK [Gathering Facts] *******************************************************************************************************************************************************
Wednesday 05 June 2019  03:32:26 -0400 (0:00:00.161)       0:00:00.161 ******** 
ok: [redmine]

TASK [redmine : APT. Update cache] *******************************************************************************************************************************************
Wednesday 05 June 2019  03:32:30 -0400 (0:00:03.813)       0:00:03.975 ******** 
changed: [redmine]

TASK [redmine : APT. Install packages] ***************************************************************************************************************************************
Wednesday 05 June 2019  03:32:44 -0400 (0:00:13.547)       0:00:17.523 ******** 
ok: [redmine]

TASK [redmine : template] ****************************************************************************************************************************************************
Wednesday 05 June 2019  03:32:46 -0400 (0:00:02.178)       0:00:19.702 ******** 
ok: [redmine]

TASK [redmine : service] *****************************************************************************************************************************************************
Wednesday 05 June 2019  03:32:49 -0400 (0:00:02.839)       0:00:22.542 ******** 
ok: [redmine]

TASK [redmine : MySQL. Create DB] ********************************************************************************************************************************************
Wednesday 05 June 2019  03:32:51 -0400 (0:00:02.404)       0:00:24.947 ******** 
ok: [redmine]

TASK [redmine : MySQL. Create user] ******************************************************************************************************************************************
Wednesday 05 June 2019  03:32:53 -0400 (0:00:02.061)       0:00:27.008 ******** 
ok: [redmine]

TASK [redmine : Redmine. Clone repo] *****************************************************************************************************************************************
Wednesday 05 June 2019  03:32:55 -0400 (0:00:01.722)       0:00:28.730 ******** 
ok: [redmine]

TASK [redmine : Redmine. Change permissions] *********************************************************************************************************************************
Wednesday 05 June 2019  03:33:09 -0400 (0:00:14.707)       0:00:43.438 ******** 
ok: [redmine]

TASK [redmine : Redmine. DB template] ****************************************************************************************************************************************
Wednesday 05 June 2019  03:33:11 -0400 (0:00:01.323)       0:00:44.761 ******** 
ok: [redmine]

TASK [redmine : Readmine. Setup 01] ******************************************************************************************************************************************
Wednesday 05 June 2019  03:33:13 -0400 (0:00:02.000)       0:00:46.762 ******** 
changed: [redmine]

TASK [redmine : Session store secret generation] *****************************************************************************************************************************
Wednesday 05 June 2019  03:33:49 -0400 (0:00:36.649)       0:01:23.411 ******** 
ok: [redmine]

TASK [redmine : Readmine. Setup 02] ******************************************************************************************************************************************
Wednesday 05 June 2019  03:33:51 -0400 (0:00:01.305)       0:01:24.717 ******** 
changed: [redmine]

TASK [redmine : Configuration files for virtualhost] *************************************************************************************************************************
Wednesday 05 June 2019  03:34:04 -0400 (0:00:13.563)       0:01:38.280 ******** 
ok: [redmine]

TASK [redmine : Add redmine.my to host file] *********************************************************************************************************************************
Wednesday 05 June 2019  03:34:07 -0400 (0:00:02.268)       0:01:40.549 ******** 
changed: [redmine]

TASK [redmine : uri] *********************************************************************************************************************************************************
Wednesday 05 June 2019  03:34:08 -0400 (0:00:01.433)       0:01:41.982 ******** 
ok: [redmine]

TASK [redmine : debug] *******************************************************************************************************************************************************
Wednesday 05 June 2019  03:34:15 -0400 (0:00:06.692)       0:01:48.675 ******** 
ok: [redmine] => {
    "msg": {
        "cache_control": "max-age=0, private, must-revalidate", 
        "changed": false, 
        "connection": "close", 
        "content": "<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<meta charset=\"utf-8\" />\n<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\"/>\n<title>Redmine</title>\n<meta name=\"viewport\" content=\"width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no\">\n<meta name=\"description\" content=\"Redmine\" />\n<meta name=\"keywords\" content=\"issue,bug,tracker\" />\n<meta name=\"csrf-param\" content=\"authenticity_token\" />\n<meta name=\"csrf-token\" content=\"v0HNEqrXGwrIOeZ4WlXPwyD7J7BLo1haN2zsGCrJBAV6abhS1O0F+vAqpnWCnJ0DjOzODdJkS8LRiEmm7th5Lw==\" />\n<link rel='shortcut icon' href='/favicon.ico?1559718545' />\n<link rel=\"stylesheet\" media=\"all\" href=\"/stylesheets/jquery/jquery-ui-1.11.0.css?1559718545\" />\n<link rel=\"stylesheet\" media=\"all\" href=\"/stylesheets/application.css?1559718551\" />\n<link rel=\"stylesheet\" media=\"all\" href=\"/stylesheets/responsive.css?1559718551\" />\n\n<script src=\"/javascripts/jquery-1.11.1-ui-1.11.0-ujs-4.3.1.js?1559718551\"></script>\n<script src=\"/javascripts/application.js?1559718551\"></script>\n<script src=\"/javascripts/responsive.js?1559718551\"></script>\n<script>\n//<![CDATA[\n$(window).load(function(){ warnLeavingUnsaved('The current page contains unsaved text that will be lost if you leave this page.'); });\n//]]>\n</script>\n\n\n<!-- page specific tags -->\n<link rel=\"alternate\" type=\"application/atom+xml\" title=\"Redmine: Latest news\" href=\"http://redmine.my/news.atom\" />\n<link rel=\"alternate\" type=\"application/atom+xml\" title=\"Redmine: Activity\" href=\"http://redmine.my/activity.atom\" />\n</head>\n<body class=\"controller-welcome action-index avatars-off\">\n\n<div id=\"wrapper\">\n\n<div class=\"flyout-menu js-flyout-menu\">\n\n\n        <div class=\"flyout-menu__search\">\n            <form action=\"/search\" accept-charset=\"UTF-8\" method=\"get\"><input name=\"utf8\" type=\"hidden\" value=\"&#x2713;\" />\n            \n            <label class=\"search-magnifier search-magnifier--flyout\" for=\"flyout-search\">&#9906;</label>\n            <input type=\"text\" name=\"q\" id=\"flyout-search\" class=\"small js-search-input\" placeholder=\"Search\" />\n</form>        </div>\n\n\n\n    <h3>General</h3>\n    <span class=\"js-general-menu\"></span>\n\n    <span class=\"js-sidebar flyout-menu__sidebar\"></span>\n\n    <h3>Profile</h3>\n    <span class=\"js-profile-menu\"></span>\n\n</div>\n\n<div id=\"wrapper2\">\n<div id=\"wrapper3\">\n<div id=\"top-menu\">\n    <div id=\"account\">\n        <ul><li><a class=\"login\" href=\"/login\">Sign in</a></li><li><a class=\"register\" href=\"/account/register\">Register</a></li></ul>    </div>\n    \n    <ul><li><a class=\"home\" href=\"/\">Home</a></li><li><a class=\"projects\" href=\"/projects\">Projects</a></li><li><a class=\"help\" href=\"https://www.redmine.org/guide\">Help</a></li></ul></div>\n\n<div id=\"header\">\n\n    <a href=\"#\" class=\"mobile-toggle-button js-flyout-menu-toggle-button\"></a>\n\n    <div id=\"quick-search\">\n        <form action=\"/search\" accept-charset=\"UTF-8\" method=\"get\"><input name=\"utf8\" type=\"hidden\" value=\"&#x2713;\" />\n        <input type=\"hidden\" name=\"scope\" />\n        \n        <label for='q'>\n          <a accesskey=\"4\" href=\"/search\">Search</a>:\n        </label>\n        <input type=\"text\" name=\"q\" id=\"q\" size=\"20\" class=\"small\" accesskey=\"f\" />\n</form>        <div id=\"project-jump\" class=\"drdn\"><span class=\"drdn-trigger\">Jump to a project...</span><div class=\"drdn-content\"><div class=\"quick-search\"><input type=\"text\" name=\"q\" id=\"projects-quick-search\" value=\"\" class=\"autocomplete\" data-automcomplete-url=\"/projects/autocomplete.js?jump=welcome\" autocomplete=\"off\" /></div><div class=\"drdn-items projects selection\"></div><div class=\"drdn-items all-projects selection\"><a href=\"/projects?jump=welcome\">All Projects</a></div></div></div>\n    </div>\n\n    <h1>Redmine</h1>\n\n</div>\n\n<div id=\"main\" class=\"nosidebar\">\n    <div id=\"sidebar\">\n        \n        \n    </div>\n\n    <div id=\"content\">\n        \n        <h2>Home</h2>\n\n<div class=\"splitcontentleft\">\n  <div class=\"wiki\">\n    \n  </div>\n  \n</div>\n\n<div class=\"splitcontentright\">\n  \n</div>\n\n\n        \n        <div style=\"clear:both;\"></div>\n    </div>\n</div>\n</div>\n\n<div id=\"ajax-indicator\" style=\"display:none;\"><span>Loading...</span></div>\n<div id=\"ajax-modal\" style=\"display:none;\"></div>\n\n<div id=\"footer\">\n  <div class=\"bgl\"><div class=\"bgr\">\n    Powered by <a href=\"https://www.redmine.org/\">Redmine</a> &copy; 2006-2019 Jean-Philippe Lang\n  </div></div>\n</div>\n</div>\n</div>\n\n</body>\n</html>\n", 
        "content_type": "text/html; charset=utf-8", 
        "cookies": {
            "_redmine_session": "b3llY29TYlFRNW5DOWV6TWxnTVFkOTJHTW96SjhtMG5JdFlJWEd1YkpGSzdKdlF0ODlsRFB6alRFbXRLV2NNeHZVeHB0Tk16SXRvWmVReXU5aEYvd2x5TkhUM3c0clg0MnNiYk9aN0E4QUVnazN6b2pMdS83cndQa1JIZEdWUmZLaE40WW55cm8wTWY2MnVZRnBHbC9XNzM0T0srTGxiSnhIa0NuS1MwR24zWndGRXUwWDZaM2xtS3Zua3lsMGZJLS1aWjJHaitpUmNXK1ZmNGJWazhOaWZ3PT0%3D--ace06770eb970f4b159e8ddc88143575a871481d"
        }, 
        "cookies_string": "_redmine_session=b3llY29TYlFRNW5DOWV6TWxnTVFkOTJHTW96SjhtMG5JdFlJWEd1YkpGSzdKdlF0ODlsRFB6alRFbXRLV2NNeHZVeHB0Tk16SXRvWmVReXU5aEYvd2x5TkhUM3c0clg0MnNiYk9aN0E4QUVnazN6b2pMdS83cndQa1JIZEdWUmZLaE40WW55cm8wTWY2MnVZRnBHbC9XNzM0T0srTGxiSnhIa0NuS1MwR24zWndGRXUwWDZaM2xtS3Zua3lsMGZJLS1aWjJHaitpUmNXK1ZmNGJWazhOaWZ3PT0%3D--ace06770eb970f4b159e8ddc88143575a871481d", 
        "date": "Wed, 05 Jun 2019 07:34:10 GMT", 
        "etag": "W/\"6895ea42eb4f96253ecdf7242c18951e\"", 
        "failed": false, 
        "failed_when_result": false, 
        "msg": "OK (unknown bytes)", 
        "redirected": false, 
        "referrer_policy": "strict-origin-when-cross-origin", 
        "server": "Apache/2.4.18 (Ubuntu)", 
        "set_cookie": "_redmine_session=b3llY29TYlFRNW5DOWV6TWxnTVFkOTJHTW96SjhtMG5JdFlJWEd1YkpGSzdKdlF0ODlsRFB6alRFbXRLV2NNeHZVeHB0Tk16SXRvWmVReXU5aEYvd2x5TkhUM3c0clg0MnNiYk9aN0E4QUVnazN6b2pMdS83cndQa1JIZEdWUmZLaE40WW55cm8wTWY2MnVZRnBHbC9XNzM0T0srTGxiSnhIa0NuS1MwR24zWndGRXUwWDZaM2xtS3Zua3lsMGZJLS1aWjJHaitpUmNXK1ZmNGJWazhOaWZ3PT0%3D--ace06770eb970f4b159e8ddc88143575a871481d; path=/; HttpOnly", 
        "status": 200, 
        "transfer_encoding": "chunked", 
        "url": "http://redmine.my", 
        "vary": "Accept-Encoding", 
        "x_content_type_options": "nosniff", 
        "x_download_options": "noopen", 
        "x_frame_options": "SAMEORIGIN", 
        "x_permitted_cross_domain_policies": "none", 
        "x_powered_by": "Phusion Passenger 5.0.27", 
        "x_request_id": "72b3567c-d6de-4789-90aa-b4bd0891c94a", 
        "x_runtime": "0.274391", 
        "x_xss_protection": "1; mode=block"
    }
}

RUNNING HANDLER [redmine : apache restart] ***********************************************************************************************************************************
Wednesday 05 June 2019  03:34:15 -0400 (0:00:00.240)       0:01:48.915 ******** 
changed: [redmine]

PLAY RECAP *******************************************************************************************************************************************************************
redmine                    : ok=18   changed=5    unreachable=0    failed=0   

Wednesday 05 June 2019  03:34:19 -0400 (0:00:03.777)       0:01:52.692 ******** 
=============================================================================== 
redmine : Readmine. Setup 01 ----------------------------------------------------------------------------------------------------------------------------------------- 36.65s
redmine : Redmine. Clone repo ---------------------------------------------------------------------------------------------------------------------------------------- 14.71s
redmine : Readmine. Setup 02 ----------------------------------------------------------------------------------------------------------------------------------------- 13.56s
redmine : APT. Update cache ------------------------------------------------------------------------------------------------------------------------------------------ 13.55s
redmine : uri --------------------------------------------------------------------------------------------------------------------------------------------------------- 6.69s
Gathering Facts ------------------------------------------------------------------------------------------------------------------------------------------------------- 3.81s
redmine : apache restart ---------------------------------------------------------------------------------------------------------------------------------------------- 3.78s
redmine : template ---------------------------------------------------------------------------------------------------------------------------------------------------- 2.84s
redmine : service ----------------------------------------------------------------------------------------------------------------------------------------------------- 2.41s
redmine : Configuration files for virtualhost ------------------------------------------------------------------------------------------------------------------------- 2.27s
redmine : APT. Install packages --------------------------------------------------------------------------------------------------------------------------------------- 2.18s
redmine : MySQL. Create DB -------------------------------------------------------------------------------------------------------------------------------------------- 2.06s
redmine : Redmine. DB template ---------------------------------------------------------------------------------------------------------------------------------------- 2.00s
redmine : MySQL. Create user ------------------------------------------------------------------------------------------------------------------------------------------ 1.72s
redmine : Add redmine.my to host file --------------------------------------------------------------------------------------------------------------------------------- 1.43s
redmine : Redmine. Change permissions --------------------------------------------------------------------------------------------------------------------------------- 1.32s
redmine : Session store secret generation ----------------------------------------------------------------------------------------------------------------------------- 1.31s
redmine : debug ------------------------------------------------------------------------------------------------------------------------------------------------------- 0.24s

```