resource "aws_eks_cluster" "main_cluster" {
  name     = "main_cluster"
  role_arn = modules.global.iam.aws_iam_role.cluster_role.arn

  vpc_config = {
    subnet_ids = [
      modules.networking.vpc.aws_subnet.cluster_subnet_1.id,
      modules.networking.vpc.aws_subnet.cluster_subnet_2.id
    ]
  }
}

output "cluster_endpoint" {
  value = ""
}

output "kubeconfig-certificate-authority-data" {
  value = ""
}
