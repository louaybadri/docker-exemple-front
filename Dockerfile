# Use an official lightweight Nginx image as a base image
FROM nginx:alpine

# Set the working directory inside the container
WORKDIR /usr/share/nginx/html

# Clone the repository and pull the HTML file
RUN apk add --no-cache git 
RUN cd /usr/share/nginx/html
RUN git clone https://github.com/louaybadri/docker-exemple-front.git  
RUN cp /usr/share/nginx/html/docker-exemple-front/index.html ./index.html

# Expose port 80 to the host so that the container can receive traffic
EXPOSE 80

# Start Nginx when the container has provisioned
CMD ["nginx", "-g", "daemon off;"]