resource "aws_eks_cluster" "main" {
  name = "main"
  role_arn = aws_iam_role.cluster.arn
  version  = "1.31"

  vpc_config {
    subnet_ids = [ subnet-0117cdfaf46842167, subnet-0b0561e5654e35569, subnet-0b5abd68e3e0182a1 ]
  }
  depends_on = [
    aws_iam_role_policy_attachment.cluster_AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.cluster_AmazonEKSComputePolicy,
    aws_iam_role_policy_attachment.cluster_AmazonEKSBlockStoragePolicy,
    aws_iam_role_policy_attachment.cluster_AmazonEKSLoadBalancingPolicy,
    aws_iam_role_policy_attachment.cluster_AmazonEKSNetworkingPolicy,
  ]
}

resource "aws_eks_node_group" "node_main" {
  cluster_name    = aws_eks_cluster.main.name
  node_group_name = "node_main"
  node_role_arn   = aws_iam_role.node.arn
  subnet_ids      = [ subnet-0117cdfaf46842167, subnet-0b0561e5654e35569, subnet-0b5abd68e3e0182a1 ]

  scaling_config {
    desired_size = 1
    max_size     = 2
    min_size     = 1
  }

  update_config {
    max_unavailable = 1
  }
  depends_on = [
    aws_iam_role_policy_attachment.node_AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.node_AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.node_AmazonEC2ContainerRegistryReadOnly,
  ]
}