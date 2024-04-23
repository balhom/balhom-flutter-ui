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

# Directory containing the JavaScript files
JS_FILES_DIR="/usr/share/nginx/html"

RUNTIME_VARS="BALHOM_API_URL CURRENCY_CONVERSION_API_URL CURRENCY_CONVERSION_API_KEY"

# Loop through each .js file in the directory
find "$JS_FILES_DIR" -name "*.js" | while read -r JS_FILE; do
  for key in $RUNTIME_VARS; do
    value=$(eval echo \$$key)
    # Replace placeholders with environment variable values
    sed -i "s|__ENV_${key}|${value}|g" "$JS_FILE"
  done
done

exec /docker-entrypoint.sh nginx -g "daemon off;" "$@"
