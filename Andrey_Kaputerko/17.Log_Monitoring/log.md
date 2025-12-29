# Logs from log pod from /var/log/pods/
```
2025-12-02T19:07:28.461394805+03:00 stdout F Tue Dec  2 16:07:28 UTC 2025 - Counter: 0
2025-12-02T19:07:38.463380571+03:00 stdout F Tue Dec  2 16:07:38 UTC 2025 - Counter: 1
2025-12-02T19:07:48.465420591+03:00 stdout F Tue Dec  2 16:07:48 UTC 2025 - Counter: 2
2025-12-02T19:07:58.468062051+03:00 stdout F Tue Dec  2 16:07:58 UTC 2025 - Counter: 3
2025-12-02T19:08:08.471002858+03:00 stdout F Tue Dec  2 16:08:08 UTC 2025 - Counter: 4
2025-12-02T19:08:18.473207356+03:00 stdout F Tue Dec  2 16:08:18 UTC 2025 - Counter: 5
2025-12-02T19:08:28.475328465+03:00 stdout F Tue Dec  2 16:08:28 UTC 2025 - Counter: 6
2025-12-02T19:08:38.478410391+03:00 stdout F Tue Dec  2 16:08:38 UTC 2025 - Counter: 7
2025-12-02T19:08:48.480752792+03:00 stdout F Tue Dec  2 16:08:48 UTC 2025 - Counter: 8
2025-12-02T19:08:58.483327465+03:00 stdout F Tue Dec  2 16:08:58 UTC 2025 - Counter: 9
2025-12-02T19:09:08.485088488+03:00 stdout F Tue Dec  2 16:09:08 UTC 2025 - Counter: 10
```
# Logs of log pod from k9s
```
│ Tue Dec  2 16:25:53 UTC 2025 - Counter: 0                                                                                                                                                                 │
│ Tue Dec  2 16:26:03 UTC 2025 - Counter: 1                                                                                                                                                                 │
│ Tue Dec  2 16:26:13 UTC 2025 - Counter: 2                                                                                                                                                                 │
│ Tue Dec  2 16:26:23 UTC 2025 - Counter: 3                                                                                                                                                                 │
│ Tue Dec  2 16:26:33 UTC 2025 - Counter: 4                                                                                                                                                                 │
│ Tue Dec  2 16:26:43 UTC 2025 - Counter: 5                                                                                                                                                                 │
│ Tue Dec  2 16:26:53 UTC 2025 - Counter: 6                                                                                                                                                                 │
│ Tue Dec  2 16:27:03 UTC 2025 - Counter: 7                                                                                                                                                                 │
│ Tue Dec  2 16:27:13 UTC 2025 - Counter: 8                                                                                                                                                                 │
│ Tue Dec  2 16:27:23 UTC 2025 - Counter: 9                                                                                                                                                                 │
│ Tue Dec  2 16:27:33 UTC 2025 - Counter: 10
```
# Logs from failing pod(fails after 20 echoes)
```
│ 2025-12-02 16:30:13 - Counter: 1                                                                                                                                                                          │
│ 2025-12-02 16:30:15 - Counter: 2                                                                                                                                                                          │
│ 2025-12-02 16:30:17 - Counter: 3                                                                                                                                                                          │
│ 2025-12-02 16:30:19 - Counter: 4                                                                                                                                                                          │
│ 2025-12-02 16:30:21 - Counter: 5                                                                                                                                                                          │
│ 2025-12-02 16:30:23 - Counter: 6                                                                                                                                                                          │
│ 2025-12-02 16:30:25 - Counter: 7                                                                                                                                                                          │
│ 2025-12-02 16:30:27 - Counter: 8                                                                                                                                                                          │
│ 2025-12-02 16:30:29 - Counter: 9                                                                                                                                                                          │
│ 2025-12-02 16:30:31 - Counter: 10                                                                                                                                                                         │
│ 2025-12-02 16:30:33 - Counter: 11                                                                                                                                                                         │
│ 2025-12-02 16:30:35 - Counter: 12                                                                                                                                                                         │
│ 2025-12-02 16:30:37 - Counter: 13                                                                                                                                                                         │
│ 2025-12-02 16:30:39 - Counter: 14                                                                                                                                                                         │
│ 2025-12-02 16:30:41 - Counter: 15                                                                                                                                                                         │
│ 2025-12-02 16:30:43 - Counter: 16                                                                                                                                                                         │
│ 2025-12-02 16:30:45 - Counter: 17                                                                                                                                                                         │
│ 2025-12-02 16:30:47 - Counter: 18                                                                                                                                                                         │
│ 2025-12-02 16:30:49 - Counter: 19                                                                                                                                                                         │
│ 2025-12-02 16:30:51 - Counter: 20                                                                                                                                                                         │
│ stream closed: EOF for logs/log-generator (log-generator) 
```
