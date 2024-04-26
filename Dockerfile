# FROM rabbitmq:3.8-management
FROM rabbitmq:3.12-management

# Copy custom rabbitmq.conf file to the container
COPY rabbitmq.conf /etc/rabbitmq/

# Enable necessary plugins (e.g., Management Plugin)
RUN rabbitmq-plugins enable --offline rabbitmq_management rabbitmq_management_agent rabbitmq_peer_discovery_common rabbitmq_mqtt rabbitmq_federation_management rabbitmq_stomp

# rabbitmq_peer_discovery_classic_config

# Set custom user and password
ENV RABBITMQ_DEFAULT_USER=admin
ENV RABBITMQ_DEFAULT_PASS=Admin

# Auto restart RabbitMQ
ENV RABBITMQ_SERVER_ADDITIONAL_ERL_ARGS="-rabbit autoheal"

# Expose ports for RabbitMQ (5672, 4369) and RabbitMQ Management Plugin (15672)
EXPOSE 5672 4369 15672

# CMD instruction to start RabbitMQ server
CMD ["rabbitmq-server"]
