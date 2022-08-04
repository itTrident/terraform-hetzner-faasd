# faasd for Hetzner

This repo contains a Terraform Module for how to deploy a [faasd](https://github.com/openfaas/faasd) instance on the
[Hetzner](https://www.hetzner.com/) using [Terraform](https://www.terraform.io/).

__faasd__, a lightweight & portable faas engine, is [OpenFaaS](https://github.com/openfaas/) reimagined, but without the cost and complexity of Kubernetes. It runs on a single host with very modest requirements, making it fast and easy to manage. Under the hood it uses [containerd](https://containerd.io/) and [Container Networking Interface (CNI)](https://github.com/containernetworking/cni) along with the same core OpenFaaS components from the main project.

## What's a Terraform Module?

A Terraform Module refers to a self-contained packages of Terraform configurations that are managed as a group. This repo
is a Terraform Module and contains many "submodules" which can be composed together to create useful infrastructure patterns.

## How do you use this module?

This repository defines a [Terraform module](https://www.terraform.io/docs/modules/usage.html), which you can use in your
code by adding a `module` configuration and setting its `source` parameter to URL of this repository:

```hcl
module "hetzner" {
  source = "https://github.com/itTrident/terraform-hetzner-faasd"
  name   = "hetzner"
}
```

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.2.6 |
| hetzner | >= 1.35.1 |
| random | >= 3.3.2 |

## Providers

| Name | Version |
|------|---------|
| hetzner | >= 1.35.1 |
| random | >= 3.3.2 |

## Resources

| Name | Type |
|------|------|
| [hcloud_ssh_key](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/ssh_key) | resource |
| [hcloud_firewall](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/firewall) | resource |
| [hcloud_server](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/server) | resource |
| [hcloud_volume](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/volume) | resource |
| [hcloud_floating_ip](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/primary_ip) | resource |


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| basic\_auth\_password | The basic auth password, if left empty, a random password is generated. | `string` | `null` | no |
| basic\_auth\_user | The basic auth user name. | `string` | `""` | no |
| domain | A public domain for the faasd instance. This will be consumed by Caddy and install a Let's Encrypt certificate. | `string` | `""` | no |
| email | Email used to order a certificate from Let's Encrypt | `string` | `""` | no |
| hcloud\_api\_key | API key for hetzner. | `string` | `""` | no |
| location | The name of the location to deploy the faasd into. | `string` | `""` | no |
| os_type | The name is to set the os_type. | `string` | `""` | yes |
| server_type | The server type to use for the server. | `string` | `""` | yes |
| name | The name of the faasd instance. | `string` | `""` | yes |
| labels | A map of key/value labels. | `map` | `""` | yes |
| port | Assign the port number and protocall to allow in Firewall Rules | `number` | `""` | no |
| ssh_key_name | Key name of the Key Pair to use for the instance. | `string` | `""` | yes |
| ssh_pub_key | Public Key Pair to use for the instance. | `string` | `""` | yes |
| volume_name | The name of the volume. | `string` | `""` | yes |
| volume_size | The size of the volume. | `number` | `""` | yes |
| volume_format | The format of the volume. | `string` | `""` | yes |
| ip_type | The ip type of the volume. | `string` | `""` | yes |

## Outputs

| Name | Description |
|------|-------------|
| basic\_auth\_password | The basic auth password. |
| basic\_auth\_user | The basic auth user name. |
| gateway\_url | The url of the faasd gateway |
| ipv4\_address | The public IP address of the faasd instance |

## See Also

- [faasd on Amazon Web Services with Terraform](https://github.com/jsiebens/terraform-aws-faasd)
- [faasd on Google Cloud Platform with Terraform](https://github.com/jsiebens/terraform-google-faasd)
- [faasd on Microsoft Azure with Terraform](https://github.com/jsiebens/terraform-azurerm-faasd)
- [faasd on DigitalOcean with Terraform](https://github.com/jsiebens/terraform-digitalocean-faasd)
- [faasd on Equinix Metal with Terraform](https://github.com/jsiebens/terraform-equinix-faasd)
- [faasd on Scaleway with Terraform](https://github.com/jsiebens/terraform-scaleway-faasd)
- [faasd on Vultr with Terraform](https://github.com/itTrident/terraform-vultr-faasd)
- [faasd on Linode with Terraform](https://github.com/itTrident/terraform-linode-faasd)
- [faasd on Exoscale with Terraform](https://github.com/itTrident/terraform-exoscale-faasd)
