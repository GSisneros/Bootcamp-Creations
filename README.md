# Bootcamp-Creations
A place for me to post/keep cleaner track of everything I've personally created during my time enrolled in the UCSD Bootcamp


## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

(Images/Network Diagram.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the Install Elk.yml file may be used to install only certain pieces of it, such as Filebeat.

  - Install Elk.yml

This document contains the following details:
- Description of the Topologu
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly secure, in addition to restricting traffic to the network.
- The Load Balancer is there to protect the Network from DDOS/DOS attacks, and to also just help maintain the Network during high taffic times. The Advantage to the jumpbox is that I am able to run the Elk server and 3 Web servers all off of the same machine without having to "waste space" and is a lot easier to maintain

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the Data and system logs.
- Filebeat watches for any change in the system, such as file creation, name change, and login. Sending them to Logstash and Elasticsearch.
- Metricbeat is being used to keep track of the system itself. Constantly sending metric data of the system to Kibana.

The configuration details of each machine may be found below.
_Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.

| Name     | Function   | IP       | OS    |
|----------|------------|----------|-------|
| Web 1    | DVWA       | 10.0.0.5 | Linux |
| Web 2    | DVWA       | 10.0.0.6 | Linux |
| Web 3    | DVWA       | 10.0.0.8 | Linux |
| Elk 1    | Elk Server | 10.1.0.4 | Linux |
| Jump Box | Gateway    | 10.0.0.4 | Linux |
### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump-Box machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- 108.241.1.21 and 68.6.181.186

Machines within the network can only be accessed by the JumpBox.
- Only the Jump box can access the Elk server, which comes from 52.250.21.141

A summary of the access policies in place can be found in the table below.

| Name    | Publicly Accessable | Allowed IPs               |
|---------|---------------------|---------------------------|
| JumpBox | No                  | 108.241.1.21,68.6.181.186 |
| Web 1   | No                  | 108.241.1.21,68.6.181.186 |
| Web 2   | No                  | 108.241.1.21,68.6.181.186 |
| Web 3   | No                  | 108.241.1.21,68.6.181.186 |
| Elk     | Yes                 | 108.241.1.21,68.6.181.186 |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
- The entire setup of the Jumpbox, its containers, and any additional softwares you want on the VM; or any machine rather. Is fully automated and as long as the file is correct. Will output the exact same everytime.

The playbook implements the following tasks:
- Install Docker
- Install Python
- Install Docker module
- Increase virtual memory
- Tell the system to use more memory (Systemctl)
- Download and Launch the Elk Server

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

Images/Elk Proof.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- 10.0.0.4, 10.0.0.5, 10.0.0.6, and 10.0.0.8

We have installed the following Beats on these machines:
- We succesfully installed Filebeat and Metricbeat

These Beats allow us to collect the following information from each machine:
- _TODO: In 1-2 sentences, explain what kind of data each beat collects, and provide 1 example of what you expect to see. E.g., `Winlogbeat` collects Windows logs, which we use to track user logon events, etc._

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the id_rsa file to the host files.
- Update the YAML file to include the correct group
- Run the playbook, and navigate to the ansible machine to check that the installation worked as expected.


- I used pentest.yml to configure the machines and set the hosts as "Webservers"
- I updated the pentest.yml file itself to make it run on the webserver group. When running the playbook make sure you set the "hosts" as the correct host.
- localhost:5601/app/kibana
