#
# This module creates the following for a specific app:
# a latency service level with tags
# a success service level with tags
#


terraform {
  # Require Terraform version 1.0 (recommended)
  required_version = "~> 1.0"

  # Require the latest 2.x version of the New Relic provider
  required_providers {
    newrelic = {
      source  = "newrelic/newrelic"
    }
  }
}

# Uncomment only if running as main module. Otherwise, this is inherited.
#
#provider "newrelic" {
#  account_id = var.nr_account_id   # Your New Relic account ID
#  api_key = var.nr_api_key 
#  region = "US"        # US or EU (defaults to US)
#}

# Looks up the entity guid using the app name
data "newrelic_entity" "targetApp" {
  name = var.app_name 
  domain = "APM"
  type = "APPLICATION"
}

# Latency service level
resource "newrelic_service_level" "latencyServiceLevel" {
    guid = data.newrelic_entity.targetApp.guid
    name = "${var.app_name} duration < ${var.app_latency}"
    description = "Proportion of requests that are served faster than a threshold."

    events {
        account_id = var.nr_account_id 
        valid_events {
            from = "Transaction"
            where = "entityGuid = '${data.newrelic_entity.targetApp.guid}' AND (transactionType='Web') ${var.service_level_filter}"
        }
        good_events {
            from = "Transaction"
            where = "entityGuid = '${data.newrelic_entity.targetApp.guid}' AND (transactionType= 'Web') ${var.service_level_filter} AND duration < ${var.app_latency}"
        }
    }

    objective {
        target = 95.00
        time_window {
            rolling {
                count = 7
                unit = "DAY"
            }
        }
    }
}

# Success rate service level
resource "newrelic_service_level" "successServiceLevel" {
    guid = data.newrelic_entity.targetApp.guid
    name = "${var.app_name} success rate"
    description = "Proportion of requests that are served without errors."

    events {
        account_id = var.nr_account_id
        valid_events {
            from = "Transaction"
            where = "entityGuid = '${data.newrelic_entity.targetApp.guid}' ${var.service_level_filter}"
        }
        bad_events {
            from = "TransactionError"
            where = "entityGuid = '${data.newrelic_entity.targetApp.guid}' ${var.service_level_filter} AND error.expected = false"
        }
    }

    objective {
        target = 99.00
        time_window {
            rolling {
                count = 7
                unit = "DAY"
            }
        }
    }
}

# Latency Service level tags
resource "newrelic_entity_tags" "latencyServiceLevelTags" {
   guid = newrelic_service_level.latencyServiceLevel.sli_guid

   tag {
       key = "category"
       values = ["latency"]
   } 

   tag {
       key = "type" 
       values = [var.service_level_type]
   }

   tag {
       key = "team"
       values = var.team_names
   }
} 

# Success Service level tags
resource "newrelic_entity_tags" "successServiceLevelTags" {
   guid = newrelic_service_level.successServiceLevel.sli_guid

   tag {
       key = "category"
       values = ["success"]
   } 

   tag {
       key = "type" 
       values = [var.service_level_type]
   }

   tag {
       key = "team"
       values = var.team_names
   }
} 



