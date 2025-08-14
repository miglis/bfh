# How to

```
$ gcloud auth configure-docker
$ gcloud config set project cas-cld-terraform-pcws
$ docker pull ghcr.io/samuelbucheliz/bfh-pcws:master
$ docker tag ghcr.io/samuelbucheliz/bfh-pcws:master gcr.io/cas-cld-terraform-pcws/pcws
$ docker push gcr.io/cas-cld-terraform-pcws/pcws
$ gcloud services enable run.googleapis.com cloudbuild.googleapis.com sql-component.googleapis.com sqladmin.googleapis.com cloudresourcemanager.googleapis.com
```

## Reaching the webserive

Append `/swagger-ui/index.html` to the given URL.
