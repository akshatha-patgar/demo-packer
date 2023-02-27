packer {
  required_plugins {
    amazon = {
      source  = "github.com/hashicorp/amazon"
      version = "~> 1.1.1"
    }
  }
}
source "amazon-ebs" "custom-ami" {
  ami_name      = "custom-ami"
  instance_type = "t2.micro"
  region        = "us-east-1"
  source_ami    = "ami-0dfcb1ef8550277af"
  ssh_username  = "ec2-user"
  access_key    = "AKIA4OCIWAYFHOZNHRES"
  secret_key    = "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"
  #profile       = "aws-profile-name"
  skip_region_validation = "true"
  tags = {
    Name = "custom-ami"
  }
}
build {
  sources = ["source.amazon-ebs.custom-ami"]

  provisioner "ansible" {
    playbook_file = "./playbook.yaml"
    user          = "ec2-user"
  }

}
