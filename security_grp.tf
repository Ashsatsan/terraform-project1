resource "aws_security_group" "proj-elb-sg" {
  name        = "proj-elb-sg"
  description = "Load balancer for the project"

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "proj-bastion-sg" {
  name        = "proj-bastion-sg"
  description = "Bastion security group"

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = [var.MYIP] # Replaced `security_groups` with `cidr_blocks`
  }
}

resource "aws_security_group" "proj-prod-sg" {
  name        = "proj-prod-sg"
  description = "Beanstalk for the project"

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    protocol        = "tcp"
    from_port       = 22
    to_port         = 22
    security_groups = [aws_security_group.proj-bastion-sg.id]
  }
}

resource "aws_security_group" "proj-backend-sg" {
  name        = "proj-backend-sg"
  description = "Backend for the project"

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    protocol        = "-1"
    from_port       = 0
    to_port         = 0
    security_groups = [aws_security_group.proj-prod-sg.id]
  }
}

# Fixed aws_security_group_rule reference issues
resource "aws_security_group_rule" "proj-rule-update" {
  from_port                = 0
  protocol                 = "tcp"
  to_port                  = 65535
  type                     = "ingress"
  security_group_id        = aws_security_group.proj-backend-sg.id # Corrected reference
  source_security_group_id = aws_security_group.proj-backend-sg.id # Corrected reference
}
