FROM nginx:latest
COPY /home/ubuntu/nginx.conf /etc/nginx/nginx.conf
EXPOSE 80
CMD ["nginx", "-g", "deamon off;"]
