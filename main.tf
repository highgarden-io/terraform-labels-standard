locals {
  input = {
    org = {
      org_name       = lower(trim(replace(var.id_org_name, "/([^0-9A-Za-z])/", "_"), "_"))
      org_name_short = lower(trim(replace(var.id_org_name_short, "/([^0-9A-Za-z])/", "_"), "_"))
      org_name_tld   = lower(trim(replace(var.id_org_name_tld, "/([^0-9A-Za-z])/", "_"), "_"))
    }
    id = {
      # Setting Values
      namespace = lower(trim(replace(var.id_namespace, "/([^0-9A-Za-z])/", "_"), "_"))
      layer     = lower(trim(replace(var.id_layer, "/([^0-9A-Za-z])/", "_"), "_"))
      stage     = lower(trim(replace(var.id_stage, "/([^0-9A-Za-z])/", "_"), "_"))
      name      = lower(trim(replace(var.id_name, "/([^0-9A-Za-z])/", "_"), "_"))
      component = lower(trim(replace(var.id_component, "/([^0-9A-Za-z])/", "_"), "_"))
    }
    topology = {
      # Setting Values
      region = lower(trim(replace(var.topology_region, "/([^0-9A-Za-z])/", "_"), "_"))
      zone   = lower(trim(replace(var.topology_zone, "/([^0-9A-Za-z])/", "_"), "_"))
    }
    managed_by = {
      # Setting Values
      by  = lower(trim(replace(var.managed_by, "/([^0-9A-Za-z])/", "_"), "_"))
      # Also Allow slashes and dots.
      ref = lower(trim(replace(var.managed_by_ref, "/([^0-9A-Za-z/.])/", "_"), "_"))
    }
  }



  label_postfix            = "${local.input.org.org_name_short}.${local.input.org.org_name_tld}"
  label_id_postfix         = "id.${local.label_postfix}"
  label_topology_postfix   = "topology.${local.label_postfix}"
  label_managed_by_postfix = "managed.${local.label_postfix}"
  id = join(
    "-",
    compact(
      [
        local.input.org.org_name_short,
        local.input.id.namespace,
        local.input.topology.region,
        local.input.id.layer,
        local.input.id.stage,
        local.input.id.name,
        local.input.id.component,
      ]
    )
  )

  # Id Labels
  labels_id = merge({
    for key, value in local.input.id :
    "${local.label_id_postfix}/${key}" => value
    if value != ""
    },
    {
      # For AWS Console ( TODO make this configurable to be more cloud provider agnostic )
      Name                               = local.id
      "${local.label_id_postfix}/id"     = local.id
      "${local.label_id_postfix}/org"    = local.input.org.org_name_short
      "${local.label_id_postfix}/region" = local.input.topology.region
    }
  )

  # Topology Labels
  labels_topology = {
    for key, value in local.input.topology :
    "${local.label_topology_postfix}/${key}" => value
    if value != ""
  }

  # Managed By Labels
  labels_managed_by = {
    for key, value in local.input.managed_by :
    "${local.label_managed_by_postfix}/${key}" => value
    if value != ""
  }

  labels = merge(
    local.labels_id,
    local.labels_topology,
    local.labels_managed_by
  )
}