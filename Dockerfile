FROM node:9

RUN curl -o /tmp/aws-env-linux-amd64 -L https://github.com/datacamp/aws-env/releases/download/v0.1-session-fix/aws-env-linux-amd64 && \
  chmod +x /tmp/aws-env-linux-amd64 && \
  mv /tmp/aws-env-linux-amd64 /bin/aws-env

# Create sqsd directory
WORKDIR /
RUN mkdir /sqsd
WORKDIR /sqsd

# Copy sqsd source including
COPY ./ /sqsd

# Install dependencies
RUN npm install

# Run sqsd
CMD ["node", "run-cli.js"]

