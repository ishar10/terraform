provider "aws" {
  region     = "us-east-2"
  access_key = "AKIAUKYBZRM67TDGEXQF"
  secret_key = "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"
}
provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAUKYBZRM67TDGEXQF"
  secret_key = "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"
  alias="useast1"
}
resource "aws_instance" "us-east2" {
  ami           = "ami-0b614a5d911900a9b" # us-east-2
  instance_type = "t2.micro"
}
resource "aws_instance" "us-east1" {
  ami           = "ami-033b95fb8079dc481" # us-east-1
  instance_type = "t2.micro"
  provider=aws.useast1
}
resource "aws_s3_bucket" "myfirstbucket" {
  bucket = "my-tf-test-bucket01012"
  tags = {
    Name        = "My terraform bucket"
    Environment = "Dev-Env"
  }
  
}