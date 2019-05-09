# cms-ars-3.1-high-aws-rds-microsoft-sql-server-2014-instance-stig-overlay

InSpec profile overlay to validate the secure configuration of AWS RDS Microsoft SQL Server 2014 Instance against [DISA's](https://iase.disa.mil/stigs/Pages/index.aspx) AWS RDS Microsoft SQL Server 2014 Instance STIG Version 1 Release 9 tailored for [CMS ARS 3.1](https://www.cms.gov/Research-Statistics-Data-and-Systems/CMS-Information-Technology/InformationSecurity/Info-Security-Library-Items/ARS-31-Publication.html) for CMS systems categories as Moderate.

## Getting Started  
It is intended and recommended that InSpec and this profile overlay be run from a __"runner"__ host (such as a DevOps orchestration server, an administrative management system, or a developer's workstation/laptop) against the target remotely over __ssh__.

__For the best security of the runner, always install on the runner the _latest version_ of InSpec and supporting Ruby language components.__ 

Latest versions and installation options are available at the [InSpec](http://inspec.io/) site.

The following attributes must be configured in an attributes file for the profile to run correctly. More information about InSpec attributes can be found in the [InSpec Profile Documentation](https://www.inspec.io/docs/reference/profiles/).
 
```
# Username for MSSQL DB Server
user: null

# Password for MSSQL DB Server
password: null

# Hostname for MSSQL DB Server
host: 'hostname'

# Instance name of the MSSQL DB Server
instance: 'MSSQL2014'

# Port of MSSQL DB Server
port: 1433

# Name of the specific database being evaluated within the MSSQL server
db_name: 'master'

# description: 'Set to true If SQL Server Trace is in use for audit purposes'
server_trace_implemented: true

#   description: 'Set to true If SQL Server Audit is in use for audit purposes'
server_audit_implemented: true

# description: 'Set to true if SQL Server Reporting Services is in use'
  sql_server_reporting_services_used: false

# description: 'Set to true if SQL Server data tools is required'
sql_server_data_tools_required: false

# description: 'Set to true if SQL Server Integration Services is in use'
sql_server_integration_services_used: false

# description: 'Set to true if SQL Server analysis Services is in use'
sql_server_analysis_services_used: false

# description: 'Set to true if SQL Server Distributed Replay Client is in use'
sql_server_distributed_replay_client_used: false

# description: 'Set to true if SQL Server Distributed Replay Controller is in use'
sql_server_distributed_replay_controller_used: false

# description: 'Set to true if SQL Server full-text search is in use'
sql_server_full_text_search_used: false

# description: 'Set to true if master data services is in use'
master_data_services_used: false

# description: 'Set to true if data quality client is in use'
data_quality_client_used: false

# description: 'Set to true if data quality services is in use'
data_quality_services_used: false

# description: 'Set to true if data quality services is in use'
data_quality_services_used: false

# description: 'Set to true if client tools sdk is in use'
client_tools_sdk_used: false

# description: 'Set to true if sql server management tools is in use'
sql_mgmt_tools_used: false

# description: 'Set to true if xp_cmdhsell is required'
sql_mgmt_tools_used: false

# description: 'instance name MSSQL DB Server'
server_instance: 'WIN-FC4ANINFUFP'

#description: 'List of users with permissions - ALTER TRACE, CREATE TRACE EVENT NOTIFICATION'
approved_audit_maintainers: []

# description: 'List of users with audit permissions - ALTER ANY SERVER AUDIT, CONTROL SERVER, ALTER ANY DATABASE, CREATE ANY DATABASE'
allowed_audit_permissions: []

# description: 'List of user with permissions -  ALTER ANY SERVER AUDIT, ALTER ANYDATABASE AUDIT, ALTER TRACE; or EXECUTE'
allowed_sql_alter_permissions: []

# description: 'List of approved users with access to SQL Server Audits'
approved_users_sql_audits: []

# description: 'List of sql server users with permissions - alter, create, control'
approved_users_server: []

# description: 'List of sql database users with permissions - alter, create, control'
approved_users_database: []

# description: 'List of sql components installed'
sql_components: []

#  description: 'List of authorized network protocols for the SQL server'
authorized_protocols: ["Shared Memory",
                       "TCP/IP"]

# description: 'List of authorized network ports for the SQL server'
authorized_ports: ["1433"]      

# description: 'List of authorized network port names for the SQL server'
authorized_ports_name: ["TcpPort",
                        "TcpDynamicPorts"]  

# description: 'List of authorized users for the SQL server'
authorized_sql_users: []

# description: 'List of users allowed to execute privileged functions - create, alter, delete'
allowed_users_priv_functions: []

# description: 'List of allowed server permissions'
allowed_server_permissions: []

# description: 'List of allowed database permissions'
allowed_database_permissions: []

# description: 'List of Databases that require encryption'
encrypted_databases: []

# description: 'Set to true if data at rest encryption is required'
data_at_rest_encryption_required: false

# description: 'Set to true if full disk encryption is in place'
full_disk_encryption_inplace: false

# description: 'List of user allowed to execute privileged functions'
allowed_users: []

# description: 'Set to true xp cmdshell is required'
is_xp_cmdshell_required: false

# description: 'List of accounts managed by the sql server'
sql_managed_accounts: []

# description: 'Set to true if filestream is required'
filestream_required: false

# description: 'Set to true if filestream transact access is required'
filestream_transact_access_only_required: false
```
## Note

It is assumed that the password complexity plugin: validate_password.so is installed, otherwise control 7.6 will fail.

## Running This Overlay
When the __"runner"__ host uses this profile overlay for the first time, follow these steps: 

```
mkdir profiles
cd profiles
git clone https://github.cms.gov/ispg/cms-ars-3.1-high-aws-rds-microsoft-sql-server-2014-instance-stig-overlay.git
git clone https://github.com/mitre/aws-rds-microsoft-sql-server-2014-instance-stig-baseline.git
cd cms-ars-3.1-high-aws-rds-microsoft-sql-server-2014-instance-stig-overlay
bundle install
cd ..
inspec exec cms-ars-3.1-high-aws-rds-microsoft-sql-server-2014-instance-stig-overlay --attrs=<path_to_your_attributes_file/name_of_your_attributes_file.yml> --target=ssh://<your_target_host_name_or_ip_address> --user=<target_account_with_administrative_privileges> --password=<password_for_target_account> --reporter=cli json:<path_to_your_output_file/name_of_your_output_file.json> 
```

For every successive run, follow these steps to always have the latest version of this overlay and dependent profiles:

```
cd profiles/aws-rds-microsoft-sql-server-2014-instance-stig-baseline
git pull
cd ../cms-ars-3.1-high-aws-rds-microsoft-sql-server-2014-instance-stig-overlay
git pull
bundle install
cd ..
inspec exec cms-ars-3.1-high-aws-rds-microsoft-sql-server-2014-instance-stig-overlay --attrs=<path_to_your_attributes_file/name_of_your_attributes_file.yml> --target=ssh://<your_target_host_name_or_ip_address> --user=<target_account_with_administrative_privileges> --password=<password_for_target_account> --reporter=cli json:<path_to_your_output_file/name_of_your_output_file.json> 
```

## Viewing the JSON Results

The JSON results output file can be loaded into __[heimdall-lite](https://mitre.github.io/heimdall-lite/)__ for a user-interactive, graphical view of the InSpec results. 

The JSON InSpec results file may also be loaded into a __[full heimdall server](https://github.com/mitre/heimdall)__, allowing for additional functionality such as to store and compare multiple profile runs.

## Authors
* Eugene Aronne
* Danny Haynes

## Special Thanks
* Alicia Sturtevant

## Getting Help
To report a bug or feature request, please open an [issue](https://github.cms.gov/ispg/cms-ars-3.1-moderate-aws-rds-oracle-mysql-ee-5.7-cis-overlay/issues/new).

## License
This is licensed under the [Apache 2.0](https://www.apache.org/licenses/LICENSE-2.0) license. 

### NOTICE  

This software was produced for the U. S. Government under Contract Number HHSM-500-2012-00008I, and is subject to Federal Acquisition Regulation Clause 52.227-14, Rights in Data-General.  

No other use other than that granted to the U. S. Government, or to those acting on behalf of the U. S. Government under that Clause is authorized without the express written permission of The MITRE Corporation.

For further information, please contact The MITRE Corporation, Contracts Management Office, 7515 Colshire Drive, McLean, VA  22102-7539, (703) 983-6000.

