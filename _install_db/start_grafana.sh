docker run -d \
-p 80:3000 \
--user=1000:1000 \
--name=grafana \
--restart=unless-stopped \
-v=`pwd`/grafana-vol:/var/lib/grafana \
-e "GF_USERS_DEFAULT_THEME=light" \
-e "GF_AUTH_ANONYMOUS_ENABLED=true" \
-e "GF_AUTH_ROLE=viewer" \
-e "GF_DASHBOARDS_MIN_REFRESH_INTERVAL=1s" \
grafana/grafana-oss

#
#-e "GF_PLUGINS_ALLOW_LOADING_UNSIGNED_PLUGINS=alexandra-trackmap-pannel" \