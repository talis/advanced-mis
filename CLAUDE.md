# CLAUDE.md

advanced-mis is the end-user documentation site for Advanced MIS, the SQL-compatible Redshift data warehouse that Talis Aspire Unlimited customers query with BI tools (Power BI, Tableau, SQL Workbench/J). It is a Jekyll site (kramdown) published by GitHub Pages from `master` at https://advanced-mis.talis.io/ (`CNAME`). There is no application code, no tests and no CI config: the "build" is GitHub Pages building `master`. Default branch: `master`.

**Risk:** the site is customer-facing and the docs are only right if they match what `census-server` actually creates. A column, view or event documented before it is deployed to production misleads customers.

## Layout

- `index.md` (the home page, `body_class: home`), `topics/*.md` (reference pages: getting started such as `tools`, `connecting`, `limits`, `recipes`, `updates`, `errata`; application data dictionaries such as `lists`, `items`, `users`, `hierarchy*`, `digitisations`, `elevate-*`, `tags`; and event data: `event-data`, `event-classes`, `raw`, `timeseries`).
- `_recipes/*.md` - the `recipes` Jekyll collection (`_config.yaml`, `output: true`, published at `/recipes/<name>.html`); `topics/recipes.md` lists every file in it automatically from front matter.
- `_layouts/site.html` (the only layout), `_includes/` (`header`, `nav`, `footer`, `mermaid`), `stylesheets/`, `javascripts/`, `webfonts/`, `images/<topics|recipes>/<page>/` (per-page screenshots).
- `Dockerfile`, `start-dev.sh` and `Gemfile` are for the local preview. They, `README.md` and `Gemfile.lock` are in `exclude:` in `_config.yaml`, so they are not published.

## Setup and preview

The preview is Docker: `sh start-dev.sh` builds the image (Ruby and the `github-pages` gem pinned in `Gemfile`) and serves http://0.0.0.0:4000/ with auto-regeneration. The engineer runs it; Claude does not start it. Nothing else needs to run to edit docs. Changes go through a branch and a pull request.

## Page conventions

Every page starts with front matter, for example `layout: site`, `title: "Data dictionary: Lists"`, `body_class: lists`.

- **`body_class` must be unique per page and match the page's `if page.body_class == '...'` entry in `_includes/nav.html`:** that is how the nav highlights the current page. By convention it equals the file name. Exceptions: `topics/recipes.md` and every recipe use `body_class: recipe`, and `index.md` uses `home`.
- **The nav is hand-maintained.** A new `topics/` page appears nowhere until you add an `<li>` to `_includes/nav.html` (data dictionaries under "Application data", event pages under "Event data"). Recipes appear automatically. `entity-relationships` is deliberately linked from `app-data.md`, not the nav.
- **Internal links use `{{ site.baseurl }}`** and point at `.html`, not `.md`: `[Lists]({{ site.baseurl }}/topics/lists.html)`. Prefer `site.baseurl` in new content.
- **Recipes** need `keywords:` (a comma list, shown beside the title) and `description:` (one sentence, shown on the recipes index). Structure is `## Background`, `## Queries`, then explanation. SQL goes in a fenced block tagged `redshift` (the layout registers it as a highlight.js alias of SQL).
- **Data dictionary pages** follow one shape: a `<dl>` with Entity, Description and Database location (`public.f_rl_lists`), then a `### Columns` table `| Column Name | Datatype | Description | Example |`. Use real Redshift types (`VARCHAR(4096)`, `INTEGER`, `TIMESTAMP`) and wrap column names, values and types in backticks. Date columns come in the repeating family `date_x`, `year_x`, `month_x`, `week_x`, `dow_x` (ISO 8601 week, `dow` Sunday = 0): copy a neighbour.
- **A new event class touches three pages:** a row in `topics/event-classes.md` (with Timeseries and Raw availability icons and `timeseries.html#anchor` or `raw.html#anchor` links) and a definition section in `topics/timeseries.md` and/or `topics/raw.md` saying what `dimension_1` to `dimension_4` and the counts mean. Check all three agree.
- **Mermaid diagrams** (`entity-relationships.md`, `pushing.md`) need `mermaid: true` in the front matter; the layout includes Mermaid 8.10.2 (`_includes/mermaid.html`), so do not use newer syntax. `topics/pushing.md` computes dates with Liquid at build time: do not hard-code them.
- Edit `*.md` only. `_site/` is generated and git-ignored; do not hand-edit the vendored CSS, fonts or `fontawesome-all.min.css`. Icons are Font Awesome Pro webfonts used as `<i class="yes fas fa-check-circle">` with a `sr-only` label: keep the screen-reader text.
- Style: the site reads like a book (prose, white space, no web-app chrome), in British spelling (`digitisation`, `en-gb`). The audience is customer data analysts, not Talis engineers: explain the query and the data, and do not mention internal service names.

## Product updates and errata

Two pages record changes customers will notice, newest first, and every data-affecting change belongs in one: `topics/updates.md` (intentional structure changes: new, renamed or removed columns or tables, and fixes that change values; headings like `### 21st December 2022 - FIXED: ...`) and `topics/errata.md` (known incidents and gaps: lost, duplicated or unrecoverable data, listing the affected event classes). State the dates, the exact tables, columns or events affected, and whether data can be recovered.

## Keeping the docs in step with census-server

This repo cannot verify itself, so for any change describing columns, views or events, read the source of truth first from `census-server`'s default branch with `git show origin/master:<path>` (never its working tree):

- `config/appDataConfig.js` - application-data tables, columns and views (`f_rl_*`, `f_dc_*`, `f_elevate_*`): compare with the column tables in `topics/<entity>.md`.
- `config/eventConfig.js` - each Echo event class and what `dimension_1..4` hold, with an `example`: compare with `event-classes.md`, `timeseries.md`, `raw.md`.
- `config/decay.js` - retention per granularity: compare with `topics/limits.md` and the "up to N months" figures in `timeseries.md`.
- `config/tenants.js` - which tenants are premium (own database).

A `census-server` commit adding an event or column has a matching docs commit here. A new event or column there is not finished for customers until it is documented here, and never document one that is not deployed to production.

## Guardrails

- **Claude may run:** read-only `git` (including `git show` into `census-server`), and edits to `*.md` and `_includes/nav.html`.
- **Ask first:** starting the preview, and anything that publishes: merging to `master` publishes the site.
- **Never:** put real tenant names, user data or credentials from a warehouse into examples (use the existing sample values: fake GUIDs, `2018-...` timestamps); document an undeployed column or event.

## Traps

- **A `topics/` page without a nav entry** is orphaned (it works by URL, but is unlinked). A `body_class` that does not match the nav silently loses the active-link highlight; a duplicated one highlights two items.
- **Linking to `.md` files** produces dead links on the built site; use `.html`.
- **kramdown, not GitHub-flavoured Markdown:** lists need a blank line before them after a paragraph, and `{% raw %}` is required around any literal `{{ ... }}` you want to show in text.
- **`baseurl` is `"/"`,** so `{{ site.baseurl }}/topics/x.html` renders as `//topics/x.html`. Browsers tolerate it and the existing pages all do it: follow the pattern rather than "fixing" one page. The Docker run passes `--baseurl ""`, so local links look right where production differs: when a link matters, check the published site. The favicon path in `_layouts/site.html` is hard-coded to `/advanced-mis/images/favicon.ico` (a leftover from an older hosting path): wrong but harmless, so do not copy the pattern.

## Where other things live

- Workspace guidance and the guardrails for remote tools: `CLAUDE.md`, `LOCAL-DEV.md` and `docs/` in the workspace root repo `talis/talis-dev-root`, at `$DEVELOPMENT_WORK_DIR`. The warehouse itself and its configuration are in the sibling `census-server` repo (see its `CLAUDE.md`). `README.md` describes the site and the preview.

## PR conventions

- Branch from `master`, one change per PR, ticket key in the subject as the history does (`TA-3538 - Add tags table docs (#67)`). There is no PR template: say which `census-server` change the documentation tracks and that it is deployed.
- Open as a draft when Claude-authored; a human reviews and merges.

## Keeping this file current

If a change alters anything described here (page conventions, the nav mechanism, the preview), update this file in the same PR. Link detail rather than copying it.
