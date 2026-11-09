---
layout: site
title: "Search Sources"
body_class: search-sources
---

<dl>
  <dt>Entity</dt>
  <dd>Search Sources</dd>

  <dt>Description</dt>
  <dd>Search sources configured in Reading Lists settings</dd>

  <dt>Database location</dt>
  <dd><code>public.f_rl_search_sources</code></dd>
</dl>

### Columns

| Column Name   | Datatype       | Description                                                                                         | Example                                  |
| ------------- | -------------- | --------------------------------------------------------------------------------------------------- | ---------------------------------------- |
| `id`          | `VARCHAR(64)`  | The ID of the search source                                                                         | `478a70d8-c627-91ec-d681-ffe617fabdd9`   |
| `title`       | `VARCHAR(255)` | The search source title                                                                             | `Library search`                         |
| `source_type` | `VARCHAR(64)`  | The type of the search source, for example `my_bookmarks`, `works`, `eds`, `primo`, `summon` or `worldcat` | `works`                           |
| `is_active`   | `boolean`      | Enables or disables a search source                                                                 | `true` or `false`                        |

**WARNING:** The data dictionary is subject to change. For that reason always refer to column names directly in your SQL statements, not column positions.
