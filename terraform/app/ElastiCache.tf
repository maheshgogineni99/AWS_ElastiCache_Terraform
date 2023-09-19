
resource "aws_elasticache_subnet_group" "ElastCacheSubnetGroup" {
  name        = "ElastCacheSubnetGroup"
  description = "ElastCacheSubnetGroup"

  subnet_ids = [var.subnet1, var.subnet2]  # Replace with your subnet IDs
}

resource "aws_elasticache_replication_group" "tf-redis-cluster" {
  count                = length(var.available_regions)
  replication_group_id       = "tf-redis-cluster-${var.env}-${var.available_regions[count.index]}"
  description                = "this is for creating cluster"
  node_type                  = var.node_type
  port                       = 6379
  parameter_group_name       = "default.redis7.cluster.on"    #"cache-params" 
  automatic_failover_enabled = true
  at_rest_encryption_enabled = true
  transit_encryption_enabled = true
  subnet_group_name          = aws_elasticache_subnet_group.ElastCacheSubnetGroup.name
  
  
  num_node_groups = var.nodegroup
  replicas_per_node_group = var.replicapernode

  /*tags = {
    Owner          = "Data Services"
    Service        = "Elastic Cluster Test" 
    Name           = "Test"
    Classification = "Internal"
  }*/

   tags = merge(
    {
      Name = "tf-redis-cluster-${var.env}-${var.available_regions[count.index]}"
      Owner = var.Owner
      Service = var.Service
      Classification = var.Classification
      Environment = var.env
    },
    {
    additionaltag1 = var.additionaltag1
    }
  )
 
}
