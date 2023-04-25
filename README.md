# Cloud-Resume

## About:
### The Cloud Resume Challenge is a cloud service project spec designed by Forrest Brazeal. The goal of the challenge is to build a resume using HTML and CSS and deploy it using various cloud technologies.

## Set Up:
### Before I started working on deploying my resume I installed the AWS CLI, AWS Vault, Terraform, and AWS SAM on my machine. The AWS Command Line Interface allows you to interact with AWS services using commands in your terminal program. AWS Vault is a tool to securely store and access multiple AWS credentials from your command line. Terraform and AWS SAM are infrastructure as code tools. Terraform was used to deploy the frontend of the project, and AWS SAM was used for the backend.

## Certification:
### The first project requirement is to earn the AWS Cloud Practitioner certification, which I earned in August of 2022.

## HTML & CSS
### The resume deployed in this challenge was built using simple HTML and CSS. The code can be found in this repository.

## Amazon S3 Static Website:
### Amazon Simple Storage Service (S3) is an object storage service that provides scalability, data availability, security, and performance. It can be used to protect any amount of data for a variety of use cases, such as data lakes, websites, mobile applications, and big data analytics. For this project I used S3 to host and store the HTML and CSS files for my resume. I deployed my S3 infrastructure using Terraform code that can be found in this repository.

## Cloudfront and HTTPS:
### Amazon CloudFront is a content delivery network service, or CDN. CDN's are geographically distributed groups of servers that cache content close to end users providing lower latency and a better user experience. Using CloudFront also alows for the use of a HTTPS connection which provides increased security compared to HTTP. I deployed my CloudFront infrastructure using Terraform code that can be found in this repository.

## Route 53 & DNS
### Amazon Route 53 is a Domain Name System, or DNS, web service. DNS is a naming database where internet domain names are stored and translated into IP addresses. Route 53 will connect user requests to internet applications running on either AWS services, or on premises servers. I used Route 53 to point my domain name, www.colpowres.com, to my CloudFront infrastructure. I deployed my Route 53 infrastructure using Terraform code that can be found in this repository. I used the AWS management console to get sn SSL certificate through Amazon Certificate Manager. An SSL certificate authenticates the identity of a website and encrypts information sent to the server. Once Amazon Certificate Manager issued the SSL certificates I linked them to my CloudFront distributions.

## Javascript & Visitor Count
### The backend portion of this project is to store a visitor count in a DynamoDB table and to update, access, and display the value using API's and Javascript. The actual display of the value on the resume was accomplished using Javascript and HTML code that can be found in this repository. The Javascript code first calls the API to update the visitor count, then calls the API to get and return the current visitor count and stores that value in a local variable that is called in the HTML code.

## Database & DynamoDB
### Amazon DynamoDB is a fully managed, serverless, key-value, NoSQL database that offers built-in security, continuous backups, automated multi-Region replication, in-memory caching, and data import and export tools. I used a simple DynamoDB table to store my visitor count value and deployed it using YAML code that can be found in this repository.

## API Gateway
### Amazon API Gateway is a fully managed service that allows developers to create, publish, maintain, monitor, and scure APIs. An API, Application Programming Interface, simplifys development by allowing your product or service communicate with other products and services without having to know how they're implemented. In this case, I used API Gateway to allow my website to communicate with AWS Lambda and DynamoDB by invoking a simple URL. AWS SAM created a basic API for me when I chose the Hello World template while initializing the backend of this project. The template API only needed a few minor method updates, GET & PUT, for it to work for my purposes.

## Lambda Functions
### Amazon Lambda is a serverless, event-driven compute service that allows you to run code for almost any kind of application or backend service without provisioning or managing servers. I used two seperate Lambda functions for this project. The first one updates the DynamoDB visitor count value each time my website is visited. The second value simply gets the current visitor value from DynamoDB and returns it. I deployed the Lambda functions using YAML code found in this repository.

## Infrastructure as Code
### Infrastructure as Code uses DevOps principles and versioning to define and deploy infrastructure. IaC generates the same environment every time it is deployed, providing conistency that can't be found using a manual process. For this project I used two different IaC tools, AWS SAM and Terraform. AWS SAM is Amazon's IaC tool that works exclusively with their cloud platform. The benefit of Terraform is it can be used with various cloud providers.

## Version Control & Github
### GitHub is a cloud-based Git repository hosting service that makes it easier for individuals and teams to use Git for both version control and collaboration. Version control refers to the practice of tracking and managing changes to software code over time. You are currently visiting the Github page for this project.


