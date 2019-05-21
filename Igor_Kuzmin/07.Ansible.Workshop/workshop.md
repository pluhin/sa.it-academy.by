```bash

[vagrant@centansible redmine]$ ansible-playbook -i inv.yaml play.yaml --ask-pass
SSH password:

PLAY [all] **********************************************************************************************************************************************************************************

TASK [Gathering Facts] **********************************************************************************************************************************************************************
Monday 13 May 2019  11:49:13 +0000 (0:00:00.069)       0:00:00.069 ************
ok: [redmine]

TASK [redmine : APT. Update cache] **********************************************************************************************************************************************************
Monday 13 May 2019  11:49:20 +0000 (0:00:06.287)       0:00:06.356 ************
changed: [redmine]

TASK [redmine : Apt. Install Packages] ******************************************************************************************************************************************************
Monday 13 May 2019  11:49:37 +0000 (0:00:17.404)       0:00:23.761 ************
ok: [redmine]

TASK [redmine : template] *******************************************************************************************************************************************************************
Monday 13 May 2019  11:49:43 +0000 (0:00:05.855)       0:00:29.616 ************
ok: [redmine]

TASK [redmine : service] ********************************************************************************************************************************************************************
Monday 13 May 2019  11:49:53 +0000 (0:00:10.001)       0:00:39.617 ************
ok: [redmine]

TASK [redmine : MySQL. Create DB] ***********************************************************************************************************************************************************
Monday 13 May 2019  11:49:58 +0000 (0:00:05.489)       0:00:45.107 ************
ok: [redmine]

TASK [redmine : MySQL. Create user] *********************************************************************************************************************************************************
Monday 13 May 2019  11:50:05 +0000 (0:00:06.126)       0:00:51.233 ************
ok: [redmine]

TASK [redmine : Redmine. Clone repo] ********************************************************************************************************************************************************
Monday 13 May 2019  11:50:11 +0000 (0:00:06.255)       0:00:57.489 ************
ok: [redmine]

TASK [redmine : Redmine. Change permissions] ************************************************************************************************************************************************
Monday 13 May 2019  11:50:28 +0000 (0:00:17.574)       0:01:15.064 ************
ok: [redmine]

TASK [redmine : Redmine. DB template] *******************************************************************************************************************************************************
Monday 13 May 2019  11:50:34 +0000 (0:00:05.287)       0:01:20.351 ************
ok: [redmine]

TASK [redmine : Readmine. Setup 01] *********************************************************************************************************************************************************
Monday 13 May 2019  11:50:42 +0000 (0:00:08.585)       0:01:28.936 ************
changed: [redmine]

TASK [redmine : Session store secret generation] ********************************************************************************************************************************************
Monday 13 May 2019  11:51:22 +0000 (0:00:39.835)       0:02:08.772 ************
ok: [redmine]

TASK [redmine : Readmine. Setup 02] *********************************************************************************************************************************************************
Monday 13 May 2019  11:51:28 +0000 (0:00:05.431)       0:02:14.203 ************
changed: [redmine]

TASK [redmine : Configuration files for virtualhost] ****************************************************************************************************************************************
Monday 13 May 2019  11:51:45 +0000 (0:00:17.278)       0:02:31.482 ************
ok: [redmine]

TASK [redmine : Add redmine.my to host file] ************************************************************************************************************************************************
Monday 13 May 2019  11:51:54 +0000 (0:00:08.847)       0:02:40.330 ************
changed: [redmine]

TASK [redmine : uri] ************************************************************************************************************************************************************************
Monday 13 May 2019  11:51:59 +0000 (0:00:05.339)       0:02:45.670 ************
ok: [redmine]

TASK [redmine : debug] **********************************************************************************************************************************************************************
Monday 13 May 2019  11:52:10 +0000 (0:00:11.219)       0:02:56.890 ************
ok: [redmine] => {
    "msg": {
        "cache_control": "max-age=0, private, must-revalidate",
        "changed": false,
        "connection": "close",
        "content": "<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<meta charset=\"utf-8\" />\n<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\"/>\n<title>Redmine</title>\n<meta name=\"viewport\" content=\"width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no\">\n<meta name=\"description\" content=\"Redmine\" />\n<meta name=\"keywords\" content=\"issue,bug,tracker\" />\n<meta name=\"csrf-param\" content=\"authenticity_token\" />\n<meta name=\"csrf-token\" content=\"pZ0mXAyplLUtS9VuhNyaZmlOeDDIdc6g+/kO9+76W9PsY17jAh18j81vZBt124YJXWY8ecoZWj8Arv0/+o27yA==\" />\n<link rel='shortcut icon' href='/favicon.ico?1556882592' />\n<link rel=\"stylesheet\" media=\"all\" href=\"/stylesheets/jquery/jquery-ui-1.11.0.css?1556882592\" />\n<link rel=\"stylesheet\" media=\"all\" href=\"/stylesheets/application.css?1556882593\" />\n<link rel=\"stylesheet\" media=\"all\" href=\"/stylesheets/responsive.css?1556882593\" />\n\n<script src=\"/javascripts/jquery-1.11.1-ui-1.11.0-ujs-4.3.1.js?1556882593\"></script>\n<script src=\"/javascripts/application.js?1556882593\"></script>\n<script src=\"/javascripts/responsive.js?1556882593\"></script>\n<script>\n//<![CDATA[\n$(window).load(function(){ warnLeavingUnsaved('The current page contains unsaved text that will be lost if you leave this page.'); });\n//]]>\n</script>\n\n\n<!-- page specific tags -->\n<link rel=\"alternate\" type=\"application/atom+xml\" title=\"Redmine: Latest news\" href=\"http://redmine.my/news.atom\" />\n<link rel=\"alternate\" type=\"application/atom+xml\" title=\"Redmine: Activity\" href=\"http://redmine.my/activity.atom\" />\n</head>\n<body class=\"controller-welcome action-index avatars-off\">\n\n<div id=\"wrapper\">\n\n<div class=\"flyout-menu js-flyout-menu\">\n\n\n        <div class=\"flyout-menu__search\">\n            <form action=\"/search\" accept-charset=\"UTF-8\" method=\"get\"><input name=\"utf8\" type=\"hidden\" value=\"&#x2713;\" />\n            \n            <label class=\"search-magnifier search-magnifier--flyout\" for=\"flyout-search\">&#9906;</label>\n            <input type=\"text\" name=\"q\" id=\"flyout-search\" class=\"small js-search-input\" placeholder=\"Search\" />\n</form>        </div>\n\n\n\n    <h3>General</h3>\n    <span class=\"js-general-menu\"></span>\n\n    <span class=\"js-sidebar flyout-menu__sidebar\"></span>\n\n    <h3>Profile</h3>\n    <span class=\"js-profile-menu\"></span>\n\n</div>\n\n<div id=\"wrapper2\">\n<div id=\"wrapper3\">\n<div id=\"top-menu\">\n    <div id=\"account\">\n        <ul><li><a class=\"login\" href=\"/login\">Sign in</a></li><li><a class=\"register\" href=\"/account/register\">Register</a></li></ul>    </div>\n    \n    <ul><li><a class=\"home\" href=\"/\">Home</a></li><li><a class=\"projects\" href=\"/projects\">Projects</a></li><li><a class=\"help\" href=\"https://www.redmine.org/guide\">Help</a></li></ul></div>\n\n<div id=\"header\">\n\n    <a href=\"#\" class=\"mobile-toggle-button js-flyout-menu-toggle-button\"></a>\n\n    <div id=\"quick-search\">\n        <form action=\"/search\" accept-charset=\"UTF-8\" method=\"get\"><input name=\"utf8\" type=\"hidden\" value=\"&#x2713;\" />\n        <input type=\"hidden\" name=\"scope\" />\n        \n        <label for='q'>\n          <a accesskey=\"4\" href=\"/search\">Search</a>:\n        </label>\n        <input type=\"text\" name=\"q\" id=\"q\" size=\"20\" class=\"small\" accesskey=\"f\" />\n</form>        <div id=\"project-jump\" class=\"drdn\"><span class=\"drdn-trigger\">Jump to a project...</span><div class=\"drdn-content\"><div class=\"quick-search\"><input type=\"text\" name=\"q\" id=\"projects-quick-search\" value=\"\" class=\"autocomplete\" data-automcomplete-url=\"/projects/autocomplete.js?jump=welcome\" autocomplete=\"off\" /></div><div class=\"drdn-items projects selection\"></div><div class=\"drdn-items all-projects selection\"><a href=\"/projects?jump=welcome\">All Projects</a></div></div></div>\n    </div>\n\n    <h1>Redmine</h1>\n\n</div>\n\n<div id=\"main\" class=\"nosidebar\">\n    <div id=\"sidebar\">\n        \n        \n    </div>\n\n    <div id=\"content\">\n        \n        <h2>Home</h2>\n\n<div class=\"splitcontentleft\">\n  <div class=\"wiki\">\n    \n  </div>\n  \n</div>\n\n<div class=\"splitcontentright\">\n  \n</div>\n\n\n        \n        <div style=\"clear:both;\"></div>\n    </div>\n</div>\n</div>\n\n<div id=\"ajax-indicator\" style=\"display:none;\"><span>Loading...</span></div>\n<div id=\"ajax-modal\" style=\"display:none;\"></div>\n\n<div id=\"footer\">\n  <div class=\"bgl\"><div class=\"bgr\">\n    Powered by <a href=\"https://www.redmine.org/\">Redmine</a> &copy; 2006-2019 Jean-Philippe Lang\n  </div></div>\n</div>\n</div>\n</div>\n\n</body>\n</html>\n",
        "content_type": "text/html; charset=utf-8",
        "cookies": {
            "_redmine_session": "STBtaGk1eXBFOUwwdWd0a01nRkZmMVlGMW5SU0NXZTBDUkRqSzZ3eVdGUndTN0lBVklhdnpzOTZ6V2RJTE9DSzNJYTRPRjUxcFVHTkFmamIxSm1sRmVwMlhOSW8vQjRVSEt2dGxoQUt5bEVnMzltNXhyK2xOSTBDWFA2QTVJMEZkdVlBZHcrN2tWL083MGxSd0YxRW10MTVpTWNGVzVYU1hVRkR5NklkWWJJMzZud3BObWtUZ05LMHBYbE5XWlhTLS16K0pQdURTZWphNHFKaXh0dVpkaEt3PT0%3D--1edc42d6317381a930bd00d14b3e29549086836f"
        },
        "date": "Mon, 13 May 2019 11:52:10 GMT",
        "etag": "W/\"221452568bc9d15b043b766d0c9a4bc5\"",
        "failed": false,
        "failed_when_result": false,
        "msg": "OK (unknown bytes)",
        "redirected": false,
        "referrer_policy": "strict-origin-when-cross-origin",
        "server": "Apache/2.4.18 (Ubuntu)",
        "set_cookie": "_redmine_session=STBtaGk1eXBFOUwwdWd0a01nRkZmMVlGMW5SU0NXZTBDUkRqSzZ3eVdGUndTN0lBVklhdnpzOTZ6V2RJTE9DSzNJYTRPRjUxcFVHTkFmamIxSm1sRmVwMlhOSW8vQjRVSEt2dGxoQUt5bEVnMzltNXhyK2xOSTBDWFA2QTVJMEZkdVlBZHcrN2tWL083MGxSd0YxRW10MTVpTWNGVzVYU1hVRkR5NklkWWJJMzZud3BObWtUZ05LMHBYbE5XWlhTLS16K0pQdURTZWphNHFKaXh0dVpkaEt3PT0%3D--1edc42d6317381a930bd00d14b3e29549086836f; path=/; HttpOnly",
        "status": 200,
        "transfer_encoding": "chunked",
        "url": "http://redmine.my",
        "vary": "Accept-Encoding",
        "x_content_type_options": "nosniff",
        "x_download_options": "noopen",
        "x_frame_options": "SAMEORIGIN",
        "x_permitted_cross_domain_policies": "none",
        "x_powered_by": "Phusion Passenger 5.0.27",
        "x_request_id": "3324aae9-d2e7-46f9-9891-efb282e15287",
        "x_runtime": "0.330144",
        "x_xss_protection": "1; mode=block"
    }
}

TASK [redmine : lineinfile] *****************************************************************************************************************************************************************
Monday 13 May 2019  11:52:10 +0000 (0:00:00.070)       0:02:56.961 ************
changed: [redmine]

PLAY RECAP **********************************************************************************************************************************************************************************
redmine                    : ok=18   changed=5    unreachable=0    failed=0

Monday 13 May 2019  11:52:17 +0000 (0:00:06.551)       0:03:03.512 ************
===============================================================================
redmine : Readmine. Setup 01 -------------------------------------------------------------------------------------------------------------------------------------------------------- 39.84s
redmine : Redmine. Clone repo ------------------------------------------------------------------------------------------------------------------------------------------------------- 17.57s
redmine : APT. Update cache --------------------------------------------------------------------------------------------------------------------------------------------------------- 17.40s
redmine : Readmine. Setup 02 -------------------------------------------------------------------------------------------------------------------------------------------------------- 17.28s
redmine : uri ----------------------------------------------------------------------------------------------------------------------------------------------------------------------- 11.22s
redmine : template ------------------------------------------------------------------------------------------------------------------------------------------------------------------ 10.00s
redmine : Configuration files for virtualhost ---------------------------------------------------------------------------------------------------------------------------------------- 8.85s
redmine : Redmine. DB template ------------------------------------------------------------------------------------------------------------------------------------------------------- 8.59s
redmine : lineinfile ----------------------------------------------------------------------------------------------------------------------------------------------------------------- 6.55s
Gathering Facts ---------------------------------------------------------------------------------------------------------------------------------------------------------------------- 6.29s
redmine : MySQL. Create user --------------------------------------------------------------------------------------------------------------------------------------------------------- 6.26s
redmine : MySQL. Create DB ----------------------------------------------------------------------------------------------------------------------------------------------------------- 6.13s
redmine : Apt. Install Packages ------------------------------------------------------------------------------------------------------------------------------------------------------ 5.86s
redmine : service -------------------------------------------------------------------------------------------------------------------------------------------------------------------- 5.49s
redmine : Session store secret generation -------------------------------------------------------------------------------------------------------------------------------------------- 5.43s
redmine : Add redmine.my to host file ------------------------------------------------------------------------------------------------------------------------------------------------ 5.34s
redmine : Redmine. Change permissions ------------------------------------------------------------------------------------------------------------------------------------------------ 5.29s
redmine : debug ---------------------------------------------------------------------------------------------------------------------------------------------------------------------- 0.07s

```