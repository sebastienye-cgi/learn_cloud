export NOTEBOOK_NAME=<NOM_DU_NOTEBOOK>

gcloud notebooks instances create $NOTEBOOK_NAME \
--location=europe-west1-b \
--vm-image-project=deeplearning-platform-release \
--vm-image-family=pytorch-2-0-gpu-notebooks-debian-11-py310 \
--machine-type=n1-standard-1 \
--metadata=idle-timeout-seconds=3600 \
--boot-disk-size=80 \
--boot-disk-type=PD_STANDARD \
--data-disk-size=20 \
--data-disk-type=PD_SSD \
--install-gpu-driver \
--post-startup-script=gs://btel-data-lab-iafactory-datalab/install_tdodbc.sh \
--no-public-ip \
--network=projects/infra-gcp-prod-shared-vpc/global/networks/vpc-prod \
--subnet=projects/infra-gcp-prod-shared-vpc/regions/europe-west1/subnetworks/subnet-prod-eu-west-1 


gcloud compute instances add-tags $NOTEBOOK_NAME --zone europe-west1-b --tags=data-compute-vertex
gcloud compute instances stop $NOTEBOOK_NAME --zone europe-west1-b
gcloud notebooks instances start $NOTEBOOK_NAME --location europe-west1-b
