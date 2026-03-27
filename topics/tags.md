---
layout: site
title: "Tags"
body_class: tags
---

<dl>
  <dt>Entity</dt>
  <dd>Tags</dd>

  <dt>Description</dt>
  <dd>Reading list item tag data</dd>

  <dt>Database location</dt>
  <dd><code>public.f_rl_tags</code></dd>
</dl>

### Columns

| Column Name | Datatype      | Description               | Example                                |
| ----------- | ------------- | ------------------------- | -------------------------------------- |
| `tag_guid`  | `VARCHAR(64)` | The GUID of the tag       | `478A70D8-C627-91EC-D681-FFE617FABDD9` |
| `title`     | `VARCHAR(50)` | The tag title             | `Open access`                          |
| `is_active` | `boolean`     | Enables or disables a tag | `true` or `false`                      |

**WARNING:** The data dictionary is subject to change. For that reason always refer to column names directly in your SQL statements, not column positions.
