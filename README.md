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
6. Wait for Avni to boot up. You can access Avni at http://localhost:8021 and keycloak at http://localhost:8080/keycloak.
7. Once you see the login page of Avni, run the following command.
    > docker compose exec -it avni_db psql -U openchs -f /etc/create_org_config.sql
8. Now you can login to Avni using Username: admin Password: Admin123