1. Add import keyword in main.tf file
    import {
        id = ""
        to = aws_instance.example
    }

2. Create tf file to create resource aws_instance.example

    terraform init

    terraform plan --generate-config-out=generated_resources.tf   ## configuration file terraform create

3. Copy content of generated_resources.tf and paste in main.tf, and remove import block. Then delete generated_resources.tf

4. Create terraform.tfstate file by below command,

    terraform import aws_instance.example <instance_id_to_import>

5. tfstate file is created.

6. terraform plan  
