```bash
2157  cd /tmp/sa.it-academy.by/demo
 2158  git pull
 2159  cls
 2160  ls
 2161  mkdir 06.Ansible
 2162  cd 06.Ansible
 2163  vim inv.yaml
 2164  vim /etc/ansible/hosts
 2165  vim inv.yaml
 2166  ansible-inventory --graph
 2167  ansible-inventory --graph -i inv.yaml
 2168  ansible-inventory --host host1 -i inv.yaml
 2169  vim inv.yaml
 2170  ansible-inventory --graph -i inv.yaml
 2171  vim inv.yaml
 2172  ansible-inventory --host host1 -i inv.yaml
 2173  vim inv.yaml
 2174  ansible-inventory --host host1 -i inv.yaml
 2175  vim inv.yaml
 2176  ansible-inventory --host host1 -i inv.yaml
 2177  vim inv.yaml
 2178  ansible-inventory --graph -i inv.yaml
 2179  vim inv.yaml
 2180  ls
 2181  clear
 2182  ls -l
 2183  vim inv.yaml
 2184  ansible -m ping infra -i inv.yaml
 2185  ansible --varsion
 2186  ansible --version
 2187  vim play.yaml
 2188  ansible-playbook play.yaml -i inv.yaml -e "group=infra"
 2189  vim play.yaml
 2190  ansible-playbook play.yaml -i inv.yaml -e "group=infra" -u vagrant --ask-pass
 2191  vim play.yaml
 2192  ansible-playbook play.yaml -i inv.yaml -e "group=infra" -u vagrant --ask-pass
 2193  ansible-playbook play.yaml -i inv.yaml -e "group=infra"
 2194  vim inv.yaml
 2195  ansible-playbook play.yaml -i inv.yaml -e "group=infra"
 2196  vim inv.yaml
 2197  vim play.yaml
 2198  vim ansible.cfg
 2199  ansible-playbook play.yaml -i inv.yaml -e "group=infra"
 2200  vim play.yaml
 2201  ansible-playbook play.yaml -i inv.yaml -e "group=infra"
 2202  vim play.yaml
 2203  ansible-playbook play.yaml -i inv.yaml -e "group=infra"
 2204  vim play.yaml
 2205  ansible-playbook play.yaml -i inv.yaml -e "group=infra"
 2206  vim play.yaml
 2207  ansible-playbook play.yaml -i inv.yaml -e "group=infra"
 2208  vim play.yaml
 2209  ansible-playbook play.yaml -i inv.yaml -e "group=infra"
 2210  vim play.yaml
 2211  ansible-playbook play.yaml -i inv.yaml -e "group=infra"
 2212  ansible-playbook play.yaml 
 2213  ansible-playbook play.yaml -e "ec"
 2214  ansible-playbook play.yaml -e "group=ec"
 2215  ansible-playbook play.yaml -e "group=ec" -u root --ask-pass
 2216  vim play.yaml
 2217  ansible-playbook play.yaml -i inv.yaml -e "group=infra" -t all_tests
 2218  ansible-playbook play.yaml -i inv.yaml -e "group=infra" -t all_test
 2219  vim play.yaml
 2220  ansible-playbook play.yaml -i inv.yaml -e "group=infra" -t vars
 2221  ansible-playbook play.yaml -i inv.yaml -e "group=infra" --skip-pags vars
 2222  ansible-playbook play.yaml -i inv.yaml -e "group=infra" --skip-tags vars
 2223  ls
 2224  vim add_user.yaml
 2225  ansible-playbook add_user.yaml -i inv.yaml -e "user_to_add=test"
 2226  vim add_user.yaml
 2227  ansible-playbook add_user.yaml -i inv.yaml -e "user_to_add=test"
 2228  vim add_user.yaml
 2229  ansible-playbook add_user.yaml -i inv.yaml -e "user_to_add=test"
 2230  vim add_user.yaml
 2231  ansible-playbook add_user.yaml -i inv.yaml -e "user_to_add=test"
 2232  vim ansible.cfg
 2233  ansible-playbook add_user.yaml -i inv.yaml -e "user_to_add=test"
 2234  vim ansible.cfg
 2235  ansible-playbook add_user.yaml -i inv.yaml -e "user_to_add=test"
 2236  vim add_user.yaml
 2237  git add --all
 2238  git commit -m "06.Ansible"
 2239  git push


```
