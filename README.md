<a href="https://opensource.newrelic.com/oss-category/#new-relic-experimental"><picture><source media="(prefers-color-scheme: dark)" srcset="https://github.com/newrelic/opensource-website/raw/main/src/images/categories/dark/Experimental.png"><source media="(prefers-color-scheme: light)" srcset="https://github.com/newrelic/opensource-website/raw/main/src/images/categories/Experimental.png"><img alt="New Relic Open Source experimental project banner." src="https://github.com/newrelic/opensource-website/raw/main/src/images/categories/Experimental.png"></picture></a>

# APM Service Levels with Tags
![GitHub forks](https://img.shields.io/github/forks/newrelic-experimental/newrelic-experimental-FIT-template?style=social)
![GitHub stars](https://img.shields.io/github/stars/newrelic-experimental/newrelic-experimental-FIT-template?style=social)
![GitHub watchers](https://img.shields.io/github/watchers/newrelic-experimental/newrelic-experimental-FIT-template?style=social)

![GitHub all releases](https://img.shields.io/github/downloads/newrelic-experimental/newrelic-experimental-FIT-template/total)
![GitHub release (latest by date)](https://img.shields.io/github/v/release/newrelic-experimental/newrelic-experimental-FIT-template)
![GitHub last commit](https://img.shields.io/github/last-commit/newrelic-experimental/newrelic-experimental-FIT-template)
![GitHub Release Date](https://img.shields.io/github/release-date/newrelic-experimental/newrelic-experimental-FIT-template)


![GitHub issues](https://img.shields.io/github/issues/newrelic-experimental/newrelic-experimental-FIT-template)
![GitHub issues closed](https://img.shields.io/github/issues-closed/newrelic-experimental/newrelic-experimental-FIT-template)
![GitHub pull requests](https://img.shields.io/github/issues-pr/newrelic-experimental/newrelic-experimental-FIT-template)
![GitHub pull requests closed](https://img.shields.io/github/issues-pr-closed/newrelic-experimental/newrelic-experimental-FIT-template)

> This module creates a latency service level and a success rate service level for a service along with corresponding tags. It was written to demonstrate the following:
> * How to create service levels using terraform
> * How to use the newrelic_entity data source to look up entity Guids
> * How to create tags and associate them with service levels
> * Recommended best practices for naming and tagging 

> ### Flow
> 1. Look up the service entity guid using the service name (must be exact)
> 2. Create latency and success category service levels. 
> 3. Add tags for each service level

## Value

|Metrics | Events | Logs | Traces | Visualization | Automation |
|:-:|:-:|:-:|:-:|:-:|:-:|
|:x:|:x:|:x:|:white_check_mark:|:white_check_mark:|:white_check_mark:|

## Installation

> This can run anywhere you have the terraform CLI installed.

## Getting Started

> You can use this module as is or fork/clone it to your use case. 
Make sure to initiate the [provider](https://registry.terraform.io/providers/newrelic/newrelic/latest/docs/guides/provider_configuration#configuration-via-the-provider-block) from the top module.

### Ideas
* You don't need to use a data look up to get the entity guid. You can pass in the entity guid and keep the app name for the service level name or change the naming convention completely.   
* Service levels apply to Synthetic checks, Databases, Web applications, anything. More examples will come. Until then, there is no need to wait.
* Update the module to pass in different targets from 95% and 99%. You can also use 1 day or 28 day service levels.  
Incorporate a GraphQl query that executes a NRQL query that baselines your app. No need to pass in the latency after that!  


## New Relic resource definitions
* https://registry.terraform.io/providers/newrelic/newrelic/latest/docs/resources/service_level
* https://registry.terraform.io/providers/newrelic/newrelic/latest/docs/resources/entity_tags

## Inputs
* nr_api_key - Your New Relic User API Key, if running as a main rather than a module
* nr_account_id - The account id to associate with the Service levels
* app_name - The name of the APM application
* app_latency - The latency threshold for the APM application
* service_level_filter - Filter to use to isolate transactions or exclude transactions
* service_level_type - Type of service level. See the notes in the variable file
* team_names - Names of teams with a vested interest in this service level

## Outputs
* latency_service_level_id
* success_service_level_id
* latency_service_level_guid
* success_service_level_guid

## Usage

> ### New Relic resource definitions
> * https://registry.terraform.io/providers/newrelic/newrelic/latest/docs/resources/service_level
> * https://registry.terraform.io/providers/newrelic/newrelic/latest/docs/resources/entity_tags

> ### Inputs
> * nr_api_key - Your New Relic User API Key, if running as a main rather than a module
> * nr_account_id - The account id to associate with the Service levels
> * app_name - The name of the APM application
> * app_latency - The latency threshold for the APM application
> * service_level_filter - Filter to use to isolate transactions or exclude transactions
> * service_level_type - Type of service level. See the notes in the variable file
> * team_names - Names of teams with a vested interest in this service level

> ### Outputs
> * latency_service_level_id
> * success_service_level_id
> * latency_service_level_guid
> * success_service_level_guid

> ### Ideas
> * You don't need to use a data look up to get the entity guid. You can pass in the entity guid and keep the app name for the service level name or change the naming convention completely.   
> * Service levels apply to Synthetic checks, Databases, Web applications, anything. More examples will come. Until then, there is no need to wait.
> * Update the module to pass in different targets from 95% and 99%. You can also use 1 day or 28 day service levels.  
Incorporate a GraphQl query that executes a NRQL query that baselines your app. No need to pass in the latency after that!  


## Building

> * Configure input variables as per instructions.
> * Run a terraform init as per [provider instructions](https://registry.terraform.io/providers/newrelic/newrelic/latest/docs/guides/provider_configuration#configuration-via-the-provider-block) from the top module. 
> * Run terraform plan to verify what will be created. 
> * Run terraform apply to create the service levels and corresponding tags.
> * Save your terraform configuration and tf state files using existing tools and best practices. Don't have best practices yet? You can follow [ours](https://docs.newrelic.com/docs/new-relic-solutions/observability-maturity/operational-efficiency/observability-as-code-guide/) or [terraform's](https://developer.hashicorp.com/terraform/cloud-docs/recommended-practices/part3.2) as a start.


## Support

New Relic has open-sourced this project. This project is provided AS-IS WITHOUT WARRANTY OR DEDICATED SUPPORT. Issues and contributions should be reported to the project here on GitHub.

>We encourage you to bring your experiences and questions to the [Explorers Hub](https://discuss.newrelic.com) where our community members collaborate on solutions and new ideas.


## Contributing

We encourage your contributions to improve [Project Name]! Keep in mind when you submit your pull request, you'll need to sign the CLA via the click-through using CLA-Assistant. You only have to sign the CLA one time per project. If you have any questions, or to execute our corporate CLA, required if your contribution is on behalf of a company, please drop us an email at opensource@newrelic.com.

**A note about vulnerabilities**

As noted in our [security policy](../../security/policy), New Relic is committed to the privacy and security of our customers and their data. We believe that providing coordinated disclosure by security researchers and engaging with the security community are important means to achieve our security goals.

If you believe you have found a security vulnerability in this project or any of New Relic's products or websites, we welcome and greatly appreciate you reporting it to New Relic through [HackerOne](https://hackerone.com/newrelic).

## License

APM Service Levels with Tags is licensed under the [Apache 2.0](http://apache.org/licenses/LICENSE-2.0.txt) License.

