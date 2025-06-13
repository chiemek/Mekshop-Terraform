resource "aws_instance" "docker" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = "t2.micro"
  key_name               = "web-server.pem" 
  vpc_security_group_ids = [aws_security_group.common_sg.id, aws_security_group.docker_sg.id]
  user_data              = file("docker_install.sh") # Assuming you have a script to install Docker

  tags = {
    Name = "docker server"
  }
}

resource "aws_instance" "prometheus" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = "t2.micro"
  key_name               = "web-server.pem" 
  vpc_security_group_ids = [aws_security_group.common_sg.id, aws_security_group.prometheus_sg.id]
  user_data              = file("prometheus_install.sh") # Assuming you have a script to install Prometheus

  tags = {
    Name = "prometheus server"
  }
}

resource "aws_instance" "grafana" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = "t2.micro"
  key_name               = "web-server.pem"  
  vpc_security_group_ids = [aws_security_group.common_sg.id, aws_security_group.grafana_sg.id]
  user_data              = file("grafana_install.sh") # Assuming you have a script to install Grafana

  tags = {
    Name = "grafana server"
  }
}
