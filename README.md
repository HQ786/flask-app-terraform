# Flask App with Terraform and Ansible

This project demonstrates how to deploy a Flask web application using Terraform to provision the infrastructure (AWS EC2 instance) and Ansible to configure the application on the instance. The project also includes a simple Flask application that serves a basic web page.


## Prerequisites

Before you begin, ensure you have the following installed on your local machine:

- [Terraform](https://www.terraform.io/downloads.html)
- [AWS CLI](https://aws.amazon.com/cli/)
- [Ansible](https://www.ansible.com/)
- [Git](https://git-scm.com/)
- [Python 3](https://www.python.org/)

Additionally, you need to configure AWS CLI and ensure you have AWS access credentials (`aws_access_key_id` and `aws_secret_access_key`).

## Getting Started

### Clone the Repository

To get started, clone this repository to your local machine:

```bash
git clone https://github.com/HQ786/flask-app-terraform.git
cd flask-app-terraform
