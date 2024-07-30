FROM ubuntu:latest as stage1
RUN apt-get update && apt-get install git -y
RUN git clone https://github.com/fatimatabassum05/java-tomcat-maven-example.git
WORKDIR /app

FROM nginx:latest
COPY --from=stage1 /app/nginx.conf /etc/nginx/nginx.conf
EXPOSE 80
CMD ["nginx", "-g", "deamon off;"]
