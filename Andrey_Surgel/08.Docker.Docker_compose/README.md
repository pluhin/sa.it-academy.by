# HA1

```bash
t1wg@DESKTOP-ISPH4QI:~/Homework/08.Docker-compose$ docker compose up
WARN[0000] /home/t1wg/Homework/08.Docker-compose/docker-compose.yml: the attribute `version` is obsolete, it will be ignored, please remove it to avoid potential confusion
[+] Running 5/5
 ✔ Network 08docker-compose_default      Created                                                                                                                                                             0.1s
 ✔ Container 08docker-compose-db-1       Created                                                                                                                                                             0.1s
 ✔ Container 08docker-compose-php-fpm-1  Created                                                                                                                                                             0.1s
 ✔ Container 08docker-compose-node-1     Created                                                                                                                                                             0.1s
 ✔ Container 08docker-compose-app-1      Created                                                                                                                                                             0.0s
Attaching to app-1, db-1, node-1, php-fpm-1
php-fpm-1  | DB_PASSWORD=bookstack-test
php-fpm-1  | HOSTNAME=4f6a3c6381d8
php-fpm-1  | PHP_VERSION=8.3.23
php-fpm-1  | PHP_INI_DIR=/usr/local/etc/php
php-fpm-1  | GPG_KEYS=1198C0117593497A5EC5C199286AF1F9897469DC C28D937575603EB4ABB725861C0779DC5C0A9DE4 AFD8691FDAEDF03BDF6E460563F15A9B715376CA
php-fpm-1  | PHP_LDFLAGS=-Wl,-O1 -pie
php-fpm-1  | PWD=/app
php-fpm-1  | DB_PORT=3306
php-fpm-1  | HOME=/root
php-fpm-1  | TEST_DATABASE_URL=mysql://bookstack-test:bookstack-test@db/bookstack-test
php-fpm-1  | PHP_SHA256=08be64700f703bca6ff1284bf1fdaffa37ae1b9734b6559f8350248e8960a6db
php-fpm-1  | PHPIZE_DEPS=autoconf               dpkg-dev                file            g++             gcc             libc-dev                make            pkg-config              re2c
php-fpm-1  | DB_USERNAME=bookstack-test
php-fpm-1  | DB_CONNECTION=mysql
php-fpm-1  | DB_HOST=db
php-fpm-1  | PHP_URL=https://www.php.net/distributions/php-8.3.23.tar.xz
php-fpm-1  | SHLVL=1
php-fpm-1  | PHP_CFLAGS=-fstack-protector-strong -fpic -fpie -O2 -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64
php-fpm-1  | PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
php-fpm-1  | DB_DATABASE=bookstack-dev
php-fpm-1  | PHP_ASC_URL=https://www.php.net/distributions/php-8.3.23.tar.xz.asc
php-fpm-1  | PHP_CPPFLAGS=-fstack-protector-strong -fpic -fpie -O2 -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64
php-fpm-1  | _=/usr/bin/env
db-1       | 2025-07-19 21:51:00+00:00 [Note] [Entrypoint]: Entrypoint script for MySQL Server 8.4.5-1.el9 started.
db-1       | 2025-07-19 21:51:00+00:00 [Note] [Entrypoint]: Switching to dedicated user 'mysql'
db-1       | 2025-07-19 21:51:00+00:00 [Note] [Entrypoint]: Entrypoint script for MySQL Server 8.4.5-1.el9 started.
app-1      | /docker-entrypoint.sh: /docker-entrypoint.d/ is not empty, will attempt to perform configuration
app-1      | /docker-entrypoint.sh: Looking for shell scripts in /docker-entrypoint.d/
app-1      | /docker-entrypoint.sh: Launching /docker-entrypoint.d/10-listen-on-ipv6-by-default.sh
app-1      | 10-listen-on-ipv6-by-default.sh: info: /etc/nginx/conf.d/default.conf is not a file or does not exist
app-1      | /docker-entrypoint.sh: Sourcing /docker-entrypoint.d/15-local-resolvers.envsh
app-1      | /docker-entrypoint.sh: Launching /docker-entrypoint.d/20-envsubst-on-templates.sh
app-1      | /docker-entrypoint.sh: Launching /docker-entrypoint.d/30-tune-worker-processes.sh
app-1      | /docker-entrypoint.sh: Configuration complete; ready for start up
app-1      | 2025/07/19 21:51:00 [notice] 1#1: using the "epoll" event method
app-1      | 2025/07/19 21:51:00 [notice] 1#1: nginx/1.29.0
db-1       | '/var/lib/mysql/mysql.sock' -> '/var/run/mysqld/mysqld.sock'
app-1      | 2025/07/19 21:51:00 [notice] 1#1: built by gcc 12.2.0 (Debian 12.2.0-14+deb12u1)
app-1      | 2025/07/19 21:51:00 [notice] 1#1: OS: Linux 5.15.167.4-microsoft-standard-WSL2
app-1      | 2025/07/19 21:51:00 [notice] 1#1: getrlimit(RLIMIT_NOFILE): 1048576:1048576
app-1      | 2025/07/19 21:51:00 [notice] 1#1: start worker processes
app-1      | 2025/07/19 21:51:00 [notice] 1#1: start worker process 20
app-1      | 2025/07/19 21:51:00 [notice] 1#1: start worker process 21
app-1      | 2025/07/19 21:51:00 [notice] 1#1: start worker process 22
app-1      | 2025/07/19 21:51:00 [notice] 1#1: start worker process 23
app-1      | 2025/07/19 21:51:00 [notice] 1#1: start worker process 24
app-1      | 2025/07/19 21:51:00 [notice] 1#1: start worker process 25
app-1      | 2025/07/19 21:51:00 [notice] 1#1: start worker process 26
app-1      | 2025/07/19 21:51:00 [notice] 1#1: start worker process 27
app-1      | 2025/07/19 21:51:00 [notice] 1#1: start worker process 28
app-1      | 2025/07/19 21:51:00 [notice] 1#1: start worker process 29
app-1      | 2025/07/19 21:51:00 [notice] 1#1: start worker process 30
app-1      | 2025/07/19 21:51:00 [notice] 1#1: start worker process 31
app-1      | 2025/07/19 21:51:00 [notice] 1#1: start worker process 32
app-1      | 2025/07/19 21:51:00 [notice] 1#1: start worker process 33
app-1      | 2025/07/19 21:51:00 [notice] 1#1: start worker process 34
app-1      | 2025/07/19 21:51:00 [notice] 1#1: start worker process 35
app-1      | 2025/07/19 21:51:00 [notice] 1#1: start worker process 36
app-1      | 2025/07/19 21:51:00 [notice] 1#1: start worker process 37
app-1      | 2025/07/19 21:51:00 [notice] 1#1: start worker process 38
app-1      | 2025/07/19 21:51:00 [notice] 1#1: start worker process 39
db-1       | 2025-07-19T21:51:00.636824Z 0 [System] [MY-015015] [Server] MySQL Server - start.
db-1       | 2025-07-19T21:51:00.828473Z 0 [System] [MY-010116] [Server] /usr/sbin/mysqld (mysqld 8.4.5) starting as process 1
db-1       | 2025-07-19T21:51:00.834734Z 1 [System] [MY-013576] [InnoDB] InnoDB initialization has started.
db-1       | 2025-07-19T21:51:01.322656Z 1 [System] [MY-013577] [InnoDB] InnoDB initialization has ended.
php-fpm-1  | > @php -r "!file_exists('bootstrap/cache/services.php') || @unlink('bootstrap/cache/services.php');"
php-fpm-1  | Installing dependencies from lock file (including require-dev)
php-fpm-1  | Verifying lock file contents can be installed on current platform.
php-fpm-1  | Nothing to install, update or remove
php-fpm-1  | Generating optimized autoload files
db-1       | 2025-07-19T21:51:01.685405Z 0 [Warning] [MY-010068] [Server] CA certificate ca.pem is self signed.
db-1       | 2025-07-19T21:51:01.685440Z 0 [System] [MY-013602] [Server] Channel mysql_main configured to support TLS. Encrypted connections are now supported for this channel.
db-1       | 2025-07-19T21:51:01.689789Z 0 [Warning] [MY-011810] [Server] Insecure configuration for --pid-file: Location '/var/run/mysqld' in the path is accessible to all OS users. Consider choosing a different directory.
db-1       | 2025-07-19T21:51:01.754312Z 0 [System] [MY-011323] [Server] X Plugin ready for connections. Bind-address: '::' port: 33060, socket: /var/run/mysqld/mysqlx.sock
db-1       | 2025-07-19T21:51:01.754501Z 0 [System] [MY-010931] [Server] /usr/sbin/mysqld: ready for connections. Version: '8.4.5'  socket: '/var/run/mysqld/mysqld.sock'  port: 3306  MySQL Community Server - GPL.
node-1     |
node-1     | up to date, audited 640 packages in 2s
node-1     |
node-1     | 138 packages are looking for funding
node-1     |   run `npm fund` for details
node-1     |
node-1     | 2 vulnerabilities (1 low, 1 high)
node-1     |
node-1     | To address all issues, run:
node-1     |   npm audit fix
node-1     |
node-1     | Run `npm audit` for details.
node-1     | npm notice
node-1     | npm notice New major version of npm available! 10.9.2 -> 11.4.2
node-1     | npm notice Changelog: https://github.com/npm/cli/releases/tag/v11.4.2
node-1     | npm notice To update run: npm install -g npm@11.4.2
node-1     | npm notice
node-1     | rebuilt dependencies successfully
node-1     |
node-1     | > watch
node-1     | > npm-run-all --parallel build:*:watch
node-1     |
node-1     |
node-1     | > build:js:watch
node-1     | > chokidar --initial "./resources/**/*.js" "./resources/**/*.mjs" "./resources/**/*.ts" -c "npm run build:js:dev"
node-1     |
node-1     |
node-1     | > build:css:watch
node-1     | > sass ./resources/sass:./public/dist --watch --embed-sources
node-1     |
node-1     | add:resources/js/app.ts
node-1     | add:resources/js/custom.d.ts
node-1     | add:resources/js/global.d.ts
node-1     | add:resources/js/code/languages.js
node-1     | add:resources/js/code/setups.js
node-1     | add:resources/js/code/simple-editor-interface.js
node-1     | add:resources/js/code/themes.js
node-1     | add:resources/js/code/views.js
node-1     | add:resources/js/components/add-remove-rows.js
node-1     | add:resources/js/components/ajax-form.js
node-1     | add:resources/js/components/attachments-list.js
node-1     | add:resources/js/components/attachments.js
node-1     | add:resources/js/components/auto-submit.js
node-1     | add:resources/js/components/auto-suggest.js
node-1     | add:resources/js/components/back-to-top.js
node-1     | add:resources/js/components/book-sort.js
node-1     | add:resources/js/components/chapter-contents.js
node-1     | add:resources/js/components/code-editor.js
node-1     | add:resources/js/components/code-highlighter.js
node-1     | add:resources/js/components/code-textarea.js
node-1     | add:resources/js/components/collapsible.js
node-1     | add:resources/js/components/component.js
node-1     | add:resources/js/components/confirm-dialog.js
node-1     | add:resources/js/components/custom-checkbox.js
node-1     | add:resources/js/components/details-highlighter.js
node-1     | add:resources/js/components/dropdown-search.js
node-1     | add:resources/js/components/dropdown.js
node-1     | add:resources/js/components/dropzone.js
node-1     | add:resources/js/components/entity-permissions.js
node-1     | add:resources/js/components/entity-search.js
node-1     | add:resources/js/components/entity-selector-popup.js
node-1     | add:resources/js/components/entity-selector.js
node-1     | add:resources/js/components/event-emit-select.js
node-1     | add:resources/js/components/expand-toggle.js
node-1     | add:resources/js/components/global-search.js
node-1     | add:resources/js/components/header-mobile-toggle.js
node-1     | add:resources/js/components/image-manager.js
node-1     | add:resources/js/components/image-picker.js
node-1     | add:resources/js/components/list-sort-control.js
node-1     | add:resources/js/components/markdown-editor.js
node-1     | add:resources/js/components/new-user-password.js
node-1     | add:resources/js/components/notification.js
node-1     | add:resources/js/components/optional-input.js
node-1     | add:resources/js/components/page-display.js
node-1     | add:resources/js/components/page-editor.js
node-1     | add:resources/js/components/page-picker.js
node-1     | add:resources/js/components/permissions-table.js
node-1     | add:resources/js/components/popup.js
node-1     | add:resources/js/components/setting-app-color-scheme.js
node-1     | add:resources/js/components/setting-color-picker.js
node-1     | add:resources/js/components/setting-homepage-control.js
node-1     | add:resources/js/components/shelf-sort.js
node-1     | add:resources/js/components/shortcut-input.js
node-1     | add:resources/js/components/shortcuts.js
node-1     | add:resources/js/components/sortable-list.js
node-1     | add:resources/js/components/submit-on-change.js
node-1     | add:resources/js/components/tag-manager.js
node-1     | add:resources/js/components/template-manager.js
node-1     | add:resources/js/components/toggle-switch.js
node-1     | add:resources/js/components/user-select.js
node-1     | add:resources/js/components/webhook-events.js
node-1     | add:resources/js/components/wysiwyg-editor-tinymce.js
node-1     | add:resources/js/components/wysiwyg-editor.js
node-1     | add:resources/js/code/index.mjs
node-1     | add:resources/js/code/legacy-modes.mjs
node-1     | add:resources/js/markdown/actions.js
node-1     | add:resources/js/markdown/codemirror.js
node-1     | add:resources/js/markdown/common-events.js
node-1     | add:resources/js/markdown/display.js
node-1     | add:resources/js/markdown/markdown.js
node-1     | add:resources/js/markdown/settings.js
node-1     | add:resources/js/markdown/shortcuts.js
node-1     | add:resources/js/markdown/index.mjs
node-1     | add:resources/js/wysiwyg-tinymce/common-events.js
node-1     | add:resources/js/wysiwyg-tinymce/config.js
node-1     | add:resources/js/wysiwyg-tinymce/drop-paste-handling.js
node-1     | add:resources/js/wysiwyg-tinymce/filters.js
node-1     | add:resources/js/wysiwyg-tinymce/fixes.js
node-1     | add:resources/js/wysiwyg-tinymce/icons.js
node-1     | add:resources/js/wysiwyg-tinymce/plugin-codeeditor.js
node-1     | add:resources/js/wysiwyg-tinymce/plugin-drawio.js
node-1     | add:resources/js/wysiwyg-tinymce/plugins-about.js
node-1     | add:resources/js/wysiwyg-tinymce/plugins-customhr.js
node-1     | add:resources/js/wysiwyg-tinymce/plugins-details.js
node-1     | add:resources/js/wysiwyg-tinymce/plugins-imagemanager.js
node-1     | add:resources/js/wysiwyg-tinymce/plugins-stub.js
node-1     | add:resources/js/wysiwyg-tinymce/plugins-table-additions.js
node-1     | add:resources/js/wysiwyg-tinymce/plugins-tasklist.js
node-1     | add:resources/js/wysiwyg-tinymce/scrolling.js
node-1     | add:resources/js/wysiwyg-tinymce/shortcuts.js
node-1     | add:resources/js/wysiwyg-tinymce/toolbars.js
node-1     | add:resources/js/wysiwyg-tinymce/util.js
node-1     | add:resources/js/components/ajax-delete-row.ts
node-1     | add:resources/js/components/editor-toolbox.ts
node-1     | add:resources/js/components/index.ts
node-1     | add:resources/js/components/loading-button.ts
node-1     | add:resources/js/components/page-comment-reference.ts
node-1     | add:resources/js/components/page-comment.ts
node-1     | add:resources/js/components/page-comments.ts
node-1     | add:resources/js/components/pointer.ts
node-1     | add:resources/js/components/sort-rule-manager.ts
node-1     | add:resources/js/components/tabs.ts
node-1     | add:resources/js/components/tri-layout.ts
node-1     | add:resources/js/components/wysiwyg-input.ts
node-1     | add:resources/js/services/animations.ts
node-1     | add:resources/js/services/clipboard.ts
node-1     | add:resources/js/services/components.ts
node-1     | add:resources/js/services/dates.ts
node-1     | add:resources/js/services/dom.ts
node-1     | add:resources/js/services/drawio.ts
node-1     | add:resources/js/services/dual-lists.ts
node-1     | add:resources/js/services/events.ts
node-1     | add:resources/js/services/http.ts
node-1     | add:resources/js/services/keyboard-navigation.ts
node-1     | add:resources/js/services/store.ts
node-1     | add:resources/js/services/text.ts
node-1     | add:resources/js/services/translations.ts
node-1     | add:resources/js/services/util.ts
node-1     | add:resources/js/services/vdom.ts
node-1     | add:resources/js/wysiwyg/index.ts
node-1     | add:resources/js/wysiwyg/nodes.ts
node-1     | add:resources/js/services/__tests__/translations.test.ts
node-1     | add:resources/js/wysiwyg/services/auto-links.ts
node-1     | add:resources/js/wysiwyg/services/common-events.ts
node-1     | add:resources/js/wysiwyg/services/drop-paste-handling.ts
node-1     | add:resources/js/wysiwyg/services/keyboard-handling.ts
node-1     | add:resources/js/wysiwyg/services/shortcuts.ts
node-1     | add:resources/js/wysiwyg/ui/index.ts
node-1     | add:resources/js/wysiwyg/utils/actions.ts
node-1     | add:resources/js/wysiwyg/utils/diagrams.ts
node-1     | add:resources/js/wysiwyg/utils/dom.ts
node-1     | add:resources/js/wysiwyg/utils/formats.ts
node-1     | add:resources/js/wysiwyg/utils/images.ts
node-1     | add:resources/js/wysiwyg/utils/links.ts
node-1     | add:resources/js/wysiwyg/utils/lists.ts
node-1     | add:resources/js/wysiwyg/utils/node-clipboard.ts
node-1     | add:resources/js/wysiwyg/utils/nodes.ts
node-1     | add:resources/js/wysiwyg/utils/selection.ts
node-1     | add:resources/js/wysiwyg/utils/table-copy-paste.ts
node-1     | add:resources/js/wysiwyg/utils/table-map.ts
node-1     | add:resources/js/wysiwyg/utils/tables.ts
node-1     | add:resources/js/wysiwyg/lexical/clipboard/clipboard.ts
node-1     | add:resources/js/wysiwyg/lexical/clipboard/index.ts
node-1     | add:resources/js/wysiwyg/lexical/headless/index.ts
node-1     | add:resources/js/wysiwyg/lexical/core/LexicalCommands.ts
node-1     | add:resources/js/wysiwyg/lexical/core/LexicalConstants.ts
node-1     | add:resources/js/wysiwyg/lexical/core/LexicalEditor.ts
node-1     | add:resources/js/wysiwyg/lexical/core/LexicalEditorState.ts
node-1     | add:resources/js/wysiwyg/lexical/core/LexicalEvents.ts
node-1     | add:resources/js/wysiwyg/lexical/core/LexicalGC.ts
node-1     | add:resources/js/wysiwyg/lexical/core/LexicalMutations.ts
node-1     | add:resources/js/wysiwyg/lexical/core/LexicalNode.ts
node-1     | add:resources/js/wysiwyg/lexical/core/LexicalNormalization.ts
node-1     | add:resources/js/wysiwyg/lexical/core/LexicalReconciler.ts
node-1     | add:resources/js/wysiwyg/lexical/core/LexicalSelection.ts
node-1     | add:resources/js/wysiwyg/lexical/core/LexicalUpdates.ts
node-1     | add:resources/js/wysiwyg/lexical/core/LexicalUtils.ts
node-1     | add:resources/js/wysiwyg/lexical/core/index.ts
node-1     | add:resources/js/wysiwyg/lexical/history/index.ts
node-1     | add:resources/js/wysiwyg/lexical/html/index.ts
node-1     | add:resources/js/wysiwyg/lexical/link/index.ts
node-1     | add:resources/js/wysiwyg/lexical/list/LexicalListItemNode.ts
node-1     | add:resources/js/wysiwyg/lexical/list/LexicalListNode.ts
node-1     | add:resources/js/wysiwyg/lexical/list/formatList.ts
node-1     | add:resources/js/wysiwyg/lexical/list/index.ts
node-1     | add:resources/js/wysiwyg/lexical/list/utils.ts
node-1     | add:resources/js/wysiwyg/lexical/selection/constants.ts
node-1     | add:resources/js/wysiwyg/lexical/selection/index.ts
node-1     | add:resources/js/wysiwyg/lexical/selection/lexical-node.ts
node-1     | add:resources/js/wysiwyg/lexical/selection/range-selection.ts
node-1     | add:resources/js/wysiwyg/lexical/selection/utils.ts
node-1     | add:resources/js/wysiwyg/lexical/table/LexicalCaptionNode.ts
node-1     | add:resources/js/wysiwyg/lexical/table/LexicalTableCellNode.ts
node-1     | add:resources/js/wysiwyg/lexical/table/LexicalTableCommands.ts
node-1     | add:resources/js/wysiwyg/lexical/table/LexicalTableNode.ts
node-1     | add:resources/js/wysiwyg/lexical/table/LexicalTableObserver.ts
node-1     | add:resources/js/wysiwyg/lexical/table/LexicalTableRowNode.ts
node-1     | add:resources/js/wysiwyg/lexical/table/LexicalTableSelection.ts
node-1     | add:resources/js/wysiwyg/lexical/table/LexicalTableSelectionHelpers.ts
node-1     | add:resources/js/wysiwyg/lexical/table/LexicalTableUtils.ts
node-1     | add:resources/js/wysiwyg/lexical/table/constants.ts
node-1     | add:resources/js/wysiwyg/lexical/table/index.ts
node-1     | add:resources/js/wysiwyg/lexical/utils/index.ts
node-1     | add:resources/js/wysiwyg/lexical/utils/markSelection.ts
node-1     | add:resources/js/wysiwyg/lexical/utils/mergeRegister.ts
node-1     | add:resources/js/wysiwyg/lexical/utils/positionNodeOnRange.ts
node-1     | add:resources/js/wysiwyg/lexical/utils/px.ts
node-1     | add:resources/js/wysiwyg/lexical/yjs/Bindings.ts
node-1     | add:resources/js/wysiwyg/lexical/yjs/CollabDecoratorNode.ts
node-1     | add:resources/js/wysiwyg/lexical/yjs/CollabElementNode.ts
node-1     | add:resources/js/wysiwyg/lexical/yjs/CollabLineBreakNode.ts
node-1     | add:resources/js/wysiwyg/lexical/yjs/CollabTextNode.ts
node-1     | add:resources/js/wysiwyg/lexical/yjs/SyncCursors.ts
node-1     | add:resources/js/wysiwyg/lexical/yjs/SyncEditorStates.ts
node-1     | add:resources/js/wysiwyg/lexical/yjs/Utils.ts
node-1     | add:resources/js/wysiwyg/lexical/yjs/index.ts
node-1     | add:resources/js/wysiwyg/lexical/yjs/types.ts
node-1     | add:resources/js/wysiwyg/services/__tests__/auto-links.test.ts
node-1     | add:resources/js/wysiwyg/services/__tests__/keyboard-handling.test.ts
node-1     | add:resources/js/wysiwyg/lexical/rich-text/LexicalCalloutNode.ts
node-1     | add:resources/js/wysiwyg/lexical/rich-text/LexicalCodeBlockNode.ts
node-1     | add:resources/js/wysiwyg/lexical/rich-text/LexicalDetailsNode.ts
node-1     | add:resources/js/wysiwyg/lexical/rich-text/LexicalDiagramNode.ts
node-1     | add:resources/js/wysiwyg/lexical/rich-text/LexicalHeadingNode.ts
node-1     | add:resources/js/wysiwyg/lexical/rich-text/LexicalHorizontalRuleNode.ts
node-1     | add:resources/js/wysiwyg/lexical/rich-text/LexicalImageNode.ts
node-1     | add:resources/js/wysiwyg/lexical/rich-text/LexicalMediaNode.ts
node-1     | add:resources/js/wysiwyg/lexical/rich-text/LexicalQuoteNode.ts
node-1     | add:resources/js/wysiwyg/lexical/rich-text/index.ts
node-1     | add:resources/js/wysiwyg/ui/decorators/code-block.ts
node-1     | add:resources/js/wysiwyg/ui/decorators/diagram.ts
node-1     | add:resources/js/wysiwyg/ui/framework/buttons.ts
node-1     | add:resources/js/wysiwyg/ui/framework/core.ts
node-1     | add:resources/js/wysiwyg/ui/framework/decorator.ts
node-1     | add:resources/js/wysiwyg/ui/framework/forms.ts
node-1     | add:resources/js/wysiwyg/ui/framework/manager.ts
node-1     | add:resources/js/wysiwyg/ui/framework/modals.ts
node-1     | add:resources/js/wysiwyg/ui/framework/toolbars.ts
node-1     | add:resources/js/wysiwyg/ui/defaults/modals.ts
node-1     | add:resources/js/wysiwyg/ui/defaults/toolbars.ts
node-1     | add:resources/js/wysiwyg/utils/__tests__/lists.test.ts
node-1     | add:resources/js/wysiwyg/lexical/core/nodes/ArtificialNode.ts
node-1     | add:resources/js/wysiwyg/lexical/core/nodes/CommonBlockNode.ts
node-1     | add:resources/js/wysiwyg/lexical/core/nodes/LexicalDecoratorNode.ts
node-1     | add:resources/js/wysiwyg/lexical/core/nodes/LexicalElementNode.ts
node-1     | add:resources/js/wysiwyg/lexical/core/nodes/LexicalLineBreakNode.ts
node-1     | add:resources/js/wysiwyg/lexical/core/nodes/LexicalParagraphNode.ts
node-1     | add:resources/js/wysiwyg/lexical/core/nodes/LexicalRootNode.ts
node-1     | add:resources/js/wysiwyg/lexical/core/nodes/LexicalTabNode.ts
node-1     | add:resources/js/wysiwyg/lexical/core/nodes/LexicalTextNode.ts
node-1     | add:resources/js/wysiwyg/lexical/core/nodes/common.ts
node-1     | add:resources/js/wysiwyg/lexical/core/shared/canUseDOM.ts
node-1     | add:resources/js/wysiwyg/lexical/core/shared/caretFromPoint.ts
node-1     | add:resources/js/wysiwyg/lexical/core/shared/environment.ts
node-1     | add:resources/js/wysiwyg/lexical/core/shared/invariant.ts
node-1     | add:resources/js/wysiwyg/lexical/core/shared/normalizeClassNames.ts
node-1     | add:resources/js/wysiwyg/lexical/core/shared/simpleDiffWithCursor.ts
node-1     | add:resources/js/wysiwyg/lexical/core/shared/warnOnlyOnce.ts
node-1     | add:resources/js/wysiwyg/ui/framework/blocks/action-field.ts
node-1     | add:resources/js/wysiwyg/ui/framework/blocks/button-with-menu.ts
node-1     | add:resources/js/wysiwyg/ui/framework/blocks/color-button.ts
node-1     | add:resources/js/wysiwyg/ui/framework/blocks/color-field.ts
node-1     | add:resources/js/wysiwyg/ui/framework/blocks/color-picker.ts
node-1     | add:resources/js/wysiwyg/ui/framework/blocks/dropdown-button.ts
node-1     | add:resources/js/wysiwyg/ui/framework/blocks/external-content.ts
node-1     | add:resources/js/wysiwyg/ui/framework/blocks/format-menu.ts
node-1     | add:resources/js/wysiwyg/ui/framework/blocks/format-preview-button.ts
node-1     | add:resources/js/wysiwyg/ui/framework/blocks/link-field.ts
node-1     | add:resources/js/wysiwyg/ui/framework/blocks/menu-button.ts
node-1     | add:resources/js/wysiwyg/ui/framework/blocks/overflow-container.ts
node-1     | add:resources/js/wysiwyg/ui/framework/blocks/separator.ts
node-1     | add:resources/js/wysiwyg/ui/framework/blocks/table-creator.ts
node-1     | add:resources/js/wysiwyg/ui/framework/helpers/dropdowns.ts
node-1     | add:resources/js/wysiwyg/ui/framework/helpers/mouse-drag-tracker.ts
node-1     | add:resources/js/wysiwyg/ui/framework/helpers/node-resizer.ts
node-1     | add:resources/js/wysiwyg/ui/framework/helpers/table-resizer.ts
node-1     | add:resources/js/wysiwyg/ui/framework/helpers/table-selection-handler.ts
node-1     | add:resources/js/wysiwyg/ui/framework/helpers/task-list-handler.ts
node-1     | add:resources/js/wysiwyg/ui/defaults/buttons/alignments.ts
node-1     | add:resources/js/wysiwyg/ui/defaults/buttons/block-formats.ts
node-1     | add:resources/js/wysiwyg/ui/defaults/buttons/controls.ts
node-1     | add:resources/js/wysiwyg/ui/defaults/buttons/inline-formats.ts
node-1     | add:resources/js/wysiwyg/ui/defaults/buttons/lists.ts
node-1     | add:resources/js/wysiwyg/ui/defaults/buttons/objects.ts
node-1     | add:resources/js/wysiwyg/ui/defaults/buttons/tables.ts
node-1     | add:resources/js/wysiwyg/ui/defaults/forms/controls.ts
node-1     | add:resources/js/wysiwyg/ui/defaults/forms/objects.ts
node-1     | add:resources/js/wysiwyg/ui/defaults/forms/tables.ts
node-1     | add:resources/js/wysiwyg/lexical/headless/__tests__/unit/LexicalHeadlessEditor.test.ts
node-1     | add:resources/js/wysiwyg/lexical/core/__tests__/utils/index.ts
node-1     | add:resources/js/wysiwyg/lexical/core/shared/__mocks__/invariant.ts
node-1     | add:resources/js/wysiwyg/lexical/core/__tests__/unit/HTMLCopyAndPaste.test.ts
node-1     | add:resources/js/wysiwyg/lexical/core/__tests__/unit/LexicalEditor.test.ts
node-1     | add:resources/js/wysiwyg/lexical/core/__tests__/unit/LexicalEditorState.test.ts
node-1     | add:resources/js/wysiwyg/lexical/core/__tests__/unit/LexicalNode.test.ts
node-1     | add:resources/js/wysiwyg/lexical/core/__tests__/unit/LexicalNormalization.test.ts
node-1     | add:resources/js/wysiwyg/lexical/core/__tests__/unit/LexicalSelection.test.ts
node-1     | add:resources/js/wysiwyg/lexical/core/__tests__/unit/LexicalSerialization.test.ts
node-1     | add:resources/js/wysiwyg/lexical/core/__tests__/unit/LexicalUtils.test.ts
node-1     | add:resources/js/wysiwyg/lexical/html/__tests__/unit/LexicalHtml.test.ts
node-1     | add:resources/js/wysiwyg/lexical/link/__tests__/unit/LexicalAutoLinkNode.test.ts
node-1     | add:resources/js/wysiwyg/lexical/link/__tests__/unit/LexicalLinkNode.test.ts
node-1     | add:resources/js/wysiwyg/lexical/list/__tests__/unit/LexicalListItemNode.test.ts
node-1     | add:resources/js/wysiwyg/lexical/list/__tests__/unit/LexicalListNode.test.ts
node-1     | add:resources/js/wysiwyg/lexical/list/__tests__/unit/utils.test.ts
node-1     | add:resources/js/wysiwyg/lexical/selection/__tests__/unit/LexicalSelection.test.ts
node-1     | add:resources/js/wysiwyg/lexical/selection/__tests__/unit/LexicalSelectionHelpers.test.ts
node-1     | add:resources/js/wysiwyg/lexical/selection/__tests__/utils/index.ts
node-1     | add:resources/js/wysiwyg/lexical/utils/__tests__/unit/LexicalElementHelpers.test.ts
node-1     | add:resources/js/wysiwyg/lexical/utils/__tests__/unit/LexicalEventHelpers.test.ts
node-1     | add:resources/js/wysiwyg/lexical/utils/__tests__/unit/LexicalNodeHelpers.test.ts
node-1     | add:resources/js/wysiwyg/lexical/utils/__tests__/unit/LexicalRootHelpers.test.ts
node-1     | add:resources/js/wysiwyg/lexical/utils/__tests__/unit/LexicalUtilsKlassEqual.test.ts
node-1     | add:resources/js/wysiwyg/lexical/utils/__tests__/unit/LexicalUtilsSplitNode.test.ts
node-1     | add:resources/js/wysiwyg/lexical/utils/__tests__/unit/LexlcaiUtilsInsertNodeToNearestRoot.test.ts
node-1     | add:resources/js/wysiwyg/lexical/utils/__tests__/unit/mergeRegister.test.ts
node-1     | add:resources/js/wysiwyg/lexical/rich-text/__tests__/unit/LexicalDetailsNode.test.ts
node-1     | add:resources/js/wysiwyg/lexical/rich-text/__tests__/unit/LexicalHeadingNode.test.ts
node-1     | add:resources/js/wysiwyg/lexical/rich-text/__tests__/unit/LexicalMediaNode.test.ts
node-1     | add:resources/js/wysiwyg/lexical/rich-text/__tests__/unit/LexicalQuoteNode.test.ts
node-1     | add:resources/js/wysiwyg/lexical/table/__tests__/unit/LexicalTableCellNode.test.ts
node-1     | add:resources/js/wysiwyg/lexical/table/__tests__/unit/LexicalTableNode.test.ts
node-1     | add:resources/js/wysiwyg/lexical/table/__tests__/unit/LexicalTableRowNode.test.ts
node-1     | add:resources/js/wysiwyg/lexical/table/__tests__/unit/LexicalTableSelection.test.ts
node-1     | add:resources/js/wysiwyg/lexical/core/nodes/__tests__/unit/LexicalElementNode.test.ts
node-1     | add:resources/js/wysiwyg/lexical/core/nodes/__tests__/unit/LexicalGC.test.ts
node-1     | add:resources/js/wysiwyg/lexical/core/nodes/__tests__/unit/LexicalLineBreakNode.test.ts
node-1     | add:resources/js/wysiwyg/lexical/core/nodes/__tests__/unit/LexicalParagraphNode.test.ts
node-1     | add:resources/js/wysiwyg/lexical/core/nodes/__tests__/unit/LexicalRootNode.test.ts
node-1     | add:resources/js/wysiwyg/lexical/core/nodes/__tests__/unit/LexicalTabNode.test.ts
node-1     | add:resources/js/wysiwyg/lexical/core/nodes/__tests__/unit/LexicalTextNode.test.ts
node-1     | Watching "./resources/**/*.js", "./resources/**/*.mjs", "./resources/**/*.ts" ..
node-1     | Sass is watching for changes. Press Ctrl-C to stop.
node-1     |
node-1     |
node-1     | > build:js:dev
node-1     | > node dev/build/esbuild.js
node-1     |
node-1     |
node-1     |   public/dist/code.js                1.1mb ⚠️
node-1     |   public/dist/wysiwyg.js           720.4kb
node-1     |   public/dist/app.js               343.9kb
node-1     |   public/dist/markdown.js          295.0kb
node-1     |   public/dist/legacy-modes.js      293.1kb
node-1     |   public/dist/code.js.map            2.1mb
node-1     |   public/dist/wysiwyg.js.map         1.5mb
node-1     |   public/dist/app.js.map           669.9kb
node-1     |   public/dist/legacy-modes.js.map  498.9kb
node-1     |   public/dist/markdown.js.map      474.8kb
node-1     |
node-1     | ⚡ Done in 159ms
php-fpm-1  | Class Api\ExportsApiTest located in ./tests/Api/ExportsApiTest.php does not comply with psr-4 autoloading standard (rule: Tests\ => ./tests). Skipping.
php-fpm-1  | Class Api\ImportsApiTest located in ./tests/Api/ImportsApiTest.php does not comply with psr-4 autoloading standard (rule: Tests\ => ./tests). Skipping.
php-fpm-1  | > Illuminate\Foundation\ComposerScripts::postAutoloadDump
php-fpm-1  | > @php artisan package:discover --ansi
php-fpm-1  |
php-fpm-1  |    INFO  Discovering packages.
php-fpm-1  |
php-fpm-1  |   itsgoingd/clockwork ................................................... DONE
php-fpm-1  |   laravel/socialite ..................................................... DONE
php-fpm-1  |   laravel/tinker ........................................................ DONE
php-fpm-1  |   nesbot/carbon ......................................................... DONE
php-fpm-1  |   nunomaduro/collision .................................................. DONE
php-fpm-1  |   nunomaduro/termwind ................................................... DONE
php-fpm-1  |   socialiteproviders/manager ............................................ DONE
php-fpm-1  |
php-fpm-1  | 90 packages you are using are looking for funding.
php-fpm-1  | Use the `composer fund` command to find out more!
php-fpm-1  | > @php artisan cache:clear
php-fpm-1  |
php-fpm-1  |    INFO  Application cache cleared successfully.
php-fpm-1  |
php-fpm-1  | > @php artisan view:clear
php-fpm-1  |
php-fpm-1  |    INFO  Compiled views cleared successfully.
php-fpm-1  |
app-1      | 2025/07/19 21:51:14 [error] 20#20: *1 connect() failed (111: Connection refused) while connecting to upstream, client: 172.19.128.1, server: _, request: "GET /index.php HTTP/1.1", upstream: "fastcgi://172.22.0.3:9000", host: "172.19.134.101"
app-1      | 172.19.128.1 - - [19/Jul/2025:21:51:14 +0000] "GET /index.php HTTP/1.1" 502 157 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:140.0) Gecko/20100101 Firefox/140.0" "-"
app-1      | 172.19.128.1 - - [19/Jul/2025:21:51:14 +0000] "GET /favicon.ico HTTP/1.1" 499 0 "http://172.19.134.101/index.php" "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:140.0) Gecko/20100101 Firefox/140.0" "-"
app-1      | 172.19.128.1 - - [19/Jul/2025:21:51:16 +0000] "GET /index.php HTTP/1.1" 502 157 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:140.0) Gecko/20100101 Firefox/140.0" "-"
app-1      | 2025/07/19 21:51:16 [error] 23#23: *4 connect() failed (111: Connection refused) while connecting to upstream, client: 172.19.128.1, server: _, request: "GET /index.php HTTP/1.1", upstream: "fastcgi://172.22.0.3:9000", host: "172.19.134.101"
php-fpm-1  |
php-fpm-1  |    INFO  Nothing to migrate.
php-fpm-1  |
php-fpm-1  | [19-Jul-2025 21:51:17] NOTICE: fpm is running, pid 45
php-fpm-1  | [19-Jul-2025 21:51:17] NOTICE: ready to handle connections
app-1      | 172.19.128.1 - - [19/Jul/2025:21:51:25 +0000] "GET /index.php HTTP/1.1" 302 406 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:140.0) Gecko/20100101 Firefox/140.0" "-"
php-fpm-1  | 172.22.0.5 -  19/Jul/2025:21:51:25 +0000 "GET /index.php" 302
app-1      | 172.19.128.1 - - [19/Jul/2025:21:51:25 +0000] "GET /index.php/login HTTP/1.1" 200 8822 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:140.0) Gecko/20100101 Firefox/140.0" "-"
php-fpm-1  | 172.22.0.5 -  19/Jul/2025:21:51:25 +0000 "GET /index.php" 200
app-1      | 172.19.128.1 - - [19/Jul/2025:21:51:25 +0000] "GET /index.php/dist/app.js?version=v25.02-dev HTTP/1.1" 404 7783 "http://172.19.134.101/index.php/login" "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:140.0) Gecko/20100101 Firefox/140.0" "-"
php-fpm-1  | 172.22.0.5 -  19/Jul/2025:21:51:25 +0000 "GET /index.php" 404
app-1      | 172.19.128.1 - - [19/Jul/2025:21:51:25 +0000] "GET /index.php/dist/styles.css?version=v25.02-dev HTTP/1.1" 404 7780 "http://172.19.134.101/index.php/login" "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:140.0) Gecko/20100101 Firefox/140.0" "-"
php-fpm-1  | 172.22.0.5 -  19/Jul/2025:21:51:25 +0000 "GET /index.php" 404
app-1      | 172.19.128.1 - - [19/Jul/2025:21:51:25 +0000] "GET /index.php/logo.png HTTP/1.1" 404 7780 "http://172.19.134.101/index.php/login" "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:140.0) Gecko/20100101 Firefox/140.0" "-"
php-fpm-1  | 172.22.0.5 -  19/Jul/2025:21:51:25 +0000 "GET /index.php" 404
app-1      | 172.19.128.1 - - [19/Jul/2025:21:51:25 +0000] "GET /index.php/icon.png HTTP/1.1" 404 7780 "http://172.19.134.101/index.php/login" "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:140.0) Gecko/20100101 Firefox/140.0" "-"
php-fpm-1  | 172.22.0.5 -  19/Jul/2025:21:51:25 +0000 "GET /index.php" 404
app-1      | 172.19.128.1 - - [19/Jul/2025:21:51:25 +0000] "GET /index.php/icon-32.png HTTP/1.1" 404 7783 "http://172.19.134.101/index.php/login" "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:140.0) Gecko/20100101 Firefox/140.0" "-"
php-fpm-1  | 172.22.0.5 -  19/Jul/2025:21:51:25 +0000 "GET /index.php" 404
app-1      | 172.19.128.1 - - [19/Jul/2025:21:53:50 +0000] "GET / HTTP/1.1" 302 366 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:140.0) Gecko/20100101 Firefox/140.0" "-"
php-fpm-1  | 172.22.0.5 -  19/Jul/2025:21:53:50 +0000 "GET /index.php" 302
php-fpm-1  | 172.22.0.5 -  19/Jul/2025:21:53:50 +0000 "GET /index.php" 200
app-1      | 172.19.128.1 - - [19/Jul/2025:21:53:50 +0000] "GET /login HTTP/1.1" 200 8652 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:140.0) Gecko/20100101 Firefox/140.0" "-"
app-1      | 172.19.128.1 - - [19/Jul/2025:21:53:50 +0000] "GET /dist/styles.css?version=v25.02-dev HTTP/1.1" 200 167372 "http://172.19.134.101/login" "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:140.0) Gecko/20100101 Firefox/140.0" "-"
app-1      | 172.19.128.1 - - [19/Jul/2025:21:53:50 +0000] "GET /dist/app.js?version=v25.02-dev HTTP/1.1" 200 352182 "http://172.19.134.101/login" "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:140.0) Gecko/20100101 Firefox/140.0" "-"
app-1      | 172.19.128.1 - - [19/Jul/2025:21:53:50 +0000] "GET /logo.png HTTP/1.1" 200 3256 "http://172.19.134.101/login" "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:140.0) Gecko/20100101 Firefox/140.0" "-"
app-1      | 172.19.128.1 - - [19/Jul/2025:21:53:50 +0000] "GET /dist/styles.css.map HTTP/1.1" 200 186411 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:140.0) Gecko/20100101 Firefox/140.0" "-"
app-1      | 172.19.128.1 - - [19/Jul/2025:21:53:50 +0000] "GET /icon-32.png HTTP/1.1" 200 746 "http://172.19.134.101/login" "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:140.0) Gecko/20100101 Firefox/140.0" "-"
app-1      | 172.19.128.1 - - [19/Jul/2025:21:53:50 +0000] "GET /icon.png HTTP/1.1" 200 6350 "http://172.19.134.101/login" "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:140.0) Gecko/20100101 Firefox/140.0" "-"
app-1      | 172.19.128.1 - - [19/Jul/2025:21:54:24 +0000] "POST /login HTTP/1.1" 302 342 "http://172.19.134.101/login" "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:140.0) Gecko/20100101 Firefox/140.0" "-"
php-fpm-1  | 172.22.0.5 -  19/Jul/2025:21:54:24 +0000 "POST /index.php" 302
app-1      | 172.19.128.1 - - [19/Jul/2025:21:54:24 +0000] "GET / HTTP/1.1" 200 17505 "http://172.19.134.101/login" "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:140.0) Gecko/20100101 Firefox/140.0" "-"
php-fpm-1  | 172.22.0.5 -  19/Jul/2025:21:54:24 +0000 "GET /index.php" 200
app-1      | 172.19.128.1 - - [19/Jul/2025:21:54:24 +0000] "GET /dist/app.js?version=v25.02-dev HTTP/1.1" 304 0 "http://172.19.134.101/" "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:140.0) Gecko/20100101 Firefox/140.0" "-"
app-1      | 172.19.128.1 - - [19/Jul/2025:21:54:24 +0000] "GET /user_avatar.png HTTP/1.1" 200 3180 "http://172.19.134.101/" "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:140.0) Gecko/20100101 Firefox/140.0" "-"
app-1      | 172.19.128.1 - - [19/Jul/2025:21:54:24 +0000] "GET /dist/styles.css.map HTTP/1.1" 304 0 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:140.0) Gecko/20100101 Firefox/140.0" "-"
```

# HA2

## Build Process

```bash
Run docker/build-push-action@0565240e2d4ab88bba5387d719585280857ece09
GitHub Actions runtime token ACs
Docker info
Proxy configuration
Buildx version
/usr/bin/docker buildx build --cache-from type=gha --cache-to type=gha,mode=max --iidfile /tmp/docker-actions-toolkit-dO1xZw/iidfile --label org.opencontainers.image.created=2025-07-20T18:31:34.699Z --label org.opencontainers.image.description= --label org.opencontainers.image.licenses= --label org.opencontainers.image.revision=c1bd10c6b7abfb6c67b08247bd511e4ff17bcf44 --label org.opencontainers.image.source=https://github.com/t1wg/multistage-build --label org.opencontainers.image.title=multistage-build --label org.opencontainers.image.url=https://github.com/t1wg/multistage-build --label org.opencontainers.image.version=main --tag ghcr.io/t1wg/multistage-build:main --metadata-file /tmp/docker-actions-toolkit-dO1xZw/metadata-file --push .
#0 building with "builder-423f7a86-e110-45c5-95aa-2955a239216f" instance using docker-container driver

#1 [internal] load build definition from Dockerfile
#1 transferring dockerfile: 435B done
#1 WARN: FromAsCasing: 'as' and 'FROM' keywords' casing do not match (line 1)
#1 DONE 0.0s

#2 [auth] library/debian:pull token for registry-1.docker.io
#2 DONE 0.0s

#3 [auth] library/python:pull token for registry-1.docker.io
#3 DONE 0.0s

#4 [internal] load metadata for docker.io/library/python:3.11-slim
#4 ...

#5 [internal] load metadata for docker.io/library/debian:stable-slim
#5 DONE 0.4s

#4 [internal] load metadata for docker.io/library/python:3.11-slim
#4 DONE 0.5s

#6 [internal] load .dockerignore
#6 transferring context: 2B done
#6 DONE 0.0s

#7 [internal] load build context
#7 DONE 0.0s

#8 [stage-1 1/2] FROM docker.io/library/debian:stable-slim@sha256:7e0b7fe7c6d695d615eabaea8d19adf592a6a9ff3dbd5206d3e31139b9afdfa7
#8 resolve docker.io/library/debian:stable-slim@sha256:7e0b7fe7c6d695d615eabaea8d19adf592a6a9ff3dbd5206d3e31139b9afdfa7 done
#8 DONE 0.0s

#9 [builder 1/5] FROM docker.io/library/python:3.11-slim@sha256:139020233cc412efe4c8135b0efe1c7569dc8b28ddd88bddb109b764f8977e30
#9 resolve docker.io/library/python:3.11-slim@sha256:139020233cc412efe4c8135b0efe1c7569dc8b28ddd88bddb109b764f8977e30 0.0s done
#9 DONE 0.0s

#10 importing cache manifest from gha:15748900788057950132
#10 DONE 0.2s

#7 [internal] load build context
#7 transferring context: 195B done
#7 DONE 0.0s

#11 [builder 2/5] WORKDIR /app
#11 CACHED

#12 [builder 3/5] RUN apt-get update &&     apt-get install -y --no-install-recommends binutils &&     rm -rf /var/lib/apt/lists/*
#12 CACHED

#13 [builder 4/5] COPY main.py .
#13 CACHED

#14 [builder 5/5] RUN pip install --no-cache-dir pyinstaller &&     pyinstaller --onefile --name myapp --clean main.py
#14 CACHED

#15 [stage-1 2/2] COPY --from=builder /app/dist/myapp /usr/local/bin/myapp
#15 CACHED

#16 [auth] t1wg/multistage-build:pull,push token for ghcr.io
#16 DONE 0.0s

#17 exporting to image
#17 exporting layers done
#17 exporting manifest sha256:9bbf77b559e7bca8809c5dad9c625a91232395031e6c3e447c77365565c0a41b done
#17 exporting config sha256:3a29523a93cc5a35e9b3452b3ddff3c1c984d1fbf43d966d0b12277bf8fa9fc8 done
#17 exporting attestation manifest sha256:77143accd2033f87bc9497b4b2a7a886df1785551ce36cef84c4a56f71d9908d done
#17 exporting manifest list sha256:1dc0578e94db682573f0c062b35dabc070da6592f7bb7b11c5d26f2a062c9535 done
#17 pushing layers
#17 pushing layers 1.2s done
#17 pushing manifest for ghcr.io/t1wg/multistage-build:main@sha256:1dc0578e94db682573f0c062b35dabc070da6592f7bb7b11c5d26f2a062c9535
#17 pushing manifest for ghcr.io/t1wg/multistage-build:main@sha256:1dc0578e94db682573f0c062b35dabc070da6592f7bb7b11c5d26f2a062c9535 0.8s done
#17 DONE 2.0s

#18 exporting to GitHub Actions Cache
#18 preparing build cache for export
#18 preparing build cache for export 0.6s done
#18 DONE 0.6s

#19 resolving provenance for metadata file
#19 DONE 0.0s

```