# Why Can't I Forward A Sql Cloud Proxy Port?

This repo exists only to store a minimal test case, it doesn't do anything except describe how I arrived at my confusion.

## Setup

Clone this repo, then run this, (you'll need to substitute your own GCP project and a cloud sql instance that already exists)

    docker build . -t portforwardexample \
        && docker run -it --rm -v "${PWD}/gcloud:/root/.config/gcloud" portforwardexample gcloud auth login \
        && docker run -it --rm -v "${PWD}/gcloud:/root/.config/gcloud" portforwardexample gcloud config set project myproject

It'll tell you how to get a gcp auth token and ask you to past it into the terminal, do what it says.

## Replicate the problem

Run the container

    docker run -p 13306:3306 \
                 -v "${PWD}/gcloud:/root/.config/gcloud" \
                 -d portforwardexample \
                 cloud_sql_proxy "-instances=myproject:us-west2:myinstance=tcp:3306

Connect via mysql

    mysql -h127.0.0.1 -P13306

It doesn't work for me, does it work for you?
