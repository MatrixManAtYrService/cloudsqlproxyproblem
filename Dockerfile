FROM google/cloud-sdk:272.0.0

RUN apt-get update && apt-get install -y wget mysql-client

# google cloud sql proxy
RUN mkdir /tools \
        && cd /tools \
        && wget https://dl.google.com/cloudsql/cloud_sql_proxy.linux.amd64 -O cloud_sql_proxy \
        && chmod +x /tools/cloud_sql_proxy
ENV PATH=/tools:${PATH}

RUN cloud_sql_proxy --version | grep 'Cloud SQL Proxy'
