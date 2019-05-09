# encoding: utf-8                                                                                              
include_controls 'microsoft-sql-server-2014-instance-stig-baseline' do
  control 'V-67893' do
    title 'SQL Server, the operating system, or the storage system must provide a 
          warning to appropriate support staff when allocated audit record storage 
          volume reaches 80% of maximum audit record storage capacity.'
    desc 'check', 'Organizations are required to use a central log management system, 
         so, under normal conditions, the audit space allocated to SQL Server on its 
         own server will not be an issue. However, space will still be required on 
         the DBMS server for audit records in transit, and, under abnormal conditions, 
         this could fill up. Since a requirement exists to halt processing upon audit 
         failure, a service outage would result.

         As noted elsewhere in this document, SQL Server\'s Audit and/or Trace features 
         can be used for auditing purposes.  This requirement applies to both.

         If support personnel are not notified immediately upon storage volume 
         utilization reaching 80%, they are unable to plan for storage capacity 
         expansion. 

         The monitoring and alerting may be done at the database level, the operating 
         system level, or by specialized monitoring tools. 

         The appropriate support staff include, at a minimum, the ISSO and the DBA/SA.'
    desc 'check', 'Review system configuration.

         If appropriate support staff are not notified immediately upon storage volume 
         utilization reaching 80%, this is a finding.'
    desc 'fix', 'Configure the system to notify appropriate support staff immediately 
         upon storage volume utilization reaching 80%.'
    describe "SQL Server, the operating system, or the storage system must provide a
             warning to appropriate support staff when allocated audit record storage 
             volume reaches 80% of maximum audit record storage capacity." do
      skip 'This control is manual'
    end
  end

  control 'V-67913' do
    title 'Security-relevant software updates to SQL Server must be installed within the 
          time period directed by CMS policy.'
    desc 'Security flaws with software applications, including database management systems, 
         are discovered daily. Vendors are constantly updating and patching their products 
         to address newly discovered security vulnerabilities. Organizations (including any 
         contractor to the organization) are required to promptly install security-relevant 
         software updates (e.g., patches, service packs, and hot fixes). Flaws discovered 
         during security assessments, continuous monitoring, incident response activities, 
         or information system error handling must also be addressed expeditiously. 

         CMS Policy requires correcting identified security-related information system flaws 
         on production equipment within ten (10) business days and all others within thirty 
         (30) calendar days.'
    desc 'check', 'Obtain evidence that software patches are consistently applied to SQL
         Server, correcting identified security-related information system flaws on 
         production equipment within ten (10) business days and all others within thirty 
         (30) calendar days.

         If such evidence cannot be obtained, or the evidence that is obtained indicates 
         a pattern of noncompliance, this is a finding.'
    desc 'fix', 'Institute and adhere to policies and procedures to ensure that patches 
         are consistently applied to SQL Server, correcting identified security-related 
         information system flaws on production equipment within ten (10) business days 
         and all others within thirty (30) calendar days. '
  end

  control 'V-67759' do
    desc 'Enterprise environments make account management for applications and databases 
         challenging and complex. A manual process for account management functions adds 
         the risk of a potential oversight or other error. Managing accounts for the same 
         person in multiple places is inefficient and prone to problems with consistency 
         and synchronization.

         A comprehensive application account management process that includes automation 
         helps to ensure that accounts designated as requiring attention are consistently 
         and promptly addressed. 

         Examples include, but are not limited to, using automation to take action on 
         multiple accounts designated as inactive, suspended, or terminated, or by disabling 
         accounts located in non-centralized account stores, such as multiple servers. 
         Account management functions can also include: assignment of group or role membership; 
         identifying account type; specifying user access authorizations (i.e., privileges); 
         account removal, update, or termination; and administrative alerts. The use of 
         automated mechanisms can include, for example: using email or text messaging to 
         notify account managers when users are terminated or transferred; using the 
         information system to monitor account usage; and using automated telephone 
         notification to report atypical system account usage.

         Account management and authentication in a Windows environment normally use an 
         LDAP-compatible directory service, usually Windows Active Directory.  This in 
         turn, in the CMS environment, is typically integrated with the Public Key 
         Infrastructure (PKI).  Additional technologies or products may be employed that        
         when placed together constitute an overall mechanism supporting an organization\'s 
         automated account management requirements.  An example is the use of Group Policy 
         Objects to enforce rules concerning passwords.

         SQL Server must be configured to use Windows authentication, with SQL Server 
         authentication disabled.  If circumstances (such as the architecture of a 
         purchased application) make it necessary to have SQL Server authentication 
         available, its use must be kept to a minimum.  The reasons for its use, and the 
         measures taken to restrict it to only the necessary cases, must be documented, 
         with AO approval.

         It is assumed throughout this STIG that this integration has been implemented.'
  end

  control 'V-67761' do
    desc 'Authentication with a CMS-approved PKI certificate does not necessarily imply 
         authorization to access the SQL Server instance and server-level resources.  
         To mitigate the risk of unauthorized access to sensitive information by entities 
         that have been issued certificates by CMS-approved PKIs, all CMS systems, 
         including SQL Server instances, must be properly configured to implement access        
         control policies. 

         Successful authentication must not automatically give an entity access to an asset 
         or security boundary. Authorization procedures and controls must be implemented to 
         ensure each authenticated entity also has a validated and current authorization. 
         Authorization is the process of determining whether an entity, once authenticated, 
         is permitted to access a specific asset. Information systems use access control 
         policies and enforcement mechanisms to implement this requirement. 

         Access control policies include identity-based policies, role-based policies, and 
         attribute-based policies. Access enforcement mechanisms include access control 
         lists, access control matrices, and cryptography. These policies and mechanisms 
         must be employed by the application to control access between users (or processes 
         acting on behalf of users) and objects (e.g., devices, files, records, processes, 
         programs, and domains) in the information system. 

         This requirement is applicable to access control enforcement applications, a 
         category that includes SQL Server.  If SQL Server is not configured to follow 
         applicable policy when approving access, it may be in conflict with networks or 
         other applications in the information system. This may result in users either 
         gaining or being denied access inappropriately and in conflict with applicable policy.'
  end

  control 'V-67767' do
    title 'Where SQL Server Audit is in use, SQL Server must allow only the ISSO (or 
          individuals or roles appointed by the ISSO) to select which auditable events are to 
          be audited at the server level'
  end

  control 'V-67807' do
    tag "cci": ['CCI-000345']
    tag "nist": ['CM-5', 'Rev_4']    
  end

  control 'V-67809' do
    tag "cci": ['CCI-000345']
    tag "nist": ['CM-5', 'Rev_4']
  end

  control 'V-67811' do
    tag "cci": ['CCI-000345']
    tag "nist": ['CM-5', 'Rev_4']
  end

  control 'V-67813' do
    tag "cci": ['CCI-000345']
    tag "nist": ['CM-5', 'Rev_4']
  end

  control 'V-67815' do
    tag "cci": ['CCI-000345']
    tag "nist": ['CM-5', 'Rev_4']
  end

#  control 'V-67877' do
#    impact 'none'
#    desc 'caveat', 'Not applicable for this CMS ARS 3.1 overlay, since the related 
#         security control is not included in CMS ARS 3.1'
#  end

  control 'V-67899' do
    tag 'cci': ['CCI-001807']
    tag 'nist': ['CM-11 b', 'Rev_4']
  end

  control 'V-67907' do
    impact 'none'
    desc 'caveat', 'Not applicable for this CMS ARS 3.1 overlay, since the related                                                        
         security control is not included in CMS ARS 3.1'
  end

  control 'V-67909' do
    tag 'cci': ['CCI-002418']
    tag 'nist': ['SC-8', 'Rev_4']
  end

  control 'V-67911' do
    tag	'cci': ['CCI-002418']
    tag	'nist':	['SC-8', 'Rev_4']
  end

  control 'V-67915' do
    desc 'check', 'Obtain evidence that SQL Server software updates are tested before 
         being applied to production servers, and that any exceptions are approved by 
         the ISSO.

         If such evidence cannot be obtained, or the evidence that is obtained  
         indicates a pattern of noncompliance, this is a finding.'
  end

  control 'V-67941' do
    impact 'none'
    desc 'caveat', 'Not applicable for this CMS ARS 3.1 overlay, since the related
         security control is not incluced in the CMS ARS 3.1'
  end

#  control 'V-67943' do
#    title 'If SQL Server authentication, using passwords, is employed, SQL Server 
#          must enforce the CMS standards for password complexity.'
#    desc 'check', 'Windows domain/enterprise authentication and identification must be 
#         used (STIG ID SQL4-00-030300).  Native SQL Server authentication may be used 
#         only when circumstances make it unavoidable; and must be documented and AO-approved.

#         The CMS standard for authentication is CMS-approved PKI certificates.  Authentication 
#         based on User ID and Password may be used only when it is not possible to employ a 
#         PKI certificate, and requires AO approval.

#         In such cases, the CMS standards for password complexity must be implemented.  

#         The requirements for password complexity are:
#         a. minimum of 15 Characters, 3 of each of the following character sets:
#         - Upper-case
#         - Lower-case
#         - Numeric
#         - Special characters (e.g. ~ ! @ # $ % ^ & * ( ) _ + = - \' [ ] / ? > <)];
#         b. Minimum number of characters changed from previous password:  80% of the minimum 
#         password length (that is, 12).
         
#         To enforce this in SQL Server, configure each DBMS-managed login to inherit the 
#         rules from Windows.'   
#  end

  control 'V-67945' do
    title 'If SQL Server authentication, using passwords, is employed, SQL Server must enforce 
          the CMS standards for password lifetime.'
    desc 'Windows domain/enterprise authentication and identification must be used (STIG ID: 
         SQL4-00-030300).  Native SQL Server authentication may be used only when circumstances 
         make it unavoidable; and must be documented and AO-approved.

         The CMS standard for authentication is CMS-approved PKI certificates.  Authentication 
         based on User ID and Password may be used only when it is not possible to employ a PKI 
         certificate, and requires AO approval.

         In such cases, the CMS standards for password lifetime must be implemented.  

         The requirements for password lifetime are:
         a. Password lifetime limits for interactive accounts:  Minimum 24 hours, Maximum 60 days
         b. Password lifetime limits for non-interactive accounts:  Minimum 24 hours, Maximum 60 days
         c. Number of password changes before an old one may be reused:  Minimum of 12.
         
         To enforce this in SQL Server, configure each DBMS-managed login to inherit the rules from Windows.'
  end

end



