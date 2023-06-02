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

### It is recommended to update docker and docker compose to the latest version. Atleast update to a minimum of Docker Compose >2.10.x

1. Clone this repository into your local.
    >git clone https://github.com/Bahmni-HWC/bahmni-india-package.git

2. Find the local IP address of your machine using `ifconfig` command. You will something like `inet 192.168.1.101 netmask 0xffffff00 broadcast 192.168.1.255` in the command output. Copy the inet IP address.
3. Update the value in the .env file for the `HOSTNAME` variable.
4. Now start Avni and keycloak by running the following command
    > docker compose --profile keycloak --profile avni up -d
5. Keycloak will be accessible at http://<<machine_ip>>:8083/keycloak. The default login credentials will be keycloakadmin/keycloak@dmin
6. Wait for Avni to boot up. You can access Avni at http://localhost:8021 or http://<<machine_ip>>:8021 

7. Now you can login to Avni superadmin using Username: admin Password: Admin123

8. Also from the database backup, a default organisation named `Bahmni` will also be created with some metadata. The login credentials for the same is admin@bahmni/Admin123. This can also be used to login from mobile app.

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


# Setting up Avni Bahmni Integration Service:
Avni integration services can be started by running the following command.
    
> docker compose --profile avni-integration up -d

Once the application boots, the integration UI can be accessed at http://localhost:6013/avni-int-admin-app/index.html#/login. Credentials: integration@example.com/Admin123

Note: At times when the session expires, the application will not properly redirect to login page. So manually change the URL to http://localhost:6013/avni-int-admin-app/index.html#/login and login again.

# Setting up IntelliJ Idea debugger for Avni and Avni Integration Service
Both Avni Server and Avni Integration server has got DEBUG_OPTS variable which opens a Debug port by default to enable debugging from IDE. Avni Server debug port is exposed on 8030 and avni-integration debug port is exposed on 8031. 

1. Clone the repository which you want to debug and open it in IntelliJ.
2. Navigate to Run -->  Edit Configurations. In the pop up that opens Click on `+` and create a `Remote JVM Debug` Connection.
3. For avni-server repo enter port as 8030 and for avni-intergration repo enter port as 8031 and save the config.
4. Now you can set debug points in code and debug.

# Devlopment Setup 
### Building Avni Integration Service
1. Install Java 17
2. Run `make build-server`. This will build the source code and produce a JAR.
3. Once the build is successful you will see JAR file in integrator/build/libs/ folder of the repo.
4. Now find the container id of the avni-integration service by runnning `docker ps` and copy the ID.
5. Now from the integration-service directory, run the following command to copy that JAR into docker container.
     `docker cp <container_id>:/opt/integrator/integrator.jar integrator/build/libs/integrator-0.0.2-SNAPSHOT.jar`
6. Once copied restart container by running `docker compose restart avni-integration` from bahmni-india-package directory.

### Building Avni Service
1. Install Java 8
2. Run `make build_server`. This will build the source code and produce a JAR.
3. Once the build is successful you will see JAR file in avni-server-api/build/libs/ folder of the repo.
4. Now find the container id of the avni service by runnning `docker ps` and copy the ID.
5. Now from the integration-service directory, run the following command to copy that JAR into docker container.
     `docker cp <container_id>:/opt/openchs/avni-server.jar avni-server-api/build/libs/avni-server-0.0.1-SNAPSHOT.jar`
6. Once copied restart container by running `docker compose restart avni` from bahmni-india-package directory.

# References:

1. Avni Bahmni Integration Metadata: https://avni.readme.io/docs/avni-bahmni-integration-specific
2. Avni Component Architecture: https://avni.readme.io/docs/component-architecture
3. Avni Docker Architecture: <img src="./Avni Docker Architecture.png"/>    