resource "aws_elasticache_subnet_group" "main_cache_subnets" {
  name       = "${var.cluster_id}-subnets"
  subnet_ids = var.subnet_ids
}


resource "aws_elasticache_cluster" "main_cache" {
  cluster_id           = var.cluster_id
  engine               = "redis"
  node_type            = var.node_type
  num_cache_nodes      = var.nodes
  parameter_group_name = var.parameter_group_name
  engine_version       = var.engine_version
  port                 = var.port
  subnet_group_name    = aws_elasticache_subnet_group.main_cache_subnets.name
}
