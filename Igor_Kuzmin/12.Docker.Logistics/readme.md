## 12. Docker. Logistics

- Automate task **11. Docker. Lading** by Jenkins
![](https://github.com/thecobolt/sa.it-academy.by/blob/m-sa2-07-19/Igor_Kuzmin/12.Docker.Logistics/image/1.png)
![](https://github.com/thecobolt/sa.it-academy.by/blob/m-sa2-07-19/Igor_Kuzmin/12.Docker.Logistics/image/2.png)
![](https://github.com/thecobolt/sa.it-academy.by/blob/m-sa2-07-19/Igor_Kuzmin/12.Docker.Logistics/image/3.png)

- Create docker compose file which contains the following applications:
    - Web server (with links to the another Web apps)
![](https://github.com/thecobolt/sa.it-academy.by/blob/m-sa2-07-19/Igor_Kuzmin/12.Docker.Logistics/image/4.png)

- Automate task Log:
```
Started by user Igor Kuzmin
Running in Durability level: MAX_SURVIVABILITY
[Pipeline] Start of Pipeline
[Pipeline] node
Running on Jenkins in /var/lib/jenkins/workspace/dockerhub
[Pipeline] {
[Pipeline] withEnv
[Pipeline] {
[Pipeline] stage
[Pipeline] { (Cloning Git)
[Pipeline] git
No credentials specified
 > git rev-parse --is-inside-work-tree # timeout=10
Fetching changes from the remote Git repository
 > git config remote.origin.url git@github.com:thecobolt/kzmn_python_app.git # timeout=10
Fetching upstream changes from git@github.com:thecobolt/kzmn_python_app.git
 > git --version # timeout=10
 > git fetch --tags --progress git@github.com:thecobolt/kzmn_python_app.git +refs/heads/*:refs/remotes/origin/*
 > git rev-parse refs/remotes/origin/master^{commit} # timeout=10
 > git rev-parse refs/remotes/origin/origin/master^{commit} # timeout=10
Checking out Revision b40882c1b09feb217f085f21555b92050823d29d (refs/remotes/origin/master)
 > git config core.sparsecheckout # timeout=10
 > git checkout -f b40882c1b09feb217f085f21555b92050823d29d
 > git branch -a -v --no-abbrev # timeout=10
 > git branch -D master # timeout=10
 > git checkout -b master b40882c1b09feb217f085f21555b92050823d29d
Commit message: "first"
 > git rev-list --no-walk b40882c1b09feb217f085f21555b92050823d29d # timeout=10
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Checking repository)
[Pipeline] sh
+ ls -l
total 16
-rw-r--r--. 1 jenkins jenkins 320 May 28 06:34 api.py
-rw-r--r--. 1 jenkins jenkins 112 May 28 06:34 Dockerfile
-rw-r--r--. 1 jenkins jenkins   5 May 28 06:34 flask.txt
-rw-r--r--. 1 jenkins jenkins 202 May 28 06:34 readme.md
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Building image)
[Pipeline] script
[Pipeline] {
[Pipeline] sh
+ docker build -t thecobolt/kzmn_python_app:7 .
Sending build context to Docker daemon  57.34kB

Step 1/6 : FROM python:alpine3.7
 ---> 00be2573e9f7
Step 2/6 : COPY . /app
 ---> 25213b3028ad
Step 3/6 : WORKDIR /app
 ---> Running in 3ded3ec480a2
Removing intermediate container 3ded3ec480a2
 ---> fc1269f016f7
Step 4/6 : RUN pip install -r flask.txt
 ---> Running in 7dd56992a35b
Collecting flask (from -r flask.txt (line 1))
  Downloading https://files.pythonhosted.org/packages/9a/74/670ae9737d14114753b8c8fdf2e8bd212a05d3b361ab15b44937dfd40985/Flask-1.0.3-py2.py3-none-any.whl (92kB)
Collecting itsdangerous>=0.24 (from flask->-r flask.txt (line 1))
  Downloading https://files.pythonhosted.org/packages/76/ae/44b03b253d6fade317f32c24d100b3b35c2239807046a4c953c7b89fa49e/itsdangerous-1.1.0-py2.py3-none-any.whl
Collecting Jinja2>=2.10 (from flask->-r flask.txt (line 1))
  Downloading https://files.pythonhosted.org/packages/1d/e7/fd8b501e7a6dfe492a433deb7b9d833d39ca74916fa8bc63dd1a4947a671/Jinja2-2.10.1-py2.py3-none-any.whl (124kB)
Collecting Werkzeug>=0.14 (from flask->-r flask.txt (line 1))
  Downloading https://files.pythonhosted.org/packages/9f/57/92a497e38161ce40606c27a86759c6b92dd34fcdb33f64171ec559257c02/Werkzeug-0.15.4-py2.py3-none-any.whl (327kB)
Collecting click>=5.1 (from flask->-r flask.txt (line 1))
  Downloading https://files.pythonhosted.org/packages/fa/37/45185cb5abbc30d7257104c434fe0b07e5a195a6847506c074527aa599ec/Click-7.0-py2.py3-none-any.whl (81kB)
Collecting MarkupSafe>=0.23 (from Jinja2>=2.10->flask->-r flask.txt (line 1))
  Downloading https://files.pythonhosted.org/packages/b9/2e/64db92e53b86efccfaea71321f597fa2e1b2bd3853d8ce658568f7a13094/MarkupSafe-1.1.1.tar.gz
Building wheels for collected packages: MarkupSafe
  Building wheel for MarkupSafe (setup.py): started
  Building wheel for MarkupSafe (setup.py): finished with status 'done'
  Stored in directory: /root/.cache/pip/wheels/f2/aa/04/0edf07a1b8a5f5f1aed7580fffb69ce8972edc16a505916a77
Successfully built MarkupSafe
Installing collected packages: itsdangerous, MarkupSafe, Jinja2, Werkzeug, click, flask
Successfully installed Jinja2-2.10.1 MarkupSafe-1.1.1 Werkzeug-0.15.4 click-7.0 flask-1.0.3 itsdangerous-1.1.0
[91mYou are using pip version 19.0.1, however version 19.1.1 is available.
You should consider upgrading via the 'pip install --upgrade pip' command.
[0mRemoving intermediate container 7dd56992a35b
 ---> cd7c0eb1b1ed
Step 5/6 : EXPOSE 5000
 ---> Running in 41c0c4de8af5
Removing intermediate container 41c0c4de8af5
 ---> 281a72dbd1aa
Step 6/6 : CMD python ./api.py
 ---> Running in 59fa66f8931e
Removing intermediate container 59fa66f8931e
 ---> de564f474e0c
Successfully built de564f474e0c
Successfully tagged thecobolt/kzmn_python_app:7
[Pipeline] dockerFingerprintFrom
[Pipeline] }
[Pipeline] // script
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Push to DockerHub)
[Pipeline] script
[Pipeline] {
[Pipeline] withEnv
[Pipeline] {
[Pipeline] withDockerRegistry
$ docker login -u thecobolt -p ******** https://index.docker.io/v1/
WARNING! Using --password via the CLI is insecure. Use --password-stdin.
WARNING! Your password will be stored unencrypted in /var/lib/jenkins/workspace/dockerhub@tmp/835aa064-811f-452b-9914-c75dcab6d2b6/config.json.
Configure a credential helper to remove this warning. See
https://docs.docker.com/engine/reference/commandline/login/#credentials-store

Login Succeeded
[Pipeline] {
[Pipeline] sh
+ docker tag thecobolt/kzmn_python_app:7 thecobolt/kzmn_python_app:7
[Pipeline] sh
+ docker push thecobolt/kzmn_python_app:7
The push refers to repository [docker.io/thecobolt/kzmn_python_app]
0be4c3c10d8a: Preparing
a5a1f8863aca: Preparing
5fa31f02caa8: Preparing
88e61e328a3c: Preparing
9b77965e1d3f: Preparing
50f8b07e9421: Preparing
629164d914fc: Preparing
50f8b07e9421: Waiting
629164d914fc: Waiting
5fa31f02caa8: Layer already exists
9b77965e1d3f: Layer already exists
88e61e328a3c: Layer already exists
50f8b07e9421: Layer already exists
629164d914fc: Layer already exists
a5a1f8863aca: Pushed
0be4c3c10d8a: Pushed
7: digest: sha256:c9245c722855cf3c17d7fdfff162fb54184622d43f60cf6de16bcd7bf0bbcf10 size: 1787
[Pipeline] }
[Pipeline] // withDockerRegistry
[Pipeline] }
[Pipeline] // withEnv
[Pipeline] }
[Pipeline] // script
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Remove Unused docker image)
[Pipeline] sh
+ docker rmi thecobolt/kzmn_python_app:7
Untagged: thecobolt/kzmn_python_app:7
Untagged: thecobolt/kzmn_python_app@sha256:c9245c722855cf3c17d7fdfff162fb54184622d43f60cf6de16bcd7bf0bbcf10
Deleted: sha256:de564f474e0c4003739d8d9c8ba54fecfd0e2ff2965fbf07f4d851bc4ecd61c5
Deleted: sha256:281a72dbd1aa2172f11fdd904aad64e568431486e2ef2609566e8965d70bcf22
Deleted: sha256:cd7c0eb1b1ed9125503eca2bf635257754a8bd06a0736f159442464dbb482c16
Deleted: sha256:7849e1354596bab7342fb2de29ba04a1ba8aa53a0ce03c5ed8cbd74a968948b6
Deleted: sha256:fc1269f016f713dc7a884a1bd57dfb54b74999c1fd5b65c3d0b22e72a4ebbaeb
Deleted: sha256:25213b3028adae000790a30814f0bfdf3d3a364a8a117190ad8ee175bb010dd4
Deleted: sha256:8c8a2862a9f5cf5ebf774598b465e71b0e5ad3b6effbf81ec097ffb23d96f36c
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Declarative: Post Actions)
[Pipeline] slackSend
Slack Send Pipeline step running, values are - baseUrl: https://sa-itacademy-by.slack.com/services/hooks/jenkins-ci/, teamDomain: <empty>, channel: dev_kzmn, color: #00FF00, botUser: false, tokenCredentialId: slack_kzmn
[Pipeline] }
[Pipeline] // stage
[Pipeline] }
[Pipeline] // withEnv
[Pipeline] }
[Pipeline] // node
[Pipeline] End of Pipeline
Finished: SUCCESS
```
- Create docker compose file Log:
```
[vagrant@cent7Jenkins Radar_Sonar]$ docker-compose up
Creating network "radar_sonar_default" with the default driver
Pulling radar (linuxserver/radarr:)...
latest: Pulling from linuxserver/radarr
f25af19ca07d: Pull complete
2beaca93ca93: Pull complete
aac36e4cfb72: Pull complete
c74b88dffd57: Pull complete
7ee8c3ea6b77: Pull complete
c2e87dafdf1d: Pull complete
4eceb85e25df: Pull complete
Pulling sonar (linuxserver/sonarr:)...
latest: Pulling from linuxserver/sonarr
f25af19ca07d: Already exists
2beaca93ca93: Already exists
aac36e4cfb72: Already exists
c74b88dffd57: Already exists
7ee8c3ea6b77: Already exists
71244442e3d9: Pull complete
6d79db73901d: Pull complete
Pulling web (httpd:)...
latest: Pulling from library/httpd
743f2d6c1f65: Pull complete
c92eb69846a6: Pull complete
2211b052800a: Pull complete
aed180197314: Pull complete
7c472a4980a7: Pull complete
Creating radarr ... done
Creating sonarr ... done
Creating www    ... done
Attaching to sonarr, radarr, www
sonarr   | [s6-init] making user provided files available at /var/run/s6/etc...exited 0.
sonarr   | [s6-init] ensuring user provided files have correct perms...exited 0.
sonarr   | [fix-attrs.d] applying ownership & permissions fixes...
sonarr   | [fix-attrs.d] done.
sonarr   | [cont-init.d] executing container initialization scripts...
sonarr   | [cont-init.d] 10-adduser: executing...
sonarr   | usermod: no changes
sonarr   |
sonarr   | -------------------------------------
sonarr   |           _         ()
sonarr   |          | |  ___   _    __
sonarr   |          | | / __| | |  /  \
sonarr   |          | | \__ \ | | | () |
sonarr   |          |_| |___/ |_|  \__/
sonarr   |
sonarr   |
sonarr   | Brought to you by linuxserver.io
sonarr   | We gratefully accept donations at:
sonarr   | https://www.linuxserver.io/donate/
sonarr   | -------------------------------------
sonarr   | GID/UID
sonarr   | -------------------------------------
sonarr   |
sonarr   | User uid:    911
sonarr   | User gid:    911
sonarr   | -------------------------------------
sonarr   |
sonarr   | [cont-init.d] 10-adduser: exited 0.
sonarr   | [cont-init.d] 30-config: executing...
radarr   | [s6-init] making user provided files available at /var/run/s6/etc...exited 0.
radarr   | [s6-init] ensuring user provided files have correct perms...exited 0.
radarr   | [fix-attrs.d] applying ownership & permissions fixes...
radarr   | [fix-attrs.d] done.
radarr   | [cont-init.d] executing container initialization scripts...
radarr   | [cont-init.d] 10-adduser: executing...
radarr   | usermod: no changes
radarr   |
radarr   | -------------------------------------
radarr   |           _         ()
radarr   |          | |  ___   _    __
radarr   |          | | / __| | |  /  \
radarr   |          | | \__ \ | | | () |
radarr   |          |_| |___/ |_|  \__/
radarr   |
radarr   |
radarr   | Brought to you by linuxserver.io
radarr   | We gratefully accept donations at:
radarr   | https://www.linuxserver.io/donate/
radarr   | -------------------------------------
radarr   | GID/UID
radarr   | -------------------------------------
radarr   |
radarr   | User uid:    911
radarr   | User gid:    911
radarr   | -------------------------------------
radarr   |
radarr   | [cont-init.d] 10-adduser: exited 0.
radarr   | [cont-init.d] 30-config: executing...
www      | AH00558: httpd: Could not reliably determine the server's fully qualified domain name, using 172.18.0.4. Set the 'ServerName' directive globally to suppress this message
www      | AH00558: httpd: Could not reliably determine the server's fully qualified domain name, using 172.18.0.4. Set the 'ServerName' directive globally to suppress this message
www      | [Tue May 28 07:40:15.312826 2019] [mpm_event:notice] [pid 1:tid 140055051640896] AH00489: Apache/2.4.39 (Unix) configured -- resuming normal operations
www      | [Tue May 28 07:40:15.318145 2019] [core:notice] [pid 1:tid 140055051640896] AH00094: Command line: 'httpd -D FOREGROUND'
sonarr   | [cont-init.d] 30-config: exited 0.
sonarr   | [cont-init.d] 99-custom-scripts: executing...
sonarr   | [custom-init] no custom files found exiting...
sonarr   | [cont-init.d] 99-custom-scripts: exited 0.
sonarr   | [cont-init.d] done.
sonarr   | [services.d] starting services
sonarr   | [services.d] done.
sonarr   | [Info] Bootstrap: Starting Sonarr - /opt/NzbDrone/NzbDrone.exe - Version 2.0.0.5322
radarr   | [cont-init.d] 30-config: exited 0.
radarr   | [cont-init.d] 99-custom-scripts: executing...
radarr   | [custom-init] no custom files found exiting...
radarr   | [cont-init.d] 99-custom-scripts: exited 0.
radarr   | [cont-init.d] done.
radarr   | [services.d] starting services
radarr   | [services.d] done.
sonarr   | [Info] AppFolderInfo: Data directory is being overridden to [/config]
sonarr   | [Info] Router: Application mode: Interactive
radarr   | [Info] Bootstrap: Starting Radarr - /opt/radarr/Radarr.exe - Version 0.2.0.1344
sonarr   | [Info] MigrationLogger: *** Migrating data source=/config/nzbdrone.db;cache size=-10000;datetimekind=Utc;journal mode=Wal;pooling=True;version=3 ***
sonarr   | [Info] MigrationLogger: *** VersionMigration migrating ***
sonarr   | [Info] MigrationLogger: *** VersionUniqueMigration migrating ***
sonarr   | [Info] MigrationLogger: *** VersionDescriptionMigration migrating ***
sonarr   | [Info] MigrationLogger: *** 1: InitialSetup migrating ***
sonarr   | [Info] InitialSetup: Starting migration to 1
sonarr   | [Info] MigrationLogger: *** 2: remove_tvrage_imdb_unique_constraint migrating ***
sonarr   | [Info] remove_tvrage_imdb_unique_constraint: Starting migration to 2
sonarr   | [Info] MigrationLogger: *** 3: remove_renamed_scene_mapping_columns migrating ***
sonarr   | [Info] remove_renamed_scene_mapping_columns: Starting migration to 3
sonarr   | [Info] MigrationLogger: *** 4: updated_history migrating ***
sonarr   | [Info] updated_history: Starting migration to 4
sonarr   | [Info] MigrationLogger: *** 5: added_eventtype_to_history migrating ***
sonarr   | [Info] added_eventtype_to_history: Starting migration to 5
sonarr   | [Info] MigrationLogger: *** 6: add_index_to_log_time migrating ***
sonarr   | [Info] add_index_to_log_time: Starting migration to 6
sonarr   | [Info] MigrationLogger: *** 7: add_renameEpisodes_to_naming migrating ***
sonarr   | [Info] add_renameEpisodes_to_naming: Starting migration to 7
sonarr   | [Info] MigrationLogger: *** 8: remove_backlog migrating ***
sonarr   | [Info] remove_backlog: Starting migration to 8
sonarr   | [Info] MigrationLogger: *** 9: fix_rename_episodes migrating ***
sonarr   | [Info] fix_rename_episodes: Starting migration to 9
sonarr   | [Info] MigrationLogger: *** 10: add_monitored migrating ***
sonarr   | [Info] add_monitored: Starting migration to 10
sonarr   | [Info] MigrationLogger: *** 11: remove_ignored migrating ***
sonarr   | [Info] remove_ignored: Starting migration to 11
sonarr   | [Info] MigrationLogger: *** 12: remove_custom_start_date migrating ***
sonarr   | [Info] remove_custom_start_date: Starting migration to 12
sonarr   | [Info] MigrationLogger: *** 13: add_air_date_utc migrating ***
sonarr   | [Info] add_air_date_utc: Starting migration to 13
sonarr   | [Info] MigrationLogger: *** 14: drop_air_date migrating ***
sonarr   | [Info] drop_air_date: Starting migration to 14
sonarr   | [Info] MigrationLogger: *** 15: add_air_date_as_string migrating ***
sonarr   | [Info] add_air_date_as_string: Starting migration to 15
sonarr   | [Info] MigrationLogger: *** 16: updated_imported_history_item migrating ***
sonarr   | [Info] updated_imported_history_item: Starting migration to 16
sonarr   | [Info] MigrationLogger: *** 17: reset_scene_names migrating ***
sonarr   | [Info] reset_scene_names: Starting migration to 17
sonarr   | [Info] MigrationLogger: *** 18: remove_duplicates migrating ***
sonarr   | [Info] remove_duplicates: Starting migration to 18
sonarr   | [Info] MigrationLogger: *** 19: restore_unique_constraints migrating ***
sonarr   | [Info] restore_unique_constraints: Starting migration to 19
sonarr   | [Info] MigrationLogger: *** 20: add_year_and_seasons_to_series migrating ***
sonarr   | [Info] add_year_and_seasons_to_series: Starting migration to 20
sonarr   | [Info] MigrationLogger: *** 21: drop_seasons_table migrating ***
sonarr   | [Info] add_reason_to_pending_releases: Starting migration to 97
radarr   | [Info] MigrationLogger: *** 39: add_metadata_tables migrating ***
radarr   | [Info] add_metadata_tables: Starting migration to 39
sonarr   | [Info] MigrationLogger: *** 98: remove_titans_of_tv migrating ***
sonarr   | [Info] remove_titans_of_tv: Starting migration to 98
radarr   | [Info] MigrationLogger: *** 40: add_metadata_to_episodes_and_series migrating ***
radarr   | [Info] add_metadata_to_episodes_and_series: Starting migration to 40
sonarr   | [Info] MigrationLogger: *** 99: extra_and_subtitle_files migrating ***
sonarr   | [Info] extra_and_subtitle_files: Starting migration to 99
radarr   | [Info] MigrationLogger: *** 41: fix_xbmc_season_images_metadata migrating ***
radarr   | [Info] fix_xbmc_season_images_metadata: Starting migration to 41
sonarr   | [Info] MigrationLogger: *** 100: add_scene_season_number migrating ***
sonarr   | [Info] add_scene_season_number: Starting migration to 100
radarr   | [Info] MigrationLogger: *** 42: add_download_clients_table migrating ***
radarr   | [Info] add_download_clients_table: Starting migration to 42
sonarr   | [Info] MigrationLogger: *** 101: add_ultrahd_quality_in_profiles migrating ***
sonarr   | [Info] add_ultrahd_quality_in_profiles: Starting migration to 101
radarr   | [Info] MigrationLogger: *** 43: convert_config_to_download_clients migrating ***
radarr   | [Info] convert_config_to_download_clients: Starting migration to 43
sonarr   | [Info] MigrationLogger: *** 103: fix_metadata_file_extensions migrating ***
sonarr   | [Info] fix_metadata_file_extensions: Starting migration to 103
radarr   | [Info] MigrationLogger: *** 44: fix_xbmc_episode_metadata migrating ***
radarr   | [Info] fix_xbmc_episode_metadata: Starting migration to 44
radarr   | [Info] MigrationLogger: *** 45: add_indexes migrating ***
radarr   | [Info] add_indexes: Starting migration to 45
sonarr   | [Info] MigrationLogger: *** 104: remove_kickass migrating ***
sonarr   | [Info] remove_kickass: Starting migration to 104
sonarr   | [Info] MigrationLogger: *** 105: rename_torrent_downloadstation migrating ***
sonarr   | [Info] rename_torrent_downloadstation: Starting migration to 105
radarr   | [Info] MigrationLogger: *** 46: fix_nzb_su_url migrating ***
radarr   | [Info] fix_nzb_su_url: Starting migration to 46
sonarr   | [Info] MigrationLogger: *** 106: update_btn_url migrating ***
sonarr   | [Info] update_btn_url: Starting migration to 106
radarr   | [Info] MigrationLogger: *** 47: add_temporary_blacklist_columns migrating ***
radarr   | [Info] add_temporary_blacklist_columns: Starting migration to 47
sonarr   | [Info] MigrationLogger: *** 107: remove_wombles migrating ***
sonarr   | [Info] remove_wombles: Starting migration to 107
radarr   | [Info] MigrationLogger: *** 48: add_title_to_scenemappings migrating ***
radarr   | [Info] add_title_to_scenemappings: Starting migration to 48
sonarr   | [Info] MigrationLogger: *** 108: fix_extra_file_extension migrating ***
sonarr   | [Info] fix_extra_file_extension: Starting migration to 108
radarr   | [Info] MigrationLogger: *** 49: fix_dognzb_url migrating ***
radarr   | [Info] fix_dognzb_url: Starting migration to 49
sonarr   | [Info] MigrationLogger: *** 109: import_extra_files migrating ***
sonarr   | [Info] import_extra_files: Starting migration to 109
radarr   | [Info] MigrationLogger: *** 50: add_hash_to_metadata_files migrating ***
radarr   | [Info] add_hash_to_metadata_files: Starting migration to 50
radarr   | [Info] MigrationLogger: *** 51: download_client_import migrating ***
radarr   | [Info] download_client_import: Starting migration to 51
sonarr   | [Info] MigrationLogger: *** 110: fix_extra_files_config migrating ***
sonarr   | [Info] fix_extra_files_config: Starting migration to 110
sonarr   | [Info] MigrationLogger: *** 112: added_regex_to_scenemapping migrating ***
sonarr   | [Info] added_regex_to_scenemapping: Starting migration to 112
radarr   | [Info] MigrationLogger: *** 52: add_columns_for_anime migrating ***
radarr   | [Info] add_columns_for_anime: Starting migration to 52
sonarr   | [Info] MigrationLogger: *** 113: consolidate_indexer_baseurl migrating ***
sonarr   | [Info] consolidate_indexer_baseurl: Starting migration to 113
radarr   | [Info] MigrationLogger: *** 53: add_series_sorttitle migrating ***
radarr   | [Info] add_series_sorttitle: Starting migration to 53
sonarr   | [Info] MigrationLogger: *** 114: rename_indexer_status_id migrating ***
sonarr   | [Info] rename_indexer_status_id: Starting migration to 114
radarr   | [Info] MigrationLogger: *** 54: rename_profiles migrating ***
radarr   | [Info] rename_profiles: Starting migration to 54
radarr   | [Info] MigrationLogger: *** 55: drop_old_profile_columns migrating ***
radarr   | [Info] drop_old_profile_columns: Starting migration to 55
sonarr   | [Info] MigrationLogger: *** 115: add_downloadclient_status migrating ***
sonarr   | [Info] add_downloadclient_status: Starting migration to 115
radarr   | [Info] MigrationLogger: *** 56: add_mediainfo_to_episodefile migrating ***
radarr   | [Info] add_mediainfo_to_episodefile: Starting migration to 56
sonarr   | [Info] MigrationLogger: *** 116: disable_nyaa migrating ***
sonarr   | [Info] disable_nyaa: Starting migration to 116
radarr   | [Info] MigrationLogger: *** 57: convert_episode_file_path_to_relative migrating ***
radarr   | [Info] convert_episode_file_path_to_relative: Starting migration to 57
sonarr   | [Info] MigrationLogger: *** 118: add_history_eventType_index migrating ***
sonarr   | [Info] add_history_eventType_index: Starting migration to 118
radarr   | [Info] MigrationLogger: *** 58: drop_episode_file_path migrating ***
radarr   | [Info] drop_episode_file_path: Starting migration to 58
sonarr   | [Info] MigrationLogger: *** 120: update_series_episodes_history_indexes migrating ***
sonarr   | [Info] clear_ratings: Starting migration to 73
radarr   | [Info] MigrationLogger: *** 138: add_physical_release_note migrating ***
radarr   | [Info] add_physical_release_note: Starting migration to 138
sonarr   | [Info] MigrationLogger: *** 74: disable_eztv migrating ***
sonarr   | [Info] disable_eztv: Starting migration to 74
radarr   | [Info] MigrationLogger: *** 139: consolidate_indexer_baseurl migrating ***
radarr   | [Info] consolidate_indexer_baseurl: Starting migration to 139
sonarr   | [Info] MigrationLogger: *** 75: force_lib_update migrating ***
sonarr   | [Info] force_lib_update: Starting migration to 75
radarr   | [Info] MigrationLogger: *** 140: add_alternative_titles_table migrating ***
radarr   | [Info] add_alternative_titles_table: Starting migration to 140
sonarr   | [Info] MigrationLogger: *** 76: add_users_table migrating ***
sonarr   | [Info] add_users_table: Starting migration to 76
radarr   | [Info] MigrationLogger: *** 141: fix_duplicate_alt_titles migrating ***
radarr   | [Info] fix_duplicate_alt_titles: Starting migration to 141
sonarr   | [Info] MigrationLogger: *** 77: add_add_options_to_series migrating ***
sonarr   | [Info] add_add_options_to_series: Starting migration to 77
radarr   | [Info] MigrationLogger: *** 142: movie_extras migrating ***
radarr   | [Info] movie_extras: Starting migration to 142
sonarr   | [Info] MigrationLogger: *** 78: add_commands_table migrating ***
sonarr   | [Info] add_commands_table: Starting migration to 78
radarr   | [Info] MigrationLogger: *** 143: clean_core_tv migrating ***
radarr   | [Info] clean_core_tv: Starting migration to 143
sonarr   | [Info] MigrationLogger: *** 79: dedupe_tags migrating ***
sonarr   | [Info] dedupe_tags: Starting migration to 79
sonarr   | [Info] MigrationLogger: *** 81: move_dot_prefix_to_transmission_category migrating ***
sonarr   | [Info] move_dot_prefix_to_transmission_category: Starting migration to 81
radarr   | [Info] MigrationLogger: *** 144: add_cookies_to_indexer_status migrating ***
radarr   | [Info] add_cookies_to_indexer_status: Starting migration to 144
sonarr   | [Info] MigrationLogger: *** 82: add_fanzub_settings migrating ***
sonarr   | [Info] add_fanzub_settings: Starting migration to 82
radarr   | [Info] MigrationLogger: *** 145: banner_to_fanart migrating ***
radarr   | [Info] banner_to_fanart: Starting migration to 145
sonarr   | [Info] MigrationLogger: *** 83: additonal_blacklist_columns migrating ***
sonarr   | [Info] additonal_blacklist_columns: Starting migration to 83
radarr   | [Info] MigrationLogger: *** 146: naming_config_colon_action migrating ***
radarr   | [Info] naming_config_colon_action: Starting migration to 146
sonarr   | [Info] MigrationLogger: *** 84: update_quality_minmax_size migrating ***
sonarr   | [Info] update_quality_minmax_size: Starting migration to 84
radarr   | [Info] MigrationLogger: *** 147: add_custom_formats migrating ***
radarr   | [Info] add_custom_formats: Starting migration to 147
sonarr   | [Info] MigrationLogger: *** 85: expand_transmission_urlbase migrating ***
sonarr   | [Info] expand_transmission_urlbase: Starting migration to 85
radarr   | [Info] MigrationLogger: *** 148: remove_extra_naming_config migrating ***
radarr   | [Info] remove_extra_naming_config: Starting migration to 148
sonarr   | [Info] MigrationLogger: *** 86: pushbullet_device_ids migrating ***
sonarr   | [Info] pushbullet_device_ids: Starting migration to 86
radarr   | [Info] MigrationLogger: *** 149: convert_regex_required_tags migrating ***
radarr   | [Info] convert_regex_required_tags: Starting migration to 149
sonarr   | [Info] MigrationLogger: *** 87: remove_eztv migrating ***
sonarr   | [Info] remove_eztv: Starting migration to 87
radarr   | [Info] MigrationLogger: *** 150: fix_format_tags_double_underscore migrating ***
radarr   | [Info] fix_format_tags_double_underscore: Starting migration to 150
sonarr   | [Info] MigrationLogger: *** 88: pushbullet_devices_channels_list migrating ***
sonarr   | [Info] pushbullet_devices_channels_list: Starting migration to 88
radarr   | [Info] MigrationLogger: *** 151: add_tags_to_net_import migrating ***
radarr   | [Info] add_tags_to_net_import: Starting migration to 151
sonarr   | [Info] MigrationLogger: *** 89: add_on_rename_to_notifcations migrating ***
sonarr   | [Info] add_on_rename_to_notifcations: Starting migration to 89
sonarr   | [Info] MigrationLogger: *** 90: update_kickass_url migrating ***
sonarr   | [Info] update_kickass_url: Starting migration to 90
radarr   | [Info] MigrationLogger: *** Migrating data source=/config/logs.db;cache size=-20000;datetimekind=Utc;journal mode=Wal;pooling=True;version=3 ***
sonarr   | [Info] MigrationLogger: *** 91: added_indexerstatus migrating ***
sonarr   | [Info] added_indexerstatus: Starting migration to 91
sonarr   | [Info] MigrationLogger: *** 92: add_unverifiedscenenumbering migrating ***
sonarr   | [Info] add_unverifiedscenenumbering: Starting migration to 92
sonarr   | [Info] MigrationLogger: *** 93: naming_config_replace_illegal_characters migrating ***
sonarr   | [Info] naming_config_replace_illegal_characters: Starting migration to 93
radarr   | [Info] MigrationLogger: *** VersionMigration migrating ***
sonarr   | [Info] MigrationLogger: *** 94: add_tvmazeid migrating ***
sonarr   | [Info] add_tvmazeid: Starting migration to 94
sonarr   | [Info] MigrationLogger: *** 95: add_additional_episodes_index migrating ***
sonarr   | [Info] add_additional_episodes_index: Starting migration to 95
radarr   | [Info] MigrationLogger: *** VersionUniqueMigration migrating ***
sonarr   | [Info] MigrationLogger: *** 96: disable_kickass migrating ***
sonarr   | [Info] disable_kickass: Starting migration to 96
radarr   | [Info] MigrationLogger: *** VersionDescriptionMigration migrating ***
sonarr   | [Info] MigrationLogger: *** 97: add_reason_to_pending_releases migrating ***
sonarr   | [Info] add_reason_to_pending_releases: Starting migration to 97
sonarr   | [Info] MigrationLogger: *** 98: remove_titans_of_tv migrating ***
sonarr   | [Info] remove_titans_of_tv: Starting migration to 98
radarr   | [Info] MigrationLogger: *** 1: InitialSetup migrating ***
radarr   | [Info] InitialSetup: Starting migration to 1
sonarr   | [Info] MigrationLogger: *** 99: extra_and_subtitle_files migrating ***
sonarr   | [Info] extra_and_subtitle_files: Starting migration to 99
radarr   | [Info] MigrationLogger: *** 2: remove_tvrage_imdb_unique_constraint migrating ***
radarr   | [Info] remove_tvrage_imdb_unique_constraint: Starting migration to 2
sonarr   | [Info] MigrationLogger: *** 100: add_scene_season_number migrating ***
sonarr   | [Info] add_scene_season_number: Starting migration to 100
radarr   | [Info] MigrationLogger: *** 3: remove_renamed_scene_mapping_columns migrating ***
radarr   | [Info] remove_renamed_scene_mapping_columns: Starting migration to 3
sonarr   | [Info] MigrationLogger: *** 101: add_ultrahd_quality_in_profiles migrating ***
sonarr   | [Info] add_ultrahd_quality_in_profiles: Starting migration to 101
radarr   | [Info] MigrationLogger: *** 4: updated_history migrating ***
radarr   | [Info] fix_format_tags_double_underscore: Starting migration to 150
radarr   | [Info] MigrationLogger: *** 151: add_tags_to_net_import migrating ***
radarr   | [Info] add_tags_to_net_import: Starting migration to 151
radarr   | [Info] OwinHostController: Listening on the following URLs:
radarr   | [Info] OwinHostController:   http://*:7878/
radarr   | [Info] NancyBootstrapper: Starting NzbDrone API
radarr   | [Info] ProfileService: Setting up default quality profiles
radarr   | [Info] CommandExecutor: Starting 2 threads for tasks.

www      | 10.100.0.1 - - [28/May/2019:07:45:55 +0000] "GET / HTTP/1.1" 200 161
www      | 10.100.0.1 - - [28/May/2019:07:45:55 +0000] "GET /favicon.ico HTTP/1.1" 404 209
www      | 10.100.0.1 - - [28/May/2019:07:46:49 +0000] "GET / HTTP/1.1" 200 161
```

