# Homework 05. Ansible start

## Homework Assignment 1: Setting Up Ansible

```shell
sudo apt install ansible
ansible --version
mkdir 05.Ansible.Start
cd 05.Ansible.Start
nano hello_ansible.yaml
ansible-playbook hello_ansible.yaml
```
### Playbook

```yaml
 name: Print message
  hosts: localhost
  tasks:
    - name: Print hello
      debug:
        msg: "Hello, Ansible!"
```

### Output

```shell
PLAY [Print message] *******************************************************************************************************************

TASK [Gathering Facts] *****************************************************************************************************************
Суббота 11 января 2025  11:46:31 +0300 (0:00:00.019)       0:00:00.019 ********
ok: [localhost]

TASK [Print hello] *********************************************************************************************************************
Суббота 11 января 2025  11:46:32 +0300 (0:00:01.015)       0:00:01.035 ********
ok: [localhost] => {
    "msg": "Hello, Ansible!"
}

PLAY RECAP *****************************************************************************************************************************
localhost                  : ok=2    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

Суббота 11 января 2025  11:46:32 +0300 (0:00:00.044)       0:00:01.079 ********
===============================================================================
Gathering Facts ----------------------------------------------------------------------------------------------------------------- 1.02s
Print hello --------------------------------------------------------------------------------------------------------------------- 0.04s
Playbook run took 0 days, 0 hours, 0 minutes, 1 seconds
```

## Homework Assignment 2: Managing Remote Hosts

```shell
nano inv.yaml
ssh-copy-id -p32510 jump_sa@178.124.206.53
ssh -p 32510 'jump_sa@178.124.206.53'
nano install_vim_playbook.yaml
ansible-playbook -i inv.yaml install_vim_playbook.yaml --ask-vault-pass
```

### Playbook
```yaml
- name: Install vim
  hosts: all_workers

  tasks:
    - name: Update pakages
      apt:
        update_cache: yes

    - name: Install Vim
      apt:
        name: vim
        state: present

    - name: Check version
      command: vim --version
      register: vim_version

    - name: Print version
      debug:
        msg: "Vim version: {{ vim_version.stdout }}"
```

### Output

```shell
PLAY [Install vim] *********************************************************************************************************************

TASK [Gathering Facts] *****************************************************************************************************************
Суббота 11 января 2025  12:06:55 +0300 (0:00:00.033)       0:00:00.033 ********
ok: [host7]
ok: [host8]

TASK [Update pakages] ******************************************************************************************************************
Суббота 11 января 2025  12:06:59 +0300 (0:00:04.522)       0:00:04.556 ********
changed: [host8]
changed: [host7]

TASK [Install Vim] *********************************************************************************************************************
Суббота 11 января 2025  12:07:08 +0300 (0:00:09.169)       0:00:13.726 ********
ok: [host8]
ok: [host7]

TASK [Check version] *******************************************************************************************************************
Суббота 11 января 2025  12:07:11 +0300 (0:00:02.515)       0:00:16.241 ********
changed: [host8]
changed: [host7]

TASK [Print version] *******************************************************************************************************************
Суббота 11 января 2025  12:07:12 +0300 (0:00:01.557)       0:00:17.799 ********
ok: [host7] => {
    "msg": "Vim version: VIM - Vi IMproved 8.2 (2019 Dec 12, compiled Nov 07 2024 13:17:21)\nIncluded patches: 1-16, 647, 17-579, 1969,580-647, 678, 648-1848, 4975, 5016, 5023, 5072, 2068, 1849-1854, 1857, 1855-1857, 1331, 1858, 1858-1859, 1873, 1860-1969, 1992, 1970-1992, 2010, 1993-2068, 2106, 2069-2106, 2108, 2107-2109, 2109-3995, 4563, 4646, 4774, 4895, 4899, 4901, 4919, 213, 1840, 1846-1847, 2110-2112, 2121\nModified by team+vim@tracker.debian.org\nCompiled by team+vim@tracker.debian.org\nHuge version without GUI.  Features included (+) or not (-):\n+acl               +file_in_path      +mouse_urxvt       -tag_any_white\n+arabic            +find_in_path      +mouse_xterm       -tcl\n+autocmd           +float             +multi_byte        +termguicolors\n+autochdir         +folding           +multi_lang        +terminal\n-autoservername    -footer            -mzscheme          +terminfo\n-balloon_eval      +fork()            +netbeans_intg     +termresponse\n+balloon_eval_term +gettext           +num64             +textobjects\n-browse            -hangul_input+packages          +textprop\n++builtin_terms    +iconv             +path_extra        +timers\n+byte_offset       +insert_expand     -perl              +title\n+channel           +ipv6              +persistent_undo   -toolbar\n+cindent           +job               +popupwin          +user_commands\n-clientserver      +jumplist          +postscript        +vartabs\n-clipboard         +keymap            +printer           +vertsplit\n+cmdline_compl     +lambda            +profile           +vim9script\n+cmdline_hist      +langmap -python            +viminfo\n+cmdline_info      +libcall           +python3           +virtualedit\n+comments          +linebreak   +quickfix          +visual\n+conceal           +lispindent        +reltime           +visualextra\n+cryptv            +listcmds    +rightleft         +vreplace\n+cscope            +localmap          -ruby              +wildignore\n+cursorbind        -lua      +scrollbind        +wildmenu\n+cursorshape       +menu              +signs             +windows\n+dialog_con        +mksession     +smartindent       +writebackup\n+diff              +modify_fname      +sodium            -X11\n+digraphs          +mouse   -sound             -xfontset\n-dnd               -mouseshape        +spell             -xim\n-ebcdic            +mouse_dec         +startuptime       -xpm\n+emacs_tags        +mouse_gpm         +statusline        -xsmp\n+eval              -mouse_jsbterm     -sun_workshop      -xterm_clipboard\n+ex_extra          +mouse_netterm     +syntax            -xterm_save\n+extra_search      +mouse_sgr         +tag_binary        \n-farsi             -mouse_sysmouse    -tag_old_static    \n   system vimrc file: \"$VIM/vimrc\"\n     user vimrc file: \"$HOME/.vimrc\"\n 2nd user vimrc file: \"~/.vim/vimrc\"\n      user exrc file: \"$HOME/.exrc\"\n       defaults file: \"$VIMRUNTIME/defaults.vim\"\n  fall-back for $VIM: \"/usr/share/vim\"\nCompilation: gcc -c -I. -Iproto -DHAVE_CONFIG_H -Wdate-time -g -O2 -ffile-prefix-map=/build/vim-Jt20oW/vim-8.2.3995=. -flto=auto -ffat-lto-objects -flto=auto -ffat-lto-objects -fstack-protector-strong -Wformat -Werror=format-security -D_REENTRANT -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=1 \nLinking: gcc -Wl,-Bsymbolic-functions -flto=auto -ffat-lto-objects -flto=auto -Wl,-z,relro -Wl,-z,now -Wl,--as-needed -o vim -lm -ltinfo -lselinux -lsodium -lacl -lattr -lgpm -L/usr/lib/python3.10/config-3.10-x86_64-linux-gnu -lpython3.10 -lcrypt -ldl -lm -lm "
}
ok: [host8] => {
    "msg": "Vim version: VIM - Vi IMproved 8.2 (2019 Dec 12, compiled Nov 07 2024 13:17:21)\nIncluded patches: 1-16, 647, 17-579, 1969,580-647, 678, 648-1848, 4975, 5016, 5023, 5072, 2068, 1849-1854, 1857, 1855-1857, 1331, 1858, 1858-1859, 1873, 1860-1969, 1992, 1970-1992, 2010, 1993-2068, 2106, 2069-2106, 2108, 2107-2109, 2109-3995, 4563, 4646, 4774, 4895, 4899, 4901, 4919, 213, 1840, 1846-1847, 2110-2112, 2121\nModified by team+vim@tracker.debian.org\nCompiled by team+vim@tracker.debian.org\nHuge version without GUI.  Features included (+) or not (-):\n+acl               +file_in_path      +mouse_urxvt       -tag_any_white\n+arabic            +find_in_path      +mouse_xterm       -tcl\n+autocmd           +float             +multi_byte        +termguicolors\n+autochdir         +folding           +multi_lang        +terminal\n-autoservername    -footer            -mzscheme          +terminfo\n-balloon_eval      +fork()            +netbeans_intg     +termresponse\n+balloon_eval_term +gettext           +num64             +textobjects\n-browse            -hangul_input+packages          +textprop\n++builtin_terms    +iconv             +path_extra        +timers\n+byte_offset       +insert_expand     -perl              +title\n+channel           +ipv6              +persistent_undo   -toolbar\n+cindent           +job               +popupwin          +user_commands\n-clientserver      +jumplist          +postscript        +vartabs\n-clipboard         +keymap            +printer           +vertsplit\n+cmdline_compl     +lambda            +profile           +vim9script\n+cmdline_hist      +langmap -python            +viminfo\n+cmdline_info      +libcall           +python3           +virtualedit\n+comments          +linebreak   +quickfix          +visual\n+conceal           +lispindent        +reltime           +visualextra\n+cryptv            +listcmds    +rightleft         +vreplace\n+cscope            +localmap          -ruby              +wildignore\n+cursorbind        -lua      +scrollbind        +wildmenu\n+cursorshape       +menu              +signs             +windows\n+dialog_con        +mksession     +smartindent       +writebackup\n+diff              +modify_fname      +sodium            -X11\n+digraphs          +mouse   -sound             -xfontset\n-dnd               -mouseshape        +spell             -xim\n-ebcdic            +mouse_dec         +startuptime       -xpm\n+emacs_tags        +mouse_gpm         +statusline        -xsmp\n+eval              -mouse_jsbterm     -sun_workshop      -xterm_clipboard\n+ex_extra          +mouse_netterm     +syntax            -xterm_save\n+extra_search      +mouse_sgr         +tag_binary        \n-farsi             -mouse_sysmouse    -tag_old_static    \n   system vimrc file: \"$VIM/vimrc\"\n     user vimrc file: \"$HOME/.vimrc\"\n 2nd user vimrc file: \"~/.vim/vimrc\"\n      user exrc file: \"$HOME/.exrc\"\n       defaults file: \"$VIMRUNTIME/defaults.vim\"\n  fall-back for $VIM: \"/usr/share/vim\"\nCompilation: gcc -c -I. -Iproto -DHAVE_CONFIG_H -Wdate-time -g -O2 -ffile-prefix-map=/build/vim-Jt20oW/vim-8.2.3995=. -flto=auto -ffat-lto-objects -flto=auto -ffat-lto-objects -fstack-protector-strong -Wformat -Werror=format-security -D_REENTRANT -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=1 \nLinking: gcc -Wl,-Bsymbolic-functions -flto=auto -ffat-lto-objects -flto=auto -Wl,-z,relro -Wl,-z,now -Wl,--as-needed -o vim -lm -ltinfo -lselinux -lsodium -lacl -lattr -lgpm -L/usr/lib/python3.10/config-3.10-x86_64-linux-gnu -lpython3.10 -lcrypt -ldl -lm -lm "
}

PLAY RECAP *****************************************************************************************************************************
host7                      : ok=5    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
host8                      : ok=5    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

Суббота 11 января 2025  12:07:12 +0300 (0:00:00.160)       0:00:17.960 ********
===============================================================================
Update pakages ------------------------------------------------------------------------------------------------------------------ 9.17s
Gathering Facts ----------------------------------------------------------------------------------------------------------------- 4.52s
Install Vim --------------------------------------------------------------------------------------------------------------------- 2.52s
Check version ------------------------------------------------------------------------------------------------------------------- 1.56s
Print version ------------------------------------------------------------------------------------------------------------------- 0.16s
```

## Homework Assignment 3: Managing Users and Groups

### Playbook

```yaml
- name: Managing Users and Groups
  hosts: all_workers
  vars:
    username: "{{ new_username }}"
    groupname: "{{ new_groupname }}"
    password: "{{ new_password | password_hash('sha512') }}"

  tasks:
    - name: Create group
      ansible.builtin.group:
        name: "{{ groupname }}"
        state: present

    - name: Create user
      ansible.builtin.user:
        name: "{{ username }}"
        password: "{{ password }}"
        state: present
        groups: "{{ groupname }}"
        append: yes

    - name: Print user information
      debug:
        msg: "User {{ username }} created and add to group {{ groupname }}."
```

### Output

```shell
ansible-playbook -i inv.yaml user_manage_playbook.yaml -e "new_username=newuser new_groupname=newgroup new_password=securepassword" --ask-vault-pass
Vault password:

PLAY [Managing Users and Groups] *******************************************************************************************************

TASK [Gathering Facts] *****************************************************************************************************************
Суббота 11 января 2025  16:16:46 +0300 (0:00:00.082)       0:00:00.082 ********
ok: [host7]
ok: [host8]

TASK [Create group] ********************************************************************************************************************
Суббота 11 января 2025  16:16:51 +0300 (0:00:04.811)       0:00:04.894 ********
changed: [host8]
changed: [host7]

TASK [Create user] *********************************************************************************************************************
Суббота 11 января 2025  16:16:53 +0300 (0:00:01.772)       0:00:06.666 ********
changed: [host7]
changed: [host8]

TASK [Print user information] **********************************************************************************************************
Суббота 11 января 2025  16:16:56 +0300 (0:00:02.979)       0:00:09.645 ********
ok: [host7] => {
    "msg": "User newuser created and add to group newgroup."
}
ok: [host8] => {
    "msg": "User newuser created and add to group newgroup."
}

PLAY RECAP *****************************************************************************************************************************
host7                      : ok=4    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
host8                      : ok=4    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

Суббота 11 января 2025  16:16:56 +0300 (0:00:00.397)       0:00:10.042 ********
===============================================================================
Gathering Facts ----------------------------------------------------------------------------------------------------------------- 4.81s
Create user --------------------------------------------------------------------------------------------------------------------- 2.98s
Create group -------------------------------------------------------------------------------------------------------------------- 1.77s
Print user information ---------------------------------------------------------------------------------------------------------- 0.40s
Playbook run took 0 days, 0 hours, 0 minutes, 10 seconds
```
