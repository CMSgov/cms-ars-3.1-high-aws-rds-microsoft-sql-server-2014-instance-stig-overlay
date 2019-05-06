# cms-ars-3.1-moderate-aws-rds-microsoft-sql-server-2014-database-stig-overlay

InSpec profile overlay to validate the secure configuration of AWS RDS Microsoft SQL Server 2014 Database against [DISA's](https://iase.disa.mil/stigs/Pages/index.aspx) AWS RDS Microsoft SQL Server 2014 Database STIG Version 1 Release 6 tailored for [CMS ARS 3.1](https://www.cms.gov/Research-Statistics-Data-and-Systems/CMS-Information-Technology/InformationSecurity/Info-Security-Library-Items/ARS-31-Publication.html) for CMS systems categories as Moderate.

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

# Hostname of MSSQL DB Server
host: null

# Instance name of MSSQL DB Server
instance: null

# Port number of MSSQL DB Server
port: 49789

# Name of the specific database being evaluated within the MSSQL DB Server
db_name: 'master'

# description: 'Set to true If SQL Server Trace or Server Audit is required for audit purposes'
server_trace_or_audit_required: true

# description: 'Set to true If SQL Server Trace is in use for audit purposes'
server_trace_implemented: true

# description: 'Set to true If SQL Server Audit is in use for audit purposes'
server_audit_implemented: true

# description: 'Specify if  SQL Server Audit is not in use at the database level'
server_audit_at_database_level_required: true

# description: 'User with `ALTER ANY DATABASE AUDIT` or `CONTROL` permission'
approved_audit_maintainers: []

# description: 'name of the timed job that automatically checks all system and user-defined procedures for being modified'
track_stored_procedures_changes_job_name: ''

# description: 'name of the timed job that automatically checks all system and user-defined triggers for being modified'
track_triggers_changes_job_name: ''

# description: 'name of the timed job that automatically checks all system and user-defined functions for being modified'
track_functions_changes_job_name: ''

# description: 'identify SQL Server accounts authorized to own database objects'
authorized_principals: []

# description: 'Set to true if data at rest encryption is required'
data_at_rest_encryption_required: true

# description: 'Set to true if full disk encryption is in place'
full_disk_encryption_inplace: false

# description: 'Set to true if security labeling is required'
security_labeling_required: true
```
## Note

It is assumed that the password complexity plugin: validate_password.so is installed, otherwise control 7.6 will fail.

## Running This Overlay
When the __"runner"__ host uses this profile overlay for the first time, follow these steps: 

```
mkdir profiles
cd profiles
git clone https://github.cms.gov/ispg/cms-ars-3.1-moderate-aws-rds-microsoft-sql-server-2014-database-stig-overlay.git
git clone https://github.com/mitre/aws-rds-microsoft-sql-server-2014-database-stig-baseline.git
cd cms-ars-3.1-moderate-aws-rds-microsoft-sql-server-2014-database-stig-overlay
bundle install
cd ..
inspec exec cms-ars-3.1-moderate-aws-rds-microsoft-sql-server-2014-database-stig-overlay --attrs=<path_to_your_attributes_file/name_of_your_attributes_file.yml> --target=ssh://<your_target_host_name_or_ip_address> --user=<target_account_with_administrative_privileges> --password=<password_for_target_account> --reporter=cli json:<path_to_your_output_file/name_of_your_output_file.json> 
```

For every successive run, follow these steps to always have the latest version of this overlay and dependent profiles:

```
cd profiles/aws-rds-microsoft-sql-server-2014-database-stig-baseline
git pull
cd ../cms-ars-3.1-moderate-aws-rds-microsoft-sql-server-2014-database-stig-overlay
git pull
bundle install
cd ..
inspec exec cms-ars-3.1-moderate-aws-rds-microsoft-sql-server-2014-database-stig-overlay --attrs=<path_to_your_attributes_file/name_of_your_attributes_file.yml> --target=ssh://<your_target_host_name_or_ip_address> --user=<target_account_with_administrative_privileges> --password=<password_for_target_account> --reporter=cli json:<path_to_your_output_file/name_of_your_output_file.json> 
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

