data "template_file" "step1" {
  template = file("./files/stepfunction1.json")

  vars = {
    steparn = "${module.step2.state_machine_arn}"
  }
}

data "template_file" "step2" {
  template = file("./files/stepfunction2.json")

  vars = {
    lambda1  = module.lambda1.lambda_arn
    lambda2  = module.lambda2.lambda_arn
  }
}

module "lambda1" {
  source      = "./lambda"
  lambda_name = "lambda1"
}

module "lambda2" {
  source      = "./lambda"
  lambda_name = "lambda2"
}


module "step1" {
  source                   = "./stepfunction"
  step_name                = "step1"
  step_function_definition = data.template_file.step1.rendered
}

module "step2" {
  source                   = "./stepfunction"
  step_name                = "step2"
  step_function_definition = data.template_file.step2.rendered
}
