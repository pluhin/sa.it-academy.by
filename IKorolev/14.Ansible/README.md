
# 14.Ansible

# Ansible tasks log
```
ansible-playbook -i inv.yaml play.yaml -u root

PLAY [redmine] *****************************************************************

TASK [Gathering Facts] *********************************************************
Saturday 17 April 2021  11:28:12 +0000 (0:00:00.056)       0:00:00.056 ********
ok: [redmine]

TASK [Redmine. Install packages] ***********************************************
Saturday 17 April 2021  11:28:23 +0000 (0:00:11.710)       0:00:11.766 ********
ok: [redmine]

TASK [Redmine. Clone repository] ***********************************************
Saturday 17 April 2021  11:28:31 +0000 (0:00:07.681)       0:00:19.448 ********
ok: [redmine]

TASK [Redmine. Change permissions] *********************************************
Saturday 17 April 2021  11:28:34 +0000 (0:00:03.254)       0:00:22.703 ********
ok: [redmine]

TASK [Redmine. Change permissions] *********************************************
Saturday 17 April 2021  11:28:38 +0000 (0:00:03.839)       0:00:26.542 ********
ok: [redmine]

TASK [mysql : Redmine. Install packages] ***************************************
Saturday 17 April 2021  11:28:42 +0000 (0:00:03.867)       0:00:30.409 ********
ok: [redmine]

TASK [mysql : MySQL. Install and setup] ****************************************
Saturday 17 April 2021  11:28:46 +0000 (0:00:04.435)       0:00:34.845 ********
ok: [redmine]

TASK [mysql : mysql_db] ********************************************************
Saturday 17 April 2021  11:28:53 +0000 (0:00:06.518)       0:00:41.363 ********
ok: [redmine]

TASK [mysql : mysql_user] ******************************************************
Saturday 17 April 2021  11:28:56 +0000 (0:00:03.495)       0:00:44.858 ********
[WARNING]: Module did not set no_log for update_password
ok: [redmine]

TASK [mysql : Config database] *************************************************
Saturday 17 April 2021  11:29:00 +0000 (0:00:03.348)       0:00:48.207 ********
changed: [redmine]

TASK [redmine : Redmine. Setup 01] *********************************************
Saturday 17 April 2021  11:29:07 +0000 (0:00:07.102)       0:00:55.309 ********
changed: [redmine]

TASK [redmine : Session store secret generation] *******************************
Saturday 17 April 2021  11:29:21 +0000 (0:00:13.790)       0:01:09.099 ********
ok: [redmine]

TASK [redmine : Redmine. Setup 02] *********************************************
Saturday 17 April 2021  11:29:24 +0000 (0:00:03.410)       0:01:12.509 ********
changed: [redmine]

TASK [redmine : Configuration files for virtualhost] ***************************
Saturday 17 April 2021  11:29:36 +0000 (0:00:11.508)       0:01:24.018 ********
ok: [redmine]

TASK [Add redmine-5.sa to host file] *******************************************
Saturday 17 April 2021  11:29:41 +0000 (0:00:05.242)       0:01:29.260 ********
changed: [redmine]

TASK [redmine : uri] ***********************************************************
Saturday 17 April 2021  11:29:44 +0000 (0:00:03.025)       0:01:32.285 ********
fatal: [redmine]: FAILED! => {"accept_ranges": "bytes", "changed": false, "connection": "close", "content": "\n<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\n  <!--\n    Modified from the Debian original for Ubuntu\n    Last updated: 2014-03-19\n    See: https://launchpad.net/bugs/1288690\n  -->\n  <head>\n    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n    <title>Apache2 Ubuntu Default Page: It works</title>\n    <style type=\"text/css\" media=\"screen\">\n  * {\n    margin: 0px 0px 0px 0px;\n    padding: 0px 0px 0px 0px;\n  }\n\n  body, html {\n    padding: 3px 3px 3px 3px;\n\n    background-color: #D8DBE2;\n\n    font-family: Verdana, sans-serif;\n    font-size: 11pt;\n    text-align: center;\n  }\n\n  div.main_page {\n    position: relative;\n    display: table;\n\n    width: 800px;\n\n    margin-bottom: 3px;\n    margin-left: auto;\n    margin-right: auto;\n    padding: 0px 0px 0px 0px;\n\n    border-width: 2px;\n    border-color: #212738;\n    border-style: solid;\n\n    background-color: #FFFFFF;\n\n    text-align: center;\n  }\n\n  div.page_header {\n    height: 99px;\n    width: 100%;\n\n    background-color: #F5F6F7;\n  }\n\n  div.page_header span {\n    margin: 15px 0px 0px 50px;\n\n    font-size: 180%;\n    font-weight: bold;\n  }\n\n  div.page_header img {\n    margin: 3px 0px 0px 40px;\n\n    border: 0px 0px 0px;\n  }\n\n  div.table_of_contents {\n    clear: left;\n\n    min-width: 200px;\n\n    margin: 3px 3px 3px 3px;\n\n    background-color: #FFFFFF;\n\n    text-align: left;\n  }\n\n  div.table_of_contents_item {\n    clear: left;\n\n    width: 100%;\n\n    margin: 4px 0px 0px 0px;\n\n    background-color: #FFFFFF;\n\n    color: #000000;\n    text-align: left;\n  }\n\n  div.table_of_contents_item a {\n    margin: 6px 0px 0px 6px;\n  }\n\n  div.content_section {\n    margin: 3px 3px 3px 3px;\n\n    background-color: #FFFFFF;\n\n    text-align: left;\n  }\n\n  div.content_section_text {\n    padding: 4px 8px 4px 8px;\n\n    color: #000000;\n    font-size: 100%;\n  }\n\n  div.content_section_text pre {\n    margin: 8px 0px 8px 0px;\n    padding: 8px 8px 8px 8px;\n\n    border-width: 1px;\n    border-style: dotted;\n    border-color: #000000;\n\n    background-color: #F5F6F7;\n\n    font-style: italic;\n  }\n\n  div.content_section_text p {\n    margin-bottom: 6px;\n  }\n\n  div.content_section_text ul, div.content_section_text li {\n    padding: 4px 8px 4px 16px;\n  }\n\n  div.section_header {\n    padding: 3px 6px 3px 6px;\n\n    background-color: #8E9CB2;\n\n    color: #FFFFFF;\n    font-weight: bold;\n    font-size: 112%;\n    text-align: center;\n  }\n\n  div.section_header_red {\n    background-color: #CD214F;\n  }\n\n  div.section_header_grey {\n    background-color: #9F9386;\n  }\n\n  .floating_element {\n    position: relative;\n    float: left;\n  }\n\n  div.table_of_contents_item a,\n  div.content_section_text a {\n    text-decoration: none;\n    font-weight: bold;\n  }\n\n  div.table_of_contents_item a:link,\n  div.table_of_contents_item a:visited,\n  div.table_of_contents_item a:active {\n    color: #000000;\n  }\n\n  div.table_of_contents_item a:hover {\n    background-color: #000000;\n\n    color: #FFFFFF;\n  }\n\n  div.content_section_text a:link,\n  div.content_section_text a:visited,\n   div.content_section_text a:active {\n    background-color: #DCDFE6;\n\n    color: #000000;\n  }\n\n  div.content_section_text a:hover {\n    background-color: #000000;\n\n    color: #DCDFE6;\n  }\n\n  div.validator {\n  }\n    </style>\n  </head>\n  <body>\n    <div class=\"main_page\">\n      <div class=\"page_header floating_element\">\n        <img src=\"/icons/ubuntu-logo.png\" alt=\"Ubuntu Logo\" class=\"floating_element\"/>\n        <span class=\"floating_element\">\n          Apache2 Ubuntu Default Page\n        </span>\n      </div>\n<!--      <div class=\"table_of_contents floating_element\">\n        <div class=\"section_header section_header_grey\">\n          TABLE OF CONTENTS\n        </div>\n        <div class=\"table_of_contents_item floating_element\">\n          <a href=\"#about\">About</a>\n        </div>\n        <div class=\"table_of_contents_item floating_element\">\n          <a href=\"#changes\">Changes</a>\n        </div>\n        <div class=\"table_of_contents_item floating_element\">\n          <a href=\"#scope\">Scope</a>\n        </div>\n        <div class=\"table_of_contents_item floating_element\">\n          <a href=\"#files\">Config files</a>\n        </div>\n      </div>\n-->\n      <div class=\"content_section floating_element\">\n\n\n        <div class=\"section_header section_header_red\">\n          <div id=\"about\"></div>\n          It works!\n        </div>\n        <div class=\"content_section_text\">\n          <p>\n                This is the default welcome page used to test the correct \n                operation of the Apache2 server after installation on Ubuntu systems.\n                It is based on the equivalent page on Debian, from which the Ubuntu Apache\n                packaging is derived.\n                If you can read this page, it means that the Apache HTTP server installed at\n                this site is working properly. You should <b>replace this file</b> (located at\n                <tt>/var/www/html/index.html</tt>) before continuing to operate your HTTP server.\n          </p>\n\n\n          <p>\n                If you are a normal user of this web site and don't know what this page is\n                about, this probably means that the site is currently unavailable due to\n                maintenance.\n                If the problem persists, please contact the site's administrator.\n          </p>\n\n        </div>\n        <div class=\"section_header\">\n          <div id=\"changes\"></div>\n                Configuration Overview\n        </div>\n        <div class=\"content_section_text\">\n          <p>\n                Ubuntu's Apache2 default configuration is different from the\n                upstream default configuration, and split into several files optimized for\n                interaction with Ubuntu tools. The configuration system is\n                <b>fully documented in\n                /usr/share/doc/apache2/README.Debian.gz</b>. Refer to this for the full\n                documentation. Documentation for the web server itself can be\n                found by accessing the <a href=\"/manual\">manual</a> if the <tt>apache2-doc</tt>\n                package was installed on this server.\n\n          </p>\n          <p>\n                The configuration layout for an Apache2 web server installation on Ubuntu systems is as follows:\n          </p>\n          <pre>\n/etc/apache2/\n|-- apache2.conf\n|       `--  ports.conf\n|-- mods-enabled\n|       |-- *.load\n|       `-- *.conf\n|-- conf-enabled\n|       `-- *.conf\n|-- sites-enabled\n|       `-- *.conf\n          </pre>\n          <ul>\n                        <li>\n                           <tt>apache2.conf</tt> is the main configuration\n                           file. It puts the pieces together by including all remaining configuration\n                           files when starting up the web server.\n                        </li>\n\n                        <li>\n                           <tt>ports.conf</tt> is always included from the\n                           main configuration file. It is used to determine the listening ports for\n                           incoming connections, and this file can be customized anytime.\n                        </li>\n\n                        <li>\n                           Configuration files in the <tt>mods-enabled/</tt>,\n                           <tt>conf-enabled/</tt> and <tt>sites-enabled/</tt> directories contain\n                           particular configuration snippets which manage modules, global configuration\n                           fragments, or virtual host configurations, respectively.\n                        </li>\n\n                        <li>\n                           They are activated by symlinking available\n                           configuration files from their respective\n                           *-available/ counterparts. These should be managed\n                           by using our helpers\n                           <tt>\n                                <a href=\"http://manpages.debian.org/cgi-bin/man.cgi?query=a2enmod\">a2enmod</a>,\n                                <a href=\"http://manpages.debian.org/cgi-bin/man.cgi?query=a2dismod\">a2dismod</a>,\n                           </tt>\n                           <tt>\n                                <a href=\"http://manpages.debian.org/cgi-bin/man.cgi?query=a2ensite\">a2ensite</a>,\n                                <a href=\"http://manpages.debian.org/cgi-bin/man.cgi?query=a2dissite\">a2dissite</a>,\n                            </tt>\n                                and\n                           <tt>\n                                <a href=\"http://manpages.debian.org/cgi-bin/man.cgi?query=a2enconf\">a2enconf</a>,\n                                <a href=\"http://manpages.debian.org/cgi-bin/man.cgi?query=a2disconf\">a2disconf</a>\n                           </tt>. See their respective man pages for detailed information.\n                        </li>\n\n                        <li>\n                           The binary is called apache2. Due to the use of\n                           environment variables, in the default configuration, apache2 needs to be\n                           started/stopped with <tt>/etc/init.d/apache2</tt> or <tt>apache2ctl</tt>.\n                           <b>Calling <tt>/usr/bin/apache2</tt> directly will not work</b> with the\n                           default configuration.\n                        </li>\n          </ul>\n        </div>\n\n        <div class=\"section_header\">\n            <div id=\"docroot\"></div>\n                Document Roots\n        </div>\n\n        <div class=\"content_section_text\">\n            <p>\n                By default, Ubuntu does not allow access through the web browser to\n                <em>any</em> file apart of those located in <tt>/var/www</tt>,\n                <a href=\"http://httpd.apache.org/docs/2.4/mod/mod_userdir.html\">public_html</a>\n                directories (when enabled) and <tt>/usr/share</tt> (for web\n                applications). If your site is using a web document root\n                located elsewhere (such as in <tt>/srv</tt>) you may need to whitelist your\n                document root directory in <tt>/etc/apache2/apache2.conf</tt>.\n            </p>\n            <p>\n                The default Ubuntu document root is <tt>/var/www/html</tt>. You\n                can make your own virtual hosts under /var/www. This is different\n                to previous releases which provides better security out of the box.\n            </p>\n        </div>\n\n        <div class=\"section_header\">\n          <div id=\"bugs\"></div>\n                Reporting Problems\n        </div>\n        <div class=\"content_section_text\">\n          <p>\n                Please use the <tt>ubuntu-bug</tt> tool to report bugs in the\n                Apache2 package with Ubuntu. However, check <a\n                href=\"https://bugs.launchpad.net/ubuntu/+source/apache2\">existing\n                bug reports</a> before reporting a new bug.\n          </p>\n          <p>\n                Please report bugs specific to modules (such as PHP and others)\n                to respective packages, not to the web server itself.\n          </p>\n        </div>\n\n\n\n\n      </div>\n    </div>\n    <div class=\"validator\">\n    </div>\n  </body>\n</html>\n\n", "content_length": "11321", "content_type": "text/html", "cookies": {}, "cookies_string": "", "date": "Sat, 17 Apr 2021 11:29:46 GMT", "elapsed": 0, "etag": "\"2c39-5c01a04bd7df0\"", "failed_when_result": true, "last_modified": "Fri, 16 Apr 2021 17:07:44 GMT", "msg": "OK (11321 bytes)", "redirected": false, "server": "Apache/2.4.18 (Ubuntu)", "status": 200, "url": "http://redmine-5.sa", "vary": "Accept-Encoding"}

PLAY RECAP *********************************************************************
redmine                    : ok=15   changed=4    unreachable=0    failed=1    skipped=0    rescued=0    ignored=0

Saturday 17 April 2021  11:29:47 +0000 (0:00:03.267)       0:01:35.553 ********
===============================================================================
redmine : Redmine. Setup 01 -------------------------------------------- 13.79s
Gathering Facts -------------------------------------------------------- 11.71s
redmine : Redmine. Setup 02 -------------------------------------------- 11.51s
Redmine. Install packages ----------------------------------------------- 7.68s
mysql : Config database ------------------------------------------------- 7.10s
mysql : MySQL. Install and setup ---------------------------------------- 6.52s
redmine : Configuration files for virtualhost --------------------------- 5.24s
mysql : Redmine. Install packages --------------------------------------- 4.44s
Redmine. Change permissions --------------------------------------------- 3.87s
Redmine. Change permissions --------------------------------------------- 3.84s
mysql : mysql_db -------------------------------------------------------- 3.50s
redmine : Session store secret generation ------------------------------- 3.41s
mysql : mysql_user ------------------------------------------------------ 3.35s
redmine : uri ----------------------------------------------------------- 3.27s
Redmine. Clone repository ----------------------------------------------- 3.25s
Add redmine-5.sa to host file ------------------------------------------- 3.03s
Playbook run took 0 days, 0 hours, 1 minutes, 35 seconds


```
