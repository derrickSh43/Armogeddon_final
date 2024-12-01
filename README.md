# Armageddon Project: TMMC J-Tele-Doctor AWS Application  
### Class 6 AWS South Asia Group  

---

## Table of Contents  
1. [Introduction](#introduction)  
2. [Project Overview](#project-overview)  
3. [Technical Requirements & Constraints](#technical-requirements--constraints)  
4. [Solution Design & Architecture](#solution-design--architecture)  
   - [AWS Infrastructure Overview](#aws-infrastructure-overview)  
   - [Local Hosting and Availability Zones](#local-hosting-and-availability-zones)  
   - [Security and Compliance Considerations](#security-and-compliance-considerations)  
5. [Step-by-Step Implementation Plan](#step-by-step-implementation-plan)  
   - [EC2 and ASG Configuration](#ec2-and-asg-configuration)  
   - [Syslog Configuration and Data Transfer](#syslog-configuration-and-data-transfer)  
   - [Access Control and Public Ports](#access-control-and-public-ports)  
6. [Network Diagram](#network-diagram)  
7. [Code Snippets](#code-snippets)  
   - [Terraform for Infrastructure](#terraform-for-infrastructure)  
   - [Syslog Server Configuration](#syslog-server-configuration)  
8. [Challenges and Mitigation Strategies](#challenges-and-mitigation-strategies)  
9. [Future Stages Overview](#future-stages-overview)  
10. [Conclusion](#conclusion)  

---

## Introduction  

Tokyo Midtown Medical Center (TMMC) aims to expand its customer outreach by creating a J-Tele-Doctor application hosted on AWS. This application allows patients to receive treatment remotely without visiting hospital facilities.

### Project Members  

| **Name**       | **Role**            | **GitHub Link**                                    |  
|-----------------|---------------------|----------------------------------------------------|  
| **Derrick**     | Group Leader        | [Derrick's GitHub](https://github.com/derrickSh43/Armogeddon_final) |  
| **T.I.Q.S**      | Contributor         | [T.IQ.S's GitHub](https://github.com/bjett81/Class6-Armaggedon) |  
| **Calvin T.**   | Contributor         | [Calvin's GitHub](https://github.com/tillettgit/gitops) |  
| **Chase Hill**  | Contributor         | [Chase's GitHub](https://github.com/ChaseH609/Class6-Armageddon-02.git) |  
| **Abdul S.**    | Documentation Lead  | N/A                                                |  
| **Ivan X.**     | Contributor         | N/A                                                |  

---

## Project Overview  

### Client: Tokyo Midtown Medical Center (TMMC)  
#### Objectives:  
- Expand medical services to local and international customers.  
- Deploy a multi-region application with localization and language support.  
- Ensure compliance with strict data privacy requirements.  

#### Geographic Deployment:  
- Tokyo, Japan (primary region)  
- New York, USA  
- London, UK  
- São Paulo, Brazil  
- Sydney, Australia  
- Hong Kong  
- California, USA  

#### Key Constraints:  
- **Data Sovereignty**: Personal customer data must remain in Japan's AWS regions.  
- **Port Restrictions**: Only Port 80 should be publicly accessible.  
- **Security Zone for Syslog Data**: Syslog data must be stored only in Japan.  

#### Technologies:  
- AWS (EC2, Auto Scaling Groups, VPC, Subnets)  
- Terraform for IaC (Infrastructure as Code)  
- Syslog servers for log aggregation  
- Security Groups for access control  

---

## Technical Requirements & Constraints  

### Local Hosting for Each Region:  
- Auto Scaling Group (ASG) with a minimum of 2 Availability Zones (AZs).  
- At least 1 EC2 instance for the initial test deployment in each region.  
- Deployment of a security zone for syslog data transfer to Japan.  

### Syslog and Data Transfer Requirements:  
- Syslog data storage is restricted to Japan's AWS regions.  
- Private subnets must be used for syslog data storage.  
- Syslog Server will aggregate logs securely within Japan.  

### Limitations:  
- **Port Restrictions**: Only Port 80 is open to the public.  
- **Data Sovereignty**: No personal data can be transferred outside Japan.  

---

## Solution Design & Architecture  

### AWS Infrastructure Overview  
- Leveraging AWS services for scalability and availability.  
- Application distributed across multiple AWS regions.  
- VPCs segmented into public and private subnets, secured with Security Groups and Network ACLs.  

### Local Hosting and Availability Zones  
- Each region will utilize at least two AZs for redundancy.  
- EC2 instances in public subnets; syslog data routed to private subnets in Japan.  

### Security and Compliance Considerations  
- **Data Privacy**: Customer data is restricted to Japan’s AWS regions.  
- **Access Control**: Only Port 80 is open to the public.  
- **Syslog Data**: Logs are securely stored in Japan, adhering to compliance standards.  

---

## Step-by-Step Implementation Plan  

### EC2 and ASG Configuration  
1. Create Auto Scaling Groups with a minimum of two AZs in each region.  
2. Deploy EC2 instances in public subnets for initial testing.  
3. Configure load balancers to route traffic via Port 80.  

### Syslog Configuration and Data Transfer  
1. Set up private subnets in Japan’s region for syslog servers.  
2. Configure syslog servers to aggregate and securely store logs.  
3. Ensure VPNs are not used to transfer personal data.  

### Access Control and Public Ports  
1. Configure Security Groups to restrict public access to Port 80.  
2. Implement Network ACLs for additional access control.  
3. Regularly audit access logs to identify and mitigate unauthorized access attempts.  

---

## Network Diagram  

**[Placeholder for Network Diagram]**  
_Include a visual representation of the network architecture, showcasing EC2 instances, Auto Scaling Groups, VPCs, subnets, and syslog server routing to Japan._  

---

## Code Snippets  

### Terraform for Infrastructure  

```hcl
resource "aws_instance" "web_server" {
  ami           = "ami-0abcdef1234567890"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_subnet.id

  tags = {
    Name = "WebServerInstance"
  }
}
