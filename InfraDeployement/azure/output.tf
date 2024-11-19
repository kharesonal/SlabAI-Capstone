output "virtual_machine_id" {
  description = "ID of the virtual machine"
  value = module.virttual_machine.virtual_machine
}

output "virtual_machine_ip" {
  description = "IP of the virtual machine"
  value = module.virttual_machine.virtual_machine_ip
}