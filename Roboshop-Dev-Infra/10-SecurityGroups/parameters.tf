resource "aws_ssm_parameter" "sg_ids" {
  count = length(var.sg_name)
  name = "/${var.project}/${var.environment}/sg/${var.sg_name[count.index]}"
  value = module.main[count.index].sg_ids
  type = "String"
  overwrite = true
}