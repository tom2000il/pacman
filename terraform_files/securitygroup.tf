resource "aws_security_group" "eks_cluster_sg" {
  name        = "eks_cluster_sg"
  description = "EKS Cluster Security Group"
  vpc_id      = aws_vpc.tom_project.id

  ingress {
    description = "Allow all inbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "eks_worker_sg" {
  name        = "eks_worker_sg"
  description = "EKS Worker Nodes Security Group"
  vpc_id      = aws_vpc.tom_project.id

  ingress {
    description = "Allow inbound traffic from the EKS Cluster"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    security_groups = [aws_security_group.eks_cluster_sg.id]
  }

  ingress {
    description = "Allow inbound traffic from anywhere"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
