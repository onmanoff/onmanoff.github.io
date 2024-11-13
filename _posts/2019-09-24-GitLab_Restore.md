---
layout: post
title:  "Gitlab 복구"
date:   2019-09-24 15:11
categories: etc
---

~~~ bash
  docker exec -it synology_gitlab bash
  docker exec -it synology_gitlab_postgresql bash
  bundle exec rake RAILS_ENV=production gitlab:backup:create
  git update-server-info 
  0 2 * * * cd /home/git/gitlab && PATH=/usr/local/bin:/usr/bin:/bin && bundle exec rake gitlab:backup:create RAILS_ENV=production
~~~