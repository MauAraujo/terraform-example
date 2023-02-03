resource "aws_eks_cluster" "main_cluster" {
  name     = "main_cluster"
  role_arn = modules.global.iam.aws_iam_role.cluster_role.arn

  vpc_config = {
    subnet_ids = [
      "",
      ""
    ]
  }
}

resource "aws_eks_node_group" "cluster_node_group" {
  cluster_name    = aws_eks_cluster.main_cluster.name
  node_group_name = "main_cluster_node_group_1"
  node_role_arn   = ""
  subnet_ids      = []

  scaling_config {
    desired_size = 1
    max_size     = 2
    min_size     = 1
  }

  update_config {
    max_unavailable = 1
  }
}
