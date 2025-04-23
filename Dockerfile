# Use Node.js official image
FROM node:14

# Create app directory
WORKDIR /usr/src/app

# Copy app code
COPY app.js .

# Expose port and run app
EXPOSE 3000
CMD [ "node", "app.js" ]
