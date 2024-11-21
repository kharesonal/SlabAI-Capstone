output "aks_cluster_id" {
  description = "Cluster IP"
  value = module.aks_cluster.aks_cluster_id
}


# output "lb_id" {
#   description = "LoadBalancer ID"
#   value = module.network_lb.lb_id
# }

# output "frontend_ip" {
#   description = "FrontEnd IP"
#   value = module.network_lb.frontend_ip
# }