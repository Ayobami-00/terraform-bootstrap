# Terraform Bootstrap Infrastructure

This repository contains Terraform configurations for setting up the necessary infrastructure to manage Terraform state files. It includes an S3 bucket for storing state files and a DynamoDB table for state locking.

## Project Structure

- **bootstrap**
  - **backend**
    - **modules**
      - **aws**
        - **dynamodb**
          - `dynamodb.tf`
          - `variables.tf`
        - **s3**
          - `s3.tf`
          - `variables.tf`
    - `main.tf`
    - `terraform.tf`
    - `terraform.tfvars`
    - `variables.tf`
  - `Makefile`

## Purpose

The Terraform configuration sets up:
- An S3 bucket for storing Terraform state files.
- A DynamoDB table for locking Terraform state files to prevent concurrent modifications.

## Getting Started

### Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) v1.6.0 or later.
- AWS credentials configured in your environment (e.g., through `aws configure` or environment variables).

### Configuration

1. **Clone the Repository**:
    ```bash
    git clone https://github.com/Ayobami-00/terraform-bootstrap.git
    cd terraform-bootstrap
    ```

2. **Update Variables**:
    - Open `terraform.tfvars` and set the appropriate values for your environment:
      ```hcl
      s3_bucket_name = "your-s3-bucket-name"
      dynamodb_table_name = "your-dynamodb-table-name"
      aws_region = "your-aws-region"
      ```

3. **Initialize Terraform**:
    ```bash
    cd bootstrap/backend
    terraform init
    ```

4. **Apply the Configuration**:
    ```bash
    terraform apply -var="aws_region=<your-aws-region>" -var="s3_bucket_name=<your-s3-bucket-name>" -var="dynamodb_table_name=<your-dynamodb-table-name>" -auto-approve
    ```

5. **Clean Up**:
    - The Makefile contains a `bootstrap-backend` target to automate initialization and application of the Terraform configuration:
      ```bash
      make bootstrap-backend
      ```

## File Descriptions

- **`dynamodb.tf`**: Contains the configuration for creating a DynamoDB table used for state locking.
- **`s3.tf`**: Contains the configuration for creating an S3 bucket with encryption, versioning, and public access blocking.
- **`main.tf`**: Configures and applies the DynamoDB and S3 modules.
- **`terraform.tf`**: Specifies Terraform's version requirements and provider configurations.
- **`terraform.tfvars`**: Holds the variable values for the Terraform configuration.
- **`variables.tf`**: Defines the variables used across the Terraform configuration.
- **`Makefile`**: Provides automation for initializing and applying Terraform configurations.

## Notes

- Ensure that your AWS credentials have the necessary permissions to create and manage S3 buckets and DynamoDB tables.
- Modify the `Makefile` environment variables if needed to match your naming conventions and environment.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
