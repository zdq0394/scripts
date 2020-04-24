#! /bin/bash
mkdir -p /data/gitlab/config
mkdir -p /data/gitlab/logs
mkdir -p /data/gitlab/data

docker run --detach \
  --publish 5443:443 \
  --publish 82:82 \
  --publish 2222:22 \
  --name gitlab \
  --volume /data/gitlab/config:/etc/gitlab \
  --volume /data/gitlab/logs:/var/log/gitlab \
  --volume /data/gitlab/data:/var/opt/gitlab \
  gitlab/gitlab-ce:11.11.3-ce.0

############################################################
# vim /data/gitlab/config/gitlab.rb
 
# // 修改如下语句
# external_url 'http://192.168.2.102:82'
 
# # https需要下面这句
# # nginx['redirect_http_to_https_port'] = 82
 
# nginx['listen_port'] = 82
 
# # 配置2222端口
# gitlab_rails['gitlab_shell_ssh_port'] = 2222
 