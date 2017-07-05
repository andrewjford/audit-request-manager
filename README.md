# Audit Request Manager

Overview

This is a Rails web app that handles audit requests between auditors and auditees. Users, depending on their access level, can create projects, add requests to projects, comment on requests, and upload files related to requests*. In the current version, file uploads are disabled.

Installation

This app is currently set up to run on postgresql. A postgresql database would need to be setup and properly referenced. A secrets.yml needs to be in /config. At /config/secrets.sample.yml is a sample of what secrets.yml would be. The keys would need to be created. Also, the app is setup to read Facebook and Github authorization keys from ENV. 

Details

Users can Sign Up directly with the site, or through Facebook or GitHub accounts. User access is restricted by the account's access level which defaults to Manager in the current version. Manager is the highest available access level. One step down is the Auditor level. The most restricted level is Client. This demo version allows the user to change their own access level in the profile edit page.

An example project is automatically provided with the database seed, and new users are assigned to it for demonstration purposes. Manager access allows the user to create additional projects. Auditors and Clients cannot add projects. To see and access projects, a user must be assigned to it. The manager that creates a project is automatically assigned to it. The manager must then edit the project to assign other users to the project.

Managers and Auditors can create request items in projects they are assigned to. Managers and Auditors can set the status of requests to Open or Closed. All users can "upload" files in relation to a request, and add comments. Pressing the upload files button currently just sets the status of the request to Client Submitted.
