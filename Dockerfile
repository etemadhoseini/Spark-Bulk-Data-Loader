# Base image for Spark
FROM bitnami/spark:3.4.3

# Set environment variables
ENV SPARK_HOME=/opt/bitnami/spark
ENV PATH=$PATH:$SPARK_HOME/bin

# Install pip and required Python libraries
USER root
RUN apt-get update && \
    apt-get install -y python3-pip && \
    pip3 install pyspark==3.4.3 pytest chispa nutter Faker py4j && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean

# Set working directory for Spark apps
WORKDIR /opt/spark-apps

# Expose web UIs for Spark master and worker
EXPOSE 8080 7077

# Set back to default user
USER 1001

# Start the container
CMD ["/opt/bitnami/scripts/spark/entrypoint.sh"]
