---
layout: site
title: Entity Relationship Diagram
body_class: entity-relationships
mermaid: true
---

There are a lot of things within the Talis Aspire eco system! The diagram at the bottom of this page represents the key relationships between the main tables in the Advanced MIS database.

## Relationships

In order to interpret the diagram it is useful to know the type of relationship between two tables. These are expressed as follows.

* ... Dotted lines mean there is a non-identifying relationship, i.e. the two entities can co-exist independently of the other
* --- Solid lines mean there is an identifying relationship where the entity cannot exist without other referenced entities also existing.

| (left) | (right) | Meaning |
| - | - | - |
| `|o` | `o|` | Zero or one |
| `||` | `||` | Exactly one |
| `}o` | `o{` | Zero or more (no upper limit)
| `}|` | `|{` | One or more (no upper limit)

Labels on relationships indicate where there is a reliance on a particular key being present.

## Attributes

We have not listed all attributes of a table, only those that can be used as either primary or foreign keys.

<div class="mermaid">
erDiagram
    %% relationships with dotted lines are non-identifying
    %% note that order in which items are specified can have a direct effect on rendering output
    %% Crossed lines in the diagram can sometimes be resolve by swapping order of the relationship definitions
    f_rl_lists {
        string url
        string list_guid
        string hierarchy_url
        string owner_url
    }
    f_rl_lists ||..o{ f_rl_hierarchy : hierarchy_url
    f_rl_lists ||..o{ f_event_timeseries_XXhr : list_guid
    f_rl_lists ||..o{ f_rl_users : owner_url
    f_rl_lists ||..o{ f_rl_items : list_guid

    f_rl_items {
        string item_guid
        string has_container
    }
    f_rl_items ||..o{ f_event_timeseries_XXhr : item_guid

    f_rl_isbn_link {
        string isbn
        string item_url
        string digitisation_id
        string list_url
    }
    f_rl_isbn_link }o..o{ f_rl_lists : list_url
    f_rl_isbn_link }o..o{ f_rl_items : item_url
    f_rl_isbn_link }o..o{ f_dc_requests : digitisation_id

    f_event_timeseries_XXhr {
        string event_class
        timestamp time_window
        string dimension_1
        string dimension_2
        string dimension_3
        string dimension_4
    }

    f_rl_users {
        string profile_url
        string talis_guid
        string saml_user_id
    }
    f_rl_users ||..o{ f_event_timeseries_XXhr : talis_guid
    f_elevate_users |o..o| f_rl_users : talis_guid
    f_rl_hierarchy {
        string url
    }
    f_rl_hierarchy }o--o{ f_rl_hierarchy_descendants : url
    f_rl_hierarchy }o--o{ f_rl_hierarchy_parents : url
    f_rl_hierarchy_parents {
        string url
        string parent_url
    }
    f_rl_hierarchy_descendants {
        string url
        string descendant_url
    }
    f_dc_requests {
        string digitisation_id
        string item_guid
    }
    f_dc_requests ||..|| f_rl_items : item_guid
    f_dc_requests ||..o{ f_event_timeseries_XXhr : digitisation_id

    f_elevate_modules {
        string module_id
        string created_by
    }
    f_elevate_users |o..o| f_elevate_modules : created_by
    f_event_timeseries_XXhr }o..|| f_elevate_modules : module_id
    
    f_elevate_resources {
        string resource_id
        string uploaded_by
    }
    f_elevate_users |o..o| f_elevate_resources : uploaded_by
    f_event_timeseries_XXhr }o..|| f_elevate_resources  : resource_id
    
    f_elevate_module_resource_link {
        string module_id
        string resource_id
    }
    f_elevate_module_resource_link ||--o{ f_elevate_modules : module_id
    f_elevate_module_resource_link ||--o{ f_elevate_resources : resource_id

    f_elevate_users {
        string talis_guid
    }

    f_rl_tags {
        string tag_guid
    }

    f_rl_tag_item_links {
        string tag_guid
        string item_guid
    }
    f_rl_tag_item_links ||--o{ f_rl_items : item_guid
    f_rl_tag_item_links ||--o{ f_rl_tags : tag_guid
</div>
