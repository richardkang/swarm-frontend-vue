#!/bin/sh

# Replace env vars in JavaScript files
echo "Replacing env vars in JS"
echo "HOST : $VUE_APP_BACKEND_HOST"
for file in /usr/share/nginx/html/*.js;
do
  echo "Processing $file ...";

  # Use the existing JS file as template
  if [ ! -f $file.tmpl.js ]; then
    cp $file $file.tmpl.js
  fi

  envsubst '$VUE_APP_BACKEND_HOST' < $file.tmpl.js > $file
done
echo "grep '$VUE_APP_BACKEND_HOST' /usr/share/nginx/html/*.js | wc -l"
grep "$VUE_APP_BACKEND_HOST" /usr/share/nginx/html/*.js | wc -l
echo "Starting Nginx"
nginx -g 'daemon off;'