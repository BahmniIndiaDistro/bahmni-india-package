# bahmni-india-package

This repository consist of bahmni ABDM dockerization related scripts and files.

To build a image, you need to export `BAHMNI_VERSION` and `GITHUB_RUN_NUMBER`

## [Steps to follow for openmrs initializer to load masterdata - For Development Purpose ](https://github.com/Bahmni/clinic-config#steps-to-follow-for-openmrs-initializer-to-load-masterdata---for-development-purpose-)

## Generating architecture diagram from docker-compose
To generate architecture diagram from docker-compose, run `sh generate_architecture_diagram.sh` command.
While running this command, arguments can be passed to generate customized diagram. There are three options available:
1. --no-networks
2. --no-ports
3. --no-volumes

Example:
```shell
sh generate_architecture_diagram.sh --no-volumes --no-networks
```

The diagram will be generated in the root directory and if there is any existing diagram it will replace it with the newly generated diagram.




# Running Avni
1. Clone this repository into your local.
    >git clone https://github.com/Bahmni-HWC/bahmni-india-package.git
2. Checkout to `avni-infra` branch.
    > git checkout avni-infra
3. Find the local IP address of your machine using `ifconfig` command. You will something like `inet 192.168.1.101 netmask 0xffffff00 broadcast 192.168.1.255` in the command output. Copy the inet IP address.
4. Update the value in the .env file for the `HOSTNAME` variable.
5. Now start Avni and keycloak by running the following command
    > docker compose --profile keycloak --profile avni up -d
6. Keycloak will be accessible at http://<<machine_ip>>:8083/keycloak. The default login credentials will be keycloakadmin/keycloak@dmin
7. Wait for Avni to boot up. You can access Avni at http://localhost:8021 or http://<<machine_ip>>:8021 
8. Once you see the login page of Avni, run the following command.
    > docker compose exec -it avni_db psql -U openchs -f /etc/create_org_config.sql
9. Now you can login to Avni using Username: admin Password: Admin123


## Setting Up MinIO
Note: The following steps are required only if you want to do some file uploads within Avni
1. Start MinIo by running the following command
    > docker compose --profile minio up -d
2. Add an entry in `/etc/hosts` file. Before this find the machine IP as mentioned in step 3 above.
    
    Open File in Editor: `sudo nano /etc/hosts`
    
    Add below entry to the last of file. Replace Machine_IP with local network IP address of machine.
    
    {Machine_IP} minio.avni.local
3. Now from browser navigate to http://minio.avni.local:9000 and login using default credentials root/root@123
4. Create a bucket from the MinIO console named `avni`. If you use a different file name, make sure to update AVNI_MINIO_BUCKET_NAME variable in .env file.
5. Now create an Access Key from MinIO console. On creation copy the access key and secret acess key and replace the `AVNI_MINIO_ACCESS_KEY` and `AVNI_MINIO_SECRET_ACCESS_KEY` variables in the .env file.
6. After updating recretate Avni containers by running
    > docker compose --profile avni --profile minio up -d
7. Now when an image is uploaded from a form, you should see that data in the bucket in MinIO console.

    