Run echo "=== Testing AWS EC2 plugin inventory discovery ==="
  echo "=== Testing AWS EC2 plugin inventory discovery ==="
  ansible-inventory -i aws_ec2.yml --list
  echo ""
  echo "=== Available groups ==="
  ansible-inventory -i aws_ec2.yml --graph
  shell: /usr/bin/bash -e {0}
  env:
    TF_VERSION: 1.5.0
    AWS_REGION: eu-north-1
    TERRAFORM_CLI_PATH: /home/runner/work/_temp/b07dc59e-c8a1-470c-9758-3b6f7b5d480c
    AWS_DEFAULT_REGION: eu-north-1
    AWS_ACCESS_KEY_ID: ***
    AWS_SECRET_ACCESS_KEY: ***
=== Testing AWS EC2 plugin inventory discovery ===
Warning: : Deprecation warnings can be disabled by setting `deprecation_warnings=False` in ansible.cfg.
[DEPRECATION WARNING]: Passing `disable_lookups` to `template` is deprecated. This feature will be removed from ansible-core version 2.23.
Warning: : Found variable using reserved name 'tags'.
Origin: <unknown>

tags

{
    "_meta": {
        "hostvars": {
            "10.0.1.186": {
                "ami_launch_index": 0,
                "ansible_host": {
                    "__ansible_unsafe": "10.0.1.186"
                },
                "architecture": {
                    "__ansible_unsafe": "x86_64"
                },
                "block_device_mappings": [
                    {
                        "device_name": {
                            "__ansible_unsafe": "/dev/xvda"
                        },
                        "ebs": {
                            "attach_time": "2025-09-24T12:34:52+00:00",
                            "delete_on_termination": true,
                            "status": {
                                "__ansible_unsafe": "attached"
                            },
                            "volume_id": {
                                "__ansible_unsafe": "vol-0d65907ff8002755f"
                            }
                        }
                    }
                ],
                "boot_mode": {
                    "__ansible_unsafe": "uefi-preferred"
                },
                "capacity_reservation_specification": {
                    "capacity_reservation_preference": {
                        "__ansible_unsafe": "open"
                    }
                },
                "client_token": {
                    "__ansible_unsafe": "terraform-20250924123447967300000001"
                },
                "cpu_options": {
                    "core_count": 1,
                    "threads_per_core": 2
                },
                "current_instance_boot_mode": {
                    "__ansible_unsafe": "uefi"
                },
                "docker_packages": [
                    "docker",
                    "docker-compose"
                ],
                "docker_service_enabled": true,
                "docker_service_state": "started",
                "ebs_optimized": false,
                "ec2_instance_type": {
                    "__ansible_unsafe": "t3.small"
                },
                "ec2_placement_az": {
                    "__ansible_unsafe": "eu-north-1a"
                },
                "ec2_state": {
                    "__ansible_unsafe": "running"
                },
                "ec2_subnet_id": {
                    "__ansible_unsafe": "subnet-0f04fb6df894d655f"
                },
                "ec2_vpc_id": {
                    "__ansible_unsafe": "vpc-0a0ff970e25a02bca"
                },
                "ena_support": true,
                "enclave_options": {
                    "enabled": false
                },
                "hibernation_options": {
                    "configured": false
                },
                "hypervisor": {
                    "__ansible_unsafe": "xen"
                },
                "iam_instance_profile": {
                    "arn": {
                        "__ansible_unsafe": "arn:aws:iam::370924439159:instance-profile/clofresva-skalbara-upg02-dev-bastion-profile"
                    },
                    "id": {
                        "__ansible_unsafe": "AIPAVMXGRYZ3Q3HZPBAAS"
                    }
                },
                "image_id": {
                    "__ansible_unsafe": "ami-02ea8477fb546422e"
                },
                "instance_id": {
                    "__ansible_unsafe": "i-0dc0cfef7a46a779b"
                },
                "instance_type": {
                    "__ansible_unsafe": "t3.small"
                },
                "key_name": {
                    "__ansible_unsafe": "clo_ec2_001"
                },
                "launch_time": "2025-09-24T12:34:51+00:00",
                "maintenance_options": {
                    "auto_recovery": {
                        "__ansible_unsafe": "default"
                    },
                    "reboot_migration": {
                        "__ansible_unsafe": "default"
                    }
                },
                "metadata_options": {
                    "http_endpoint": {
                        "__ansible_unsafe": "enabled"
                    },
                    "http_protocol_ipv6": {
                        "__ansible_unsafe": "disabled"
                    },
                    "http_put_response_hop_limit": 2,
                    "http_tokens": {
                        "__ansible_unsafe": "required"
                    },
                    "instance_metadata_tags": {
                        "__ansible_unsafe": "disabled"
                    },
                    "state": {
                        "__ansible_unsafe": "applied"
                    }
                },
                "monitoring": {
                    "state": {
                        "__ansible_unsafe": "disabled"
                    }
                },
                "network_interfaces": [
                    {
                        "association": {
                            "ip_owner_id": {
                                "__ansible_unsafe": "370924439159"
                            },
                            "public_dns_name": {
                                "__ansible_unsafe": "ec2-13-49-62-18.eu-north-1.compute.amazonaws.com"
                            },
                            "public_ip": {
                                "__ansible_unsafe": "13.49.62.18"
                            }
                        },
                        "attachment": {
                            "attach_time": "2025-09-24T12:34:51+00:00",
                            "attachment_id": {
                                "__ansible_unsafe": "eni-attach-08f9de3a8b59572ab"
                            },
                            "delete_on_termination": true,
                            "device_index": 0,
                            "network_card_index": 0,
                            "status": {
                                "__ansible_unsafe": "attached"
                            }
                        },
                        "description": {
                            "__ansible_unsafe": ""
                        },
                        "groups": [
                            {
                                "group_id": {
                                    "__ansible_unsafe": "sg-0b395f513a06e83c1"
                                },
                                "group_name": {
                                    "__ansible_unsafe": "clofresva-skalbara-upg02-bastion-sg20250924102529269900000002"
                                }
                            }
                        ],
                        "interface_type": {
                            "__ansible_unsafe": "interface"
                        },
                        "ipv6_addresses": [],
                        "mac_address": {
                            "__ansible_unsafe": "06:b0:03:a3:d6:51"
                        },
                        "network_interface_id": {
                            "__ansible_unsafe": "eni-0bc14d435625bf201"
                        },
                        "operator": {
                            "managed": false
                        },
                        "owner_id": {
                            "__ansible_unsafe": "370924439159"
                        },
                        "private_dns_name": {
                            "__ansible_unsafe": "ip-10-0-1-186.eu-north-1.compute.internal"
                        },
                        "private_ip_address": {
                            "__ansible_unsafe": "10.0.1.186"
                        },
                        "private_ip_addresses": [
                            {
                                "association": {
                                    "ip_owner_id": {
                                        "__ansible_unsafe": "370924439159"
                                    },
                                    "public_dns_name": {
                                        "__ansible_unsafe": "ec2-13-49-62-18.eu-north-1.compute.amazonaws.com"
                                    },
                                    "public_ip": {
                                        "__ansible_unsafe": "13.49.62.18"
                                    }
                                },
                                "primary": true,
                                "private_dns_name": {
                                    "__ansible_unsafe": "ip-10-0-1-186.eu-north-1.compute.internal"
                                },
                                "private_ip_address": {
                                    "__ansible_unsafe": "10.0.1.186"
                                }
                            }
                        ],
                        "source_dest_check": true,
                        "status": {
                            "__ansible_unsafe": "in-use"
                        },
                        "subnet_id": {
                            "__ansible_unsafe": "subnet-0f04fb6df894d655f"
                        },
                        "vpc_id": {
                            "__ansible_unsafe": "vpc-0a0ff970e25a02bca"
                        }
                    }
                ],
                "network_performance_options": {
                    "bandwidth_weighting": {
                        "__ansible_unsafe": "default"
                    }
                },
                "operator": {
                    "managed": false
                },
                "owner_id": {
                    "__ansible_unsafe": "370924439159"
                },
                "placement": {
                    "availability_zone": {
                        "__ansible_unsafe": "eu-north-1a"
                    },
                    "availability_zone_id": {
                        "__ansible_unsafe": "eun1-az1"
                    },
                    "group_name": {
                        "__ansible_unsafe": ""
                    },
                    "region": {
                        "__ansible_unsafe": "eu-north-1"
                    },
                    "tenancy": {
                        "__ansible_unsafe": "default"
                    }
                },
                "platform_details": {
                    "__ansible_unsafe": "Linux/UNIX"
                },
                "private_dns_name": {
                    "__ansible_unsafe": "ip-10-0-1-186.eu-north-1.compute.internal"
                },
                "private_dns_name_options": {
                    "enable_resource_name_dns_a_record": true,
                    "enable_resource_name_dns_aaaa_record": false,
                    "hostname_type": {
                        "__ansible_unsafe": "ip-name"
                    }
                },
                "private_ip_address": {
                    "__ansible_unsafe": "10.0.1.186"
                },
                "product_codes": [],
                "public_dns_name": {
                    "__ansible_unsafe": "ec2-13-49-62-18.eu-north-1.compute.amazonaws.com"
                },
                "public_ip_address": {
                    "__ansible_unsafe": "13.49.62.18"
                },
                "requester_id": {
                    "__ansible_unsafe": ""
                },
                "reservation_id": {
                    "__ansible_unsafe": "r-08958cd976e367825"
                },
                "root_device_name": {
                    "__ansible_unsafe": "/dev/xvda"
                },
                "root_device_type": {
                    "__ansible_unsafe": "ebs"
                },
                "security_groups": [
                    {
                        "group_id": {
                            "__ansible_unsafe": "sg-0b395f513a06e83c1"
                        },
                        "group_name": {
                            "__ansible_unsafe": "clofresva-skalbara-upg02-bastion-sg20250924102529269900000002"
                        }
                    }
                ],
                "source_dest_check": true,
                "state": {
                    "code": 16,
                    "name": {
                        "__ansible_unsafe": "running"
                    }
                },
                "state_transition_reason": {
                    "__ansible_unsafe": ""
                },
                "subnet_id": {
                    "__ansible_unsafe": "subnet-0f04fb6df894d655f"
                },
                "swarm_advertise_addr": "{{ ansible_default_ipv4.address }}",
                "swarm_network_interface": "eth0",
                "swarm_ports": [
                    "2377/tcp",
                    "7946/tcp",
                    "7946/udp",
                    "4789/udp"
                ],
                "tags": {
                    "Environment": {
                        "__ansible_unsafe": "dev"
                    },
                    "ManagedBy": {
                        "__ansible_unsafe": "terraform"
                    },
                    "Name": {
                        "__ansible_unsafe": "clofresva-skalbara-upg02-dev-bastion"
                    },
                    "Project": {
                        "__ansible_unsafe": "clofresva-skalbara-upg02"
                    },
                    "Role": {
                        "__ansible_unsafe": "bastion"
                    },
                    "Type": {
                        "__ansible_unsafe": "bastion"
                    }
                },
                "timezone": "Europe/Stockholm",
                "usage_operation": {
                    "__ansible_unsafe": "RunInstances"
                },
                "usage_operation_update_time": "2025-09-24T12:34:51+00:00",
                "virtualization_type": {
                    "__ansible_unsafe": "hvm"
                },
                "vpc_id": {
                    "__ansible_unsafe": "vpc-0a0ff970e25a02bca"
                }
            },
            "10.0.10.126": {
                "ami_launch_index": 0,
                "ansible_host": {
                    "__ansible_unsafe": "10.0.10.126"
                },
                "architecture": {
                    "__ansible_unsafe": "x86_64"
                },
                "block_device_mappings": [
                    {
                        "device_name": {
                            "__ansible_unsafe": "/dev/xvda"
                        },
                        "ebs": {
                            "attach_time": "2025-09-24T12:21:08+00:00",
                            "delete_on_termination": true,
                            "status": {
                                "__ansible_unsafe": "attached"
                            },
                            "volume_id": {
                                "__ansible_unsafe": "vol-0c254eb4db8e3b9e8"
                            }
                        }
                    }
                ],
                "boot_mode": {
                    "__ansible_unsafe": "uefi-preferred"
                },
                "capacity_reservation_specification": {
                    "capacity_reservation_preference": {
                        "__ansible_unsafe": "open"
                    }
                },
                "client_token": {
                    "__ansible_unsafe": "terraform-20250924122107440900000004"
                },
                "cpu_options": {
                    "core_count": 1,
                    "threads_per_core": 2
                },
                "current_instance_boot_mode": {
                    "__ansible_unsafe": "uefi"
                },
                "docker_packages": [
                    "docker",
                    "docker-compose"
                ],
                "docker_service_enabled": true,
                "docker_service_state": "started",
                "ebs_optimized": false,
                "ec2_instance_type": {
                    "__ansible_unsafe": "t3.small"
                },
                "ec2_placement_az": {
                    "__ansible_unsafe": "eu-north-1a"
                },
                "ec2_state": {
                    "__ansible_unsafe": "running"
                },
                "ec2_subnet_id": {
                    "__ansible_unsafe": "subnet-0b88c63031fe8599b"
                },
                "ec2_vpc_id": {
                    "__ansible_unsafe": "vpc-0a0ff970e25a02bca"
                },
                "ena_support": true,
                "enclave_options": {
                    "enabled": false
                },
                "hibernation_options": {
                    "configured": false
                },
                "hypervisor": {
                    "__ansible_unsafe": "xen"
                },
                "image_id": {
                    "__ansible_unsafe": "ami-02ea8477fb546422e"
                },
                "instance_id": {
                    "__ansible_unsafe": "i-0aa029c0c3e8bbaef"
                },
                "instance_type": {
                    "__ansible_unsafe": "t3.small"
                },
                "key_name": {
                    "__ansible_unsafe": "clo_ec2_001"
                },
                "launch_time": "2025-09-24T12:21:08+00:00",
                "maintenance_options": {
                    "auto_recovery": {
                        "__ansible_unsafe": "default"
                    },
                    "reboot_migration": {
                        "__ansible_unsafe": "default"
                    }
                },
                "metadata_options": {
                    "http_endpoint": {
                        "__ansible_unsafe": "enabled"
                    },
                    "http_protocol_ipv6": {
                        "__ansible_unsafe": "disabled"
                    },
                    "http_put_response_hop_limit": 2,
                    "http_tokens": {
                        "__ansible_unsafe": "required"
                    },
                    "instance_metadata_tags": {
                        "__ansible_unsafe": "disabled"
                    },
                    "state": {
                        "__ansible_unsafe": "applied"
                    }
                },
                "monitoring": {
                    "state": {
                        "__ansible_unsafe": "disabled"
                    }
                },
                "network_interfaces": [
                    {
                        "attachment": {
                            "attach_time": "2025-09-24T12:21:08+00:00",
                            "attachment_id": {
                                "__ansible_unsafe": "eni-attach-0f34fefc4f8535382"
                            },
                            "delete_on_termination": true,
                            "device_index": 0,
                            "network_card_index": 0,
                            "status": {
                                "__ansible_unsafe": "attached"
                            }
                        },
                        "description": {
                            "__ansible_unsafe": ""
                        },
                        "groups": [
                            {
                                "group_id": {
                                    "__ansible_unsafe": "sg-0b57e8ce3a5dc2a0e"
                                },
                                "group_name": {
                                    "__ansible_unsafe": "clofresva-skalbara-upg02-web-sg20250924102533616200000004"
                                }
                            }
                        ],
                        "interface_type": {
                            "__ansible_unsafe": "interface"
                        },
                        "ipv6_addresses": [],
                        "mac_address": {
                            "__ansible_unsafe": "06:81:00:e4:56:91"
                        },
                        "network_interface_id": {
                            "__ansible_unsafe": "eni-0248f4135d0d16b42"
                        },
                        "operator": {
                            "managed": false
                        },
                        "owner_id": {
                            "__ansible_unsafe": "370924439159"
                        },
                        "private_dns_name": {
                            "__ansible_unsafe": "ip-10-0-10-126.eu-north-1.compute.internal"
                        },
                        "private_ip_address": {
                            "__ansible_unsafe": "10.0.10.126"
                        },
                        "private_ip_addresses": [
                            {
                                "primary": true,
                                "private_dns_name": {
                                    "__ansible_unsafe": "ip-10-0-10-126.eu-north-1.compute.internal"
                                },
                                "private_ip_address": {
                                    "__ansible_unsafe": "10.0.10.126"
                                }
                            }
                        ],
                        "source_dest_check": true,
                        "status": {
                            "__ansible_unsafe": "in-use"
                        },
                        "subnet_id": {
                            "__ansible_unsafe": "subnet-0b88c63031fe8599b"
                        },
                        "vpc_id": {
                            "__ansible_unsafe": "vpc-0a0ff970e25a02bca"
                        }
                    }
                ],
                "network_performance_options": {
                    "bandwidth_weighting": {
                        "__ansible_unsafe": "default"
                    }
                },
                "operator": {
                    "managed": false
                },
                "owner_id": {
                    "__ansible_unsafe": "370924439159"
                },
                "placement": {
                    "availability_zone": {
                        "__ansible_unsafe": "eu-north-1a"
                    },
                    "availability_zone_id": {
                        "__ansible_unsafe": "eun1-az1"
                    },
                    "group_name": {
                        "__ansible_unsafe": ""
                    },
                    "region": {
                        "__ansible_unsafe": "eu-north-1"
                    },
                    "tenancy": {
                        "__ansible_unsafe": "default"
                    }
                },
                "platform_details": {
                    "__ansible_unsafe": "Linux/UNIX"
                },
                "private_dns_name": {
                    "__ansible_unsafe": "ip-10-0-10-126.eu-north-1.compute.internal"
                },
                "private_dns_name_options": {
                    "enable_resource_name_dns_a_record": false,
                    "enable_resource_name_dns_aaaa_record": false,
                    "hostname_type": {
                        "__ansible_unsafe": "ip-name"
                    }
                },
                "private_ip_address": {
                    "__ansible_unsafe": "10.0.10.126"
                },
                "product_codes": [],
                "public_dns_name": {
                    "__ansible_unsafe": ""
                },
                "requester_id": {
                    "__ansible_unsafe": ""
                },
                "reservation_id": {
                    "__ansible_unsafe": "r-04cc2f9a9643e1e2c"
                },
                "root_device_name": {
                    "__ansible_unsafe": "/dev/xvda"
                },
                "root_device_type": {
                    "__ansible_unsafe": "ebs"
                },
                "security_groups": [
                    {
                        "group_id": {
                            "__ansible_unsafe": "sg-0b57e8ce3a5dc2a0e"
                        },
                        "group_name": {
                            "__ansible_unsafe": "clofresva-skalbara-upg02-web-sg20250924102533616200000004"
                        }
                    }
                ],
                "source_dest_check": true,
                "state": {
                    "code": 16,
                    "name": {
                        "__ansible_unsafe": "running"
                    }
                },
                "state_transition_reason": {
                    "__ansible_unsafe": ""
                },
                "subnet_id": {
                    "__ansible_unsafe": "subnet-0b88c63031fe8599b"
                },
                "swarm_advertise_addr": "{{ ansible_default_ipv4.address }}",
                "swarm_network_interface": "eth0",
                "swarm_ports": [
                    "2377/tcp",
                    "7946/tcp",
                    "7946/udp",
                    "4789/udp"
                ],
                "tags": {
                    "Environment": {
                        "__ansible_unsafe": "dev"
                    },
                    "ManagedBy": {
                        "__ansible_unsafe": "terraform"
                    },
                    "Name": {
                        "__ansible_unsafe": "clofresva-skalbara-upg02-swarm-worker-1"
                    },
                    "Project": {
                        "__ansible_unsafe": "clofresva-skalbara-upg02"
                    },
                    "Rebuild": {
                        "__ansible_unsafe": "ssh-fix-20250924"
                    },
                    "Role": {
                        "__ansible_unsafe": "swarm-worker"
                    },
                    "Type": {
                        "__ansible_unsafe": "docker-swarm"
                    }
                },
                "timezone": "Europe/Stockholm",
                "usage_operation": {
                    "__ansible_unsafe": "RunInstances"
                },
                "usage_operation_update_time": "2025-09-24T12:21:08+00:00",
                "virtualization_type": {
                    "__ansible_unsafe": "hvm"
                },
                "vpc_id": {
                    "__ansible_unsafe": "vpc-0a0ff970e25a02bca"
                }
            },
            "10.0.10.232": {
                "ami_launch_index": 0,
                "ansible_host": {
                    "__ansible_unsafe": "10.0.10.232"
                },
                "architecture": {
                    "__ansible_unsafe": "x86_64"
                },
                "block_device_mappings": [
                    {
                        "device_name": {
                            "__ansible_unsafe": "/dev/xvda"
                        },
                        "ebs": {
                            "attach_time": "2025-09-24T12:21:08+00:00",
                            "delete_on_termination": true,
                            "status": {
                                "__ansible_unsafe": "attached"
                            },
                            "volume_id": {
                                "__ansible_unsafe": "vol-0c0b63927f0898335"
                            }
                        }
                    }
                ],
                "boot_mode": {
                    "__ansible_unsafe": "uefi-preferred"
                },
                "capacity_reservation_specification": {
                    "capacity_reservation_preference": {
                        "__ansible_unsafe": "open"
                    }
                },
                "client_token": {
                    "__ansible_unsafe": "terraform-20250924122107440500000003"
                },
                "cpu_options": {
                    "core_count": 1,
                    "threads_per_core": 2
                },
                "current_instance_boot_mode": {
                    "__ansible_unsafe": "uefi"
                },
                "docker_packages": [
                    "docker",
                    "docker-compose"
                ],
                "docker_service_enabled": true,
                "docker_service_state": "started",
                "ebs_optimized": false,
                "ec2_instance_type": {
                    "__ansible_unsafe": "t3.small"
                },
                "ec2_placement_az": {
                    "__ansible_unsafe": "eu-north-1a"
                },
                "ec2_state": {
                    "__ansible_unsafe": "running"
                },
                "ec2_subnet_id": {
                    "__ansible_unsafe": "subnet-0b88c63031fe8599b"
                },
                "ec2_vpc_id": {
                    "__ansible_unsafe": "vpc-0a0ff970e25a02bca"
                },
                "ena_support": true,
                "enclave_options": {
                    "enabled": false
                },
                "hibernation_options": {
                    "configured": false
                },
                "hypervisor": {
                    "__ansible_unsafe": "xen"
                },
                "image_id": {
                    "__ansible_unsafe": "ami-02ea8477fb546422e"
                },
                "instance_id": {
                    "__ansible_unsafe": "i-0e3a2cde2cf2d5b7f"
                },
                "instance_type": {
                    "__ansible_unsafe": "t3.small"
                },
                "key_name": {
                    "__ansible_unsafe": "clo_ec2_001"
                },
                "launch_time": "2025-09-24T12:21:08+00:00",
                "maintenance_options": {
                    "auto_recovery": {
                        "__ansible_unsafe": "default"
                    },
                    "reboot_migration": {
                        "__ansible_unsafe": "default"
                    }
                },
                "metadata_options": {
                    "http_endpoint": {
                        "__ansible_unsafe": "enabled"
                    },
                    "http_protocol_ipv6": {
                        "__ansible_unsafe": "disabled"
                    },
                    "http_put_response_hop_limit": 2,
                    "http_tokens": {
                        "__ansible_unsafe": "required"
                    },
                    "instance_metadata_tags": {
                        "__ansible_unsafe": "disabled"
                    },
                    "state": {
                        "__ansible_unsafe": "applied"
                    }
                },
                "monitoring": {
                    "state": {
                        "__ansible_unsafe": "disabled"
                    }
                },
                "network_interfaces": [
                    {
                        "attachment": {
                            "attach_time": "2025-09-24T12:21:08+00:00",
                            "attachment_id": {
                                "__ansible_unsafe": "eni-attach-0df5f0d3e6476345b"
                            },
                            "delete_on_termination": true,
                            "device_index": 0,
                            "network_card_index": 0,
                            "status": {
                                "__ansible_unsafe": "attached"
                            }
                        },
                        "description": {
                            "__ansible_unsafe": ""
                        },
                        "groups": [
                            {
                                "group_id": {
                                    "__ansible_unsafe": "sg-0b57e8ce3a5dc2a0e"
                                },
                                "group_name": {
                                    "__ansible_unsafe": "clofresva-skalbara-upg02-web-sg20250924102533616200000004"
                                }
                            }
                        ],
                        "interface_type": {
                            "__ansible_unsafe": "interface"
                        },
                        "ipv6_addresses": [],
                        "mac_address": {
                            "__ansible_unsafe": "06:4d:4b:91:3b:3f"
                        },
                        "network_interface_id": {
                            "__ansible_unsafe": "eni-024136e3a9247e495"
                        },
                        "operator": {
                            "managed": false
                        },
                        "owner_id": {
                            "__ansible_unsafe": "370924439159"
                        },
                        "private_dns_name": {
                            "__ansible_unsafe": "ip-10-0-10-232.eu-north-1.compute.internal"
                        },
                        "private_ip_address": {
                            "__ansible_unsafe": "10.0.10.232"
                        },
                        "private_ip_addresses": [
                            {
                                "primary": true,
                                "private_dns_name": {
                                    "__ansible_unsafe": "ip-10-0-10-232.eu-north-1.compute.internal"
                                },
                                "private_ip_address": {
                                    "__ansible_unsafe": "10.0.10.232"
                                }
                            }
                        ],
                        "source_dest_check": true,
                        "status": {
                            "__ansible_unsafe": "in-use"
                        },
                        "subnet_id": {
                            "__ansible_unsafe": "subnet-0b88c63031fe8599b"
                        },
                        "vpc_id": {
                            "__ansible_unsafe": "vpc-0a0ff970e25a02bca"
                        }
                    }
                ],
                "network_performance_options": {
                    "bandwidth_weighting": {
                        "__ansible_unsafe": "default"
                    }
                },
                "operator": {
                    "managed": false
                },
                "owner_id": {
                    "__ansible_unsafe": "370924439159"
                },
                "placement": {
                    "availability_zone": {
                        "__ansible_unsafe": "eu-north-1a"
                    },
                    "availability_zone_id": {
                        "__ansible_unsafe": "eun1-az1"
                    },
                    "group_name": {
                        "__ansible_unsafe": ""
                    },
                    "region": {
                        "__ansible_unsafe": "eu-north-1"
                    },
                    "tenancy": {
                        "__ansible_unsafe": "default"
                    }
                },
                "platform_details": {
                    "__ansible_unsafe": "Linux/UNIX"
                },
                "private_dns_name": {
                    "__ansible_unsafe": "ip-10-0-10-232.eu-north-1.compute.internal"
                },
                "private_dns_name_options": {
                    "enable_resource_name_dns_a_record": false,
                    "enable_resource_name_dns_aaaa_record": false,
                    "hostname_type": {
                        "__ansible_unsafe": "ip-name"
                    }
                },
                "private_ip_address": {
                    "__ansible_unsafe": "10.0.10.232"
                },
                "product_codes": [],
                "public_dns_name": {
                    "__ansible_unsafe": ""
                },
                "requester_id": {
                    "__ansible_unsafe": ""
                },
                "reservation_id": {
                    "__ansible_unsafe": "r-0969bc459a897b7d9"
                },
                "root_device_name": {
                    "__ansible_unsafe": "/dev/xvda"
                },
                "root_device_type": {
                    "__ansible_unsafe": "ebs"
                },
                "security_groups": [
                    {
                        "group_id": {
                            "__ansible_unsafe": "sg-0b57e8ce3a5dc2a0e"
                        },
                        "group_name": {
                            "__ansible_unsafe": "clofresva-skalbara-upg02-web-sg20250924102533616200000004"
                        }
                    }
                ],
                "source_dest_check": true,
                "state": {
                    "code": 16,
                    "name": {
                        "__ansible_unsafe": "running"
                    }
                },
                "state_transition_reason": {
                    "__ansible_unsafe": ""
                },
                "subnet_id": {
                    "__ansible_unsafe": "subnet-0b88c63031fe8599b"
                },
                "swarm_advertise_addr": "{{ ansible_default_ipv4.address }}",
                "swarm_network_interface": "eth0",
                "swarm_ports": [
                    "2377/tcp",
                    "7946/tcp",
                    "7946/udp",
                    "4789/udp"
                ],
                "tags": {
                    "Environment": {
                        "__ansible_unsafe": "dev"
                    },
                    "ManagedBy": {
                        "__ansible_unsafe": "terraform"
                    },
                    "Name": {
                        "__ansible_unsafe": "clofresva-skalbara-upg02-swarm-manager-1"
                    },
                    "Project": {
                        "__ansible_unsafe": "clofresva-skalbara-upg02"
                    },
                    "Rebuild": {
                        "__ansible_unsafe": "ssh-fix-20250924"
                    },
                    "Role": {
                        "__ansible_unsafe": "swarm-manager"
                    },
                    "Type": {
                        "__ansible_unsafe": "docker-swarm"
                    }
                },
                "timezone": "Europe/Stockholm",
                "usage_operation": {
                    "__ansible_unsafe": "RunInstances"
                },
                "usage_operation_update_time": "2025-09-24T12:21:08+00:00",
                "virtualization_type": {
                    "__ansible_unsafe": "hvm"
                },
                "vpc_id": {
                    "__ansible_unsafe": "vpc-0a0ff970e25a02bca"
                }
            },
            "10.0.11.36": {
                "ami_launch_index": 0,
                "ansible_host": {
                    "__ansible_unsafe": "10.0.11.36"
                },
                "architecture": {
                    "__ansible_unsafe": "x86_64"
                },
                "block_device_mappings": [
                    {
                        "device_name": {
                            "__ansible_unsafe": "/dev/xvda"
                        },
                        "ebs": {
                            "attach_time": "2025-09-24T12:21:08+00:00",
                            "delete_on_termination": true,
                            "status": {
                                "__ansible_unsafe": "attached"
                            },
                            "volume_id": {
                                "__ansible_unsafe": "vol-0ef4d2c3d9c95c6ee"
                            }
                        }
                    }
                ],
                "boot_mode": {
                    "__ansible_unsafe": "uefi-preferred"
                },
                "capacity_reservation_specification": {
                    "capacity_reservation_preference": {
                        "__ansible_unsafe": "open"
                    }
                },
                "client_token": {
                    "__ansible_unsafe": "terraform-20250924122107438700000002"
                },
                "cpu_options": {
                    "core_count": 1,
                    "threads_per_core": 2
                },
                "current_instance_boot_mode": {
                    "__ansible_unsafe": "uefi"
                },
                "docker_packages": [
                    "docker",
                    "docker-compose"
                ],
                "docker_service_enabled": true,
                "docker_service_state": "started",
                "ebs_optimized": false,
                "ec2_instance_type": {
                    "__ansible_unsafe": "t3.small"
                },
                "ec2_placement_az": {
                    "__ansible_unsafe": "eu-north-1b"
                },
                "ec2_state": {
                    "__ansible_unsafe": "running"
                },
                "ec2_subnet_id": {
                    "__ansible_unsafe": "subnet-0e0c501323064c76b"
                },
                "ec2_vpc_id": {
                    "__ansible_unsafe": "vpc-0a0ff970e25a02bca"
                },
                "ena_support": true,
                "enclave_options": {
                    "enabled": false
                },
                "hibernation_options": {
                    "configured": false
                },
                "hypervisor": {
                    "__ansible_unsafe": "xen"
                },
                "image_id": {
                    "__ansible_unsafe": "ami-02ea8477fb546422e"
                },
                "instance_id": {
                    "__ansible_unsafe": "i-0e1543fcacbd78235"
                },
                "instance_type": {
                    "__ansible_unsafe": "t3.small"
                },
                "key_name": {
                    "__ansible_unsafe": "clo_ec2_001"
                },
                "launch_time": "2025-09-24T12:21:08+00:00",
                "maintenance_options": {
                    "auto_recovery": {
                        "__ansible_unsafe": "default"
                    },
                    "reboot_migration": {
                        "__ansible_unsafe": "default"
                    }
                },
                "metadata_options": {
                    "http_endpoint": {
                        "__ansible_unsafe": "enabled"
                    },
                    "http_protocol_ipv6": {
                        "__ansible_unsafe": "disabled"
                    },
                    "http_put_response_hop_limit": 2,
                    "http_tokens": {
                        "__ansible_unsafe": "required"
                    },
                    "instance_metadata_tags": {
                        "__ansible_unsafe": "disabled"
                    },
                    "state": {
                        "__ansible_unsafe": "applied"
                    }
                },
                "monitoring": {
                    "state": {
                        "__ansible_unsafe": "disabled"
                    }
                },
                "network_interfaces": [
                    {
                        "attachment": {
                            "attach_time": "2025-09-24T12:21:08+00:00",
                            "attachment_id": {
                                "__ansible_unsafe": "eni-attach-0f91b6c403b7cf92f"
                            },
                            "delete_on_termination": true,
                            "device_index": 0,
                            "network_card_index": 0,
                            "status": {
                                "__ansible_unsafe": "attached"
                            }
                        },
                        "description": {
                            "__ansible_unsafe": ""
                        },
                        "groups": [
                            {
                                "group_id": {
                                    "__ansible_unsafe": "sg-0b57e8ce3a5dc2a0e"
                                },
                                "group_name": {
                                    "__ansible_unsafe": "clofresva-skalbara-upg02-web-sg20250924102533616200000004"
                                }
                            }
                        ],
                        "interface_type": {
                            "__ansible_unsafe": "interface"
                        },
                        "ipv6_addresses": [],
                        "mac_address": {
                            "__ansible_unsafe": "0a:09:9f:6f:53:37"
                        },
                        "network_interface_id": {
                            "__ansible_unsafe": "eni-0ab4f751a66a05275"
                        },
                        "operator": {
                            "managed": false
                        },
                        "owner_id": {
                            "__ansible_unsafe": "370924439159"
                        },
                        "private_dns_name": {
                            "__ansible_unsafe": "ip-10-0-11-36.eu-north-1.compute.internal"
                        },
                        "private_ip_address": {
                            "__ansible_unsafe": "10.0.11.36"
                        },
                        "private_ip_addresses": [
                            {
                                "primary": true,
                                "private_dns_name": {
                                    "__ansible_unsafe": "ip-10-0-11-36.eu-north-1.compute.internal"
                                },
                                "private_ip_address": {
                                    "__ansible_unsafe": "10.0.11.36"
                                }
                            }
                        ],
                        "source_dest_check": true,
                        "status": {
                            "__ansible_unsafe": "in-use"
                        },
                        "subnet_id": {
                            "__ansible_unsafe": "subnet-0e0c501323064c76b"
                        },
                        "vpc_id": {
                            "__ansible_unsafe": "vpc-0a0ff970e25a02bca"
                        }
                    }
                ],
                "network_performance_options": {
                    "bandwidth_weighting": {
                        "__ansible_unsafe": "default"
                    }
                },
                "operator": {
                    "managed": false
                },
                "owner_id": {
                    "__ansible_unsafe": "370924439159"
                },
                "placement": {
                    "availability_zone": {
                        "__ansible_unsafe": "eu-north-1b"
                    },
                    "availability_zone_id": {
                        "__ansible_unsafe": "eun1-az2"
                    },
                    "group_name": {
                        "__ansible_unsafe": ""
                    },
                    "region": {
                        "__ansible_unsafe": "eu-north-1"
                    },
                    "tenancy": {
                        "__ansible_unsafe": "default"
                    }
                },
                "platform_details": {
                    "__ansible_unsafe": "Linux/UNIX"
                },
                "private_dns_name": {
                    "__ansible_unsafe": "ip-10-0-11-36.eu-north-1.compute.internal"
                },
                "private_dns_name_options": {
                    "enable_resource_name_dns_a_record": false,
                    "enable_resource_name_dns_aaaa_record": false,
                    "hostname_type": {
                        "__ansible_unsafe": "ip-name"
                    }
                },
                "private_ip_address": {
                    "__ansible_unsafe": "10.0.11.36"
                },
                "product_codes": [],
                "public_dns_name": {
                    "__ansible_unsafe": ""
                },
                "requester_id": {
                    "__ansible_unsafe": ""
                },
                "reservation_id": {
                    "__ansible_unsafe": "r-0dedc7199ef135881"
                },
                "root_device_name": {
                    "__ansible_unsafe": "/dev/xvda"
                },
                "root_device_type": {
                    "__ansible_unsafe": "ebs"
                },
                "security_groups": [
                    {
                        "group_id": {
                            "__ansible_unsafe": "sg-0b57e8ce3a5dc2a0e"
                        },
                        "group_name": {
                            "__ansible_unsafe": "clofresva-skalbara-upg02-web-sg20250924102533616200000004"
                        }
                    }
                ],
                "source_dest_check": true,
                "state": {
                    "code": 16,
                    "name": {
                        "__ansible_unsafe": "running"
                    }
                },
                "state_transition_reason": {
                    "__ansible_unsafe": ""
                },
                "subnet_id": {
                    "__ansible_unsafe": "subnet-0e0c501323064c76b"
                },
                "swarm_advertise_addr": "{{ ansible_default_ipv4.address }}",
                "swarm_network_interface": "eth0",
                "swarm_ports": [
                    "2377/tcp",
                    "7946/tcp",
                    "7946/udp",
                    "4789/udp"
                ],
                "tags": {
                    "Environment": {
                        "__ansible_unsafe": "dev"
                    },
                    "ManagedBy": {
                        "__ansible_unsafe": "terraform"
                    },
                    "Name": {
                        "__ansible_unsafe": "clofresva-skalbara-upg02-swarm-worker-2"
                    },
                    "Project": {
                        "__ansible_unsafe": "clofresva-skalbara-upg02"
                    },
                    "Rebuild": {
                        "__ansible_unsafe": "ssh-fix-20250924"
                    },
                    "Role": {
                        "__ansible_unsafe": "swarm-worker"
                    },
                    "Type": {
                        "__ansible_unsafe": "docker-swarm"
                    }
                },
                "timezone": "Europe/Stockholm",
                "usage_operation": {
                    "__ansible_unsafe": "RunInstances"
                },
                "usage_operation_update_time": "2025-09-24T12:21:08+00:00",
                "virtualization_type": {
                    "__ansible_unsafe": "hvm"
                },
                "vpc_id": {
                    "__ansible_unsafe": "vpc-0a0ff970e25a02bca"
                }
            }
        },
        "profile": "inventory_legacy"
    },
    "all": {
        "children": [
            "ungrouped",
            "aws_ec2",
            "tag_Role_swarm_worker",
            "type_t3_small",
            "az_eu_north_1a",
            "tag_Role_bastion",
            "az_eu_north_1b",
            "tag_Role_swarm_manager"
        ]
    },
    "aws_ec2": {
        "hosts": [
            "10.0.10.126",
            "10.0.1.186",
            "10.0.11.36",
            "10.0.10.232"
        ]
    },
    "az_eu_north_1a": {
        "hosts": [
            "10.0.10.126",
            "10.0.1.186",
            "10.0.10.232"
        ]
    },
    "az_eu_north_1b": {
        "hosts": [
            "10.0.11.36"
        ]
    },
    "tag_Role_bastion": {
        "hosts": [
            "10.0.1.186"
        ]
    },
    "tag_Role_swarm_manager": {
        "hosts": [
            "10.0.10.232"
        ]
    },
    "tag_Role_swarm_worker": {
        "hosts": [
            "10.0.10.126",
            "10.0.11.36"
        ]
    },
    "type_t3_small": {
        "hosts": [
            "10.0.10.126",
            "10.0.1.186",
            "10.0.11.36",
            "10.0.10.232"
        ]
    }
}

=== Available groups ===
Warning: : Deprecation warnings can be disabled by setting `deprecation_warnings=False` in ansible.cfg.
[DEPRECATION WARNING]: Passing `disable_lookups` to `template` is deprecated. This feature will be removed from ansible-core version 2.23.
@all:
  |--@ungrouped:
  |--@aws_ec2:
  |  |--10.0.10.126
  |  |--10.0.1.186
  |  |--10.0.11.36
  |  |--10.0.10.232
  |--@tag_Role_swarm_worker:
  |  |--10.0.10.126
  |  |--10.0.11.36
  |--@type_t3_small:
  |  |--10.0.10.126
  |  |--10.0.1.186
  |  |--10.0.11.36
  |  |--10.0.10.232
  |--@az_eu_north_1a:
  |  |--10.0.10.126
  |  |--10.0.1.186
  |  |--10.0.10.232
  |--@tag_Role_bastion:
  |  |--10.0.1.186
  |--@az_eu_north_1b:
  |  |--10.0.11.36
  |--@tag_Role_swarm_manager:
  |  |--10.0.10.232