---
layout: site
title: "Data dictionary: Tag-to-List Item"
body_class: lists
---

<dl>
  <dt>Entity</dt>
  <dd>Tag-to-List Item</dd>

  <dt>Description</dt>
  <dd>A mapping between a tag and list item.</dd>

  <dt>Database location</dt>
  <dd><code>public.f_rl_item_tag_ids</code></dd>
</dl>

### Columns

| Column Name    | Datatype      | Description                       | Example                                |
| -------------- | ------------- | --------------------------------- | -------------------------------------- |
| `tag_id`       | `VARCHAR(64)` | Unique identifier for a tag       | `b45c7ce6-4c85-49be-a033-30b4b68819d7` |
| `list_item_id` | `VARCHAR(64)` | Unique identifier for a list item | `0ead2a52-3a40-4f74-8392-602fd0abcbaf` |

**WARNING:** The data dictionary is subject to change. For that reason always refer to column names directly in your SQL statements, not column positions.
