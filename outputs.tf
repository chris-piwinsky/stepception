output "state_machine_arn_1" {
  value = module.step1.state_machine_arn
}

output "state_machine_arn_2" {
  value = module.step2.state_machine_arn
}

output "lambda1_arn" {
    value = module.lambda1.lambda_arn
}

output "lambda2_arn" {
    value = module.lambda2.lambda_arn
}