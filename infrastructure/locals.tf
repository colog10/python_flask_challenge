locals {
  project           = "flask-chllge"
  region            = "us-east-1"
  environment       = "test"
  ecs_instance_type = "t3.medium"
  ecs_max_size      = 1
  ecs_min_size      = 1
  ecs_desired_size  = 1
  ec2_public_key    = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDkNRh6b6RRwvFcRpaKJuB+iVyPJ1nvAB6R9lJPBOWCn0V37d3LuK7/Z4ICUQbY6hwiSsNpHLirKYUmX6KSalawcsoUlG1YN2/lTs5AcXqmTF5t/fMEdQVgnKy9wKtPCrY4iXjm1xJyQmv42RrH3RMNiLnTaRrQSHtiwYQmNtUcfRtYamkQa1Csc7LUfg9MBKogNXYyEyHwlYk7vqfdnAQeSl7AIi+tVmtS5t4GtBtYQXs/DLZlRimU1KNtQA1MDBs7keRs/Vjfo+gnDuHoA8vZd/QAAaQTIL5VchcjJ3qkP2WRtKl2s8Z2Y+nAtxMfBSxmnNciy9MeGyrqgsP0y0+10j2YKf2Hkb+GWvpG1QnGEAf2+34Wv8EZx7Oe2cyLQ3hlETuCxAS5TfrGC7ATzJ/I6p5ZwY4JuNtwl2PTronKrq/3a4i8R1CuGnYZ0XQR82YrI8BCFz26A3+vrDZ6BYLYsgyPWwRoDo9INAYNEWjfQp1quzhiLdYfdZbDUSonMmMGe2U39s13U59Epl+w1W8yXIKWYi3q1Tf0a2H9oVwfe0OVfN3X8V1jGML8CLv6OU6Ew6F5Br73xukBOZzvRyAIrlCj7mBRKXxmILYX3Yr9aM786h1RQkiAorN26MYwg+giYmhx+Ihva/DSqVHkrntG9w6fiHYWJqlU/oUZCIDuGw=="
  tags = {
    terraform   = true
    environment = "test"
  }
}