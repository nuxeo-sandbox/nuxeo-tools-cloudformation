# Nuxeo templates for Amazon CloudFormation

These templates will deploy a single Nuxeo instance with CloudFormation.

This Nuxeo environment is for demonstration and evaluation purposes only.  It is not intended to be used for Production.

## Templates List

- **Nuxeo**

This will deploy a single EC2 instance containing Nuxeo, a PostgreSQL
database and a Apache2 HTTP front-end.  
An Elastic IP is associated with the instance.

## Repository Structure

- **templates**: this contain the "template templates" which reference
  user-data scripts.

- **userdata**: those are the scripts that are run when the instance
  comes up for the first time.
  They basically just download and execute the scripts below.

- **scripts**: those are the scripts that do the actual setup inside
  "agnostic" AMIs.

- **build**: this puts everything together and uploads the final template
  and scripts on S3.

- **dist**: pre-built templates

## Operating System

We are using the `wget` tool to retrieve the script from github.
The OS is Ubuntu 18.04 LTS (Bionic). 

## Installation

- Download the `dist/Nuxeo.template` file to your local machine
- Create a new resources stack with [AWS CloudFormation](https://console.aws.amazon.com/cloudformation/home)
- Upload the `Nuxeo.template` file.
- Click `Next`
- Specify a stack name, instance type, and SSH key name.
  - Instance types can be one of: "t1.micro", "m1.small", "m1.large", "m1.xlarge", "m2.xlarge", "m2.2xlarge", "m2.4xlarge", "c1.medium", "c1.xlarge", "c1.4xlarge", "c3.large" 
- Click `Next`
- Click `Next`
- Click `Create Stack`
- The Outputs tab of the Stack status page will contain the assigned URL for the instance.
- After approximately 5 minutes, a simple status page will appear with the text: "Please wait a few minutes for you instance installation to complete"
- Refresh this page until the Nuxeo setup wizard page appears.  This may take up to 10 minutes.  See the next section to monitor the installation.

### Installation Monitoring

- Use the IP address specified in the Outputs tab of the Stack status page to SSH to the instance:
  - `ssh ubuntu@IP_ADDRESS`
- Monitor the script progress by tailing the installation log file:
  - `tail -F /var/log/nuxeo_install.log`
- Once you see "Nuxeo Installation Script Complete", refresh the webpage and you should see the Nuxeo setup wizard.

## About Nuxeo

Nuxeo provides a modular, extensible Java-based [open source software platform for enterprise content management] [1] and packaged applications for [document management] [2], [digital asset management] [3] and [case management] [4]. Designed by developers for developers, the Nuxeo platform offers a modern architecture, a powerful plug-in model and extensive packaging capabilities for building content applications.

[1]: http://www.nuxeo.com/en/products/ep
[2]: http://www.nuxeo.com/en/products/document-management
[3]: http://www.nuxeo.com/en/products/dam
[4]: http://www.nuxeo.com/en/products/case-management

More information on: <http://www.nuxeo.com/>
