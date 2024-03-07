# 
# Variables required for running this module. 
#
# nr_api_key
# nr_account_id
# app_name
# app_latency
# service_level_filter
# service_level_type
# team_names

# 
# NR API Key - Required here only if running as a main module. Otherwise inherited.
#
# You can input the api key when prompted or 
# 1. Create a secret.tfvars file
# 2. Add nr_api_key = "<value>"
# 3. Run terraform <command> -var-file "secret.tfvars" 
#

#variable "nr_api_key" {
#    description = "New Relic user api key"
#    type = string
#    sensitive = true
#}

#
# New Relic account id to assign the service level to
#
variable "nr_account_id" {
    description = "New Relic account id to invoke terraform against"
    type = number 
    default = 0
}

#
# App Name
#
variable "app_name" {
    description = "Application name"
    type = string 
}

#
# App Latency Threshold
#
variable "app_latency" {
    description = "Application latency threshold in seconds"
    type = number
}

#
# Service Level Transaction Filter
#
variable "service_level_filter" {
    description = "Filters specific transactions associated with an app. Use this to include or exclude transactions"
    type = string
    default = "AND name NOT LIKE '%ping%'"
}

#
# Service Level Type Tag
# Increasingly, we find that engineers create many different types of service levels. 
# Whatever types you define, we recommend that you use tagging so you can filter and group them in the Service level UI. 
# Example types: boundary (APM services accessing from web or mobile applications) internal_api (internal boundaries) 
# availability (synthetic check results) database .. etc.
#
variable "service_level_type" {
    description = "Defines tag to identify service level type"
    type = string
    default = "boundary"
}

#
# Team(s) Tag
# Tag teams responsible or with a vested interest in this Service Level
#
variable "team_names" {
    description = "Team name(s) to use in tagging"
    type = list(string)
    default = ["myteam"]
}

