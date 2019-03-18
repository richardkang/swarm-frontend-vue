FROM nginx
ENV VUE_APP_BACKEND_HOST=http://localhost:4000
COPY ./vue-dist /usr/share/nginx/html
COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
CMD ["/entrypoint.sh"]