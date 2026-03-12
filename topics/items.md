---
layout: site
title: "Data dictionary: Items"
body_class: items
---

<dl>
  <dt>Entity</dt>
  <dd>Items</dd>

  <dt>Description</dt>
  <dd>Reading list item data</dd>

  <dt>Database location</dt>
  <dd><code>public.f_rl_items</code></dd>
</dl>

### Columns

| Column Name | Datatype | Description  | Example
| --- | --- | --- | ---------- |
| `status` | `VARCHAR(255)` | Status of the list this item appears on. Permitted values `Draft`, `Published`, `Published with Unpublished Changes` | `Draft` |
| `time_period` | `VARCHAR(4096)` | Textual name of time period of the list this item appears on | `Autumn Term 2018` |
| `list_url` | `VARCHAR(255)` | Canonical URL of the reading list  |  |
| `item_url` | `VARCHAR(255)` | Canonical URL of the reading list item  |  |
| `list_guid` | `VARCHAR(4096)` | Globally Unique ID for the reading list | `DE53F159-8AE9-F8D4-6518-263DED7D56E9` |
| `item_guid` | `VARCHAR(4096)` | Globally Unique ID for the reading list item. This should be used for joining to other data | `478A70D8-C627-91EC-D681-FFE617FABDD9` |
| `title` | `VARCHAR(255)` | Title of the item | `A short history` |
| `chapter_article_title` | `VARCHAR(255)` | Title of the article or chapter| `In the beginning` |
| `authors` | `VARCHAR(4096)` | Authors of the work | `Fred R. L. Bloggs` |
| `type` | `VARCHAR(255)` | Type of the resource, limited to the [current resource types](https://support.talis.com/hc/en-us/articles/213182945-What-resource-types-are-supported-in-Talis-Aspire-Reading-Lists-) supported by Talis Aspire | `Book` |
| `isbn10` | `VARCHAR(255)` | The ISBN 10 | `012345678X` |
| `isbn13` | `VARCHAR(255)` | The ISBN 13 | `9780123456789` |
| `issn` | `VARCHAR(255)` | An ISSN | `1234-5678` |
| `eissn` | `VARCHAR(255)` | An eISSN | `1234-5678` |
| `lcn` | `VARCHAR(255)` | The local control number. This can be linked to records in library system reports | `b1234567` |
| `doi` | `VARCHAR(255)` | The Digital Object Identifier | `10.123/456/adoi_link` |
| `date_of_publication` | `VARCHAR(255)` | The date of publication (this is a representation of the date as found in original MARC record) | `c2009` |
| `issue` | `VARCHAR(255)` | The Issue Number | `22` |
| `volume` | `VARCHAR(255)` | The Volume | `1` |
| `edition` | `VARCHAR(255)` | The Edition | `Rev. and exp. [ed.]` |
| `start_page` | `VARCHAR(255)` | The start page | `23` |
| `end_page` | `VARCHAR(255)` | The end page | `45` |
| `importance` | `VARCHAR(255)` | Importance level of the item, limited to the values configured in your tenancy | `Suggested for student purchase` |
| `publisher` | `VARCHAR(4096)` | Publisher of the resource | `SAGE` |
| `format` | `VARCHAR(255)` | Format of the resource | `electronic resource` |
| `web_address` | `VARCHAR(4096)` | Web Address of the resource. Semicolon + space `'; '` separated if there are multiple web addresses. | `http://...; https://` |
| `digitisation_id` | `VARCHAR(255)` | ID of the digitisation request in Talis Aspire Digitised Content that this item is linked to | `22` |
| `digitisation_status` | `VARCHAR(32)` | Status of the digitisation, e.g. `LIVE`, `EXPIRED` | `LIVE` |
| `has_container` | `VARCHAR(255)` | The parent container GUID of the item - could be the list itself, or a section within the list. Prefixed with the type `tenantLists` or `tenantSections` to mark out type  | `tenantSections:9CBA2921-17BD-0A62-7942-421DCD8E79E6` |
| `date_added` | `TIMESTAMP` | Date the item was added to the list | `2016-01-12 00:00:00.0` |
| `library_note` | `VARCHAR(4096)` | Textual information about the item only visible to staff | `Example library note` |
| `student_note` | `VARCHAR(4096)` | Textual information about the item visible to all users | `Example student note` |
| `year_added` | `INTEGER` | Year of when the list was created | `2018` |
| `month_added` | `INTEGER` | Month of when the list was created, values `1-12` | `12` |
| `week_added` | `INTEGER` | ISO 8601 week of when the list was created, note Monday is the start of the ISO 8601 week, values `1-53` | `52` |
| `dow_added` | `INTEGER` | Day of week of when the list was created, values `0-6`, Sunday is `0` | `5` |
| `primary_web_address` | `VARCHAR(4096)` | This will be the web address field of the main part of the bookmark. Often the one for the Article or Chapter. Semicolon + space `; ` separated if there are multiple web addresses. | `http://...; https://` |
| `secondary_web_address` | `VARCHAR(4096)` | This will be the web address field in the secondary part of the bookmark. Often the one for the Book or Journal. Semicolon + space `; ` separated if there are multiple web addresses. | `http://...; https://` |
| `online_resource_web_address` | `VARCHAR(4096)` | If the Online Resource Source for the bookmark is 'Web Address' then the user selected web address will be the single URL in this field. Will be blank if Online Resource Source is set to anything else | |
| `online_resource_source` | `VARCHAR(4096)` | Will show whether the DOI, Open URL or Web Address is chosen as the source for the view online button | `DOI`, `Open URL`, `Web Address` |
| `has_upload_file` | `VARCHAR(3)` | Whether or not a Talis Engage file is attached to the list item  | `Yes` |
| `list_resource_content_file_type` | `VARCHAR(10)` | The file type of the Talis Engage file | `pdf` |
| `tags` | `VARCHAR(4096)` | Tags added to the item. Semicolon + space `'; '` separated if there are multiple tags. | `OpenAccess; Indigenous Author` |

**WARNING:** The data dictionary is subject to change. For that reason always refer to column names directly in your SQL statements, not column positions.
