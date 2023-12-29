#!/bin/sh

# Exit immediately if any of the following command exits 
# with a non-zero status
set -e

# https://patorjk.com/software/taag/#p=display&f=Graffiti&t=Type%20Something%20
cat << "EOF"


$$$$$$$\            $$\ $$\   $$\                         
$$  __$$\           $$ |$$ |  $$ |                        
$$ |  $$ | $$$$$$\  $$ |$$ |  $$ | $$$$$$\  $$$$$$\$$$$\  
$$$$$$$\ | \____$$\ $$ |$$$$$$$$ |$$  __$$\ $$  _$$  _$$\ 
$$  __$$\  $$$$$$$ |$$ |$$  __$$ |$$ /  $$ |$$ / $$ / $$ |
$$ |  $$ |$$  __$$ |$$ |$$ |  $$ |$$ |  $$ |$$ | $$ | $$ |
$$$$$$$  |\$$$$$$$ |$$ |$$ |  $$ |\$$$$$$  |$$ | $$ | $$ |
\_______/  \_______|\__|\__|  \__| \______/ \__| \__| \__|
                                                          

EOF

# Move nginx conf
if [ "$USE_HTTPS" = true ]; then
    mv /confs/local_https.conf /etc/nginx/conf.d/default.conf
else
    mv /confs/local_http.conf /etc/nginx/conf.d/default.conf
fi

exec /docker-entrypoint.sh nginx -g "daemon off;" "$@"
