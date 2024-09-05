resource "aws_eks_cluster" "eks_cluster" {
  name     = "tom_project_eks_cluster"
  role_arn = aws_iam_role.eks_cluster_role.arn

  vpc_config {
    subnet_ids = [
      aws_subnet.public_subnet.id,
      aws_subnet.private_subnet.id,
    ]
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_policy,
  ]
}

resource "aws_eks_node_group" "eks_node_group" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = "tom_project_node_group"
  node_role_arn   = aws_iam_role.eks_worker_role.arn  # Correct argument name
  subnet_ids      = [
    aws_subnet.public_subnet.id,
    aws_subnet.private_subnet.id,
    ]

  scaling_config {
    desired_size = 2
    max_size     = 2
    min_size     = 2
  }

  instance_types = ["t3.medium"]

   depends_on = [
    aws_eks_cluster.eks_cluster,
    aws_iam_role_policy_attachment.eks_worker_node_policy,
    aws_iam_role_policy_attachment.eks_registry_policy,
    aws_iam_role_policy_attachment.eks_cni_policy,
    aws_iam_role_policy_attachment.eks_vpc_controller_policy,
   ]
}
