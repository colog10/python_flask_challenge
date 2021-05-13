[
  {
    "command": [ ${run_command} ],
    "cpu": ${cpu_units},
    "ulimits": [],
    "memory": ${max_memory},
    "memoryReservation": ${min_memory},
    "name": "${container_name}",
    "image": "${ecr_repo}",
    "essential": true,
    "portMappings": [
        {
          "hostPort": 27017,
          "containerPort": ${app_port_number},
          "protocol": "${app_port_protocol}"
        }
      ],
    "environment": [],
    "logConfiguration": {
      "logDriver": "awslogs",
      "options": {
        "awslogs-group": "${logs_group}",
        "awslogs-region": "${logs_region}",
        "awslogs-stream-prefix": "${logs_stream_prefix}"
      }
    }
  }
]
