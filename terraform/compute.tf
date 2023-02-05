# EC2 INSTANCES
resource "aws_instance" "webserver-1" {
  instance_type          = var.ec2_instance_type
  ami                    = var.ec2_ami
  key_name = ""
  vpc_security_group_ids = [aws_security_group.public-subnet-sg.id]
  subnet_id              = aws_subnet.public_subnet_1a.id
  associate_public_ip_address = true
    tags = {
      Name = "webserver-1"
    }
}

resource "aws_instance" "webserver-2" {
  instance_type          = var.ec2_instance_type
  ami                    = var.ec2_ami
  key_name = ""
  vpc_security_group_ids = [aws_security_group.public-subnet-sg.id]
  subnet_id              = aws_subnet.public_subnet_1a.id
  associate_public_ip_address = true
    tags = {
      Name = "webserver-2"
    }
}

resource "aws_instance" "webserver-3" {
  instance_type          = var.ec2_instance_type
  ami                    = var.ec2_ami
  key_name = ""
  vpc_security_group_ids = [aws_security_group.public-subnet-sg.id]
  subnet_id              = aws_subnet.public_subnet_1a.id
  associate_public_ip_address = true
    tags = {
      Name = "webserver-3"
    }
}


# APPLICATION LOAD BALANCER
resource "aws_lb_target_group" "target-group" {
    name     = "apache"
    port     = "80"
    protocol = "HTTP"
    vpc_id   = aws_vpc.vpc.id
    health_check {
        enabled = true
        healthy_threshold = 3
        interval = 10
        matcher = 200
        path = "/"
        port = "traffic-port"
        protocol = "HTTP"
        timeout = 3
        unhealthy_threshold = 2
        }
}

resource "aws_lb_target_group_attachment" "attach-webserver-1" {
    target_group_arn = aws_lb_target_group.target-group.arn
    target_id        = aws_instance.webserver-1.id
    port             = 80
}

resource "aws_lb_target_group_attachment" "attach-webserver-2" {
    target_group_arn = aws_lb_target_group.target-group.arn
    target_id        = aws_instance.webserver-2.id
    port             = 80
}

resource "aws_lb_target_group_attachment" "attach-webserver-3" {
    target_group_arn = aws_lb_target_group.target-group.arn
    target_id        = aws_instance.webserver-3.id
    port             = 80
}

resource "aws_lb_listener" "webserver" {
    load_balancer_arn = aws_lb.alb.arn
    port              = "80"
    protocol          = "HTTP"

    default_action {
        type             = "forward"
        target_group_arn = aws_lb_target_group.target-group.arn
    }
}

resource "aws_lb" "alb" {
    name               = "alb-001"
    internal           = false
    load_balancer_type = "application"
    security_groups    = [aws_security_group.alb-sg.id]
    subnets            = [aws_subnet.public_subnet_1a.id]

    enable_deletion_protection = true

    tags = {
        Environment = "alb"
    }
}