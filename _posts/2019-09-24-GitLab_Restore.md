---
layout: post
title:  "Gitlab 복구"
date:   2019-09-24 15:11
categories: etc
---
<ul>
  <li>docker exec -it synology_gitlab bash </li>
  <li>docker exec -it synology_gitlab_postgresql bash</li>
  <li>bundle exec rake RAILS_ENV=production gitlab:backup:create</li>
  <li>git update-server-info </li>
  <li>0 2 * * * cd /home/git/gitlab && PATH=/usr/local/bin:/usr/bin:/bin bundle exec rake gitlab:backup:create RAILS_ENV=production</li>
<ul>  
