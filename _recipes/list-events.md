---
title: List Activity
layout: site
body_class: recipe
keywords: analytics, stats, user behaviour,
description: Working with list events to understand list activity
---

## Background

Sometimes you want to know about how people are interacting with lists. The sort of questions you might ask are:

* Are students using the LTI integration to get to lists?
* Are lists or sections being linked to with the LTI integration?
* When are lists most heavily used in the academic year?
* When are lists most heavily edited in the academic year?
* Which students are viewing which lists?
* Are students interacting with the online systems that are being made available to support COVID course delivery adjustments?
* Which items on a list have most interactions?
* Which links to external content are most popular?
* Where in a list do users open the add resource modal from, and how do they leave it?
* How many searches do users run in the add resource modal?
* Do users who search in the add resource modal give up, or add a resource?

There are a host of variations of those questions, but they can all be answered using some events that capture activity on a list.  This recipe gives you a number of sample queries that give you a detailed view of activity in the system. 

For a full definition of each event class used in these examples, refer to the [event class definitions]({{ site.baseurl }}/topics/event-classes.html).

## Queries

It is useful to know how much data you have available to you And you'll have different amounts of data depending on which timeseries tables you are looking in. This query finds the earliest and latest date an event was seen for each event_class.

```redshift
-- min and max dates for each event
select event_class, min(time_window), max(time_window)
from f_event_timeseries_24hr
group by event_class;
```

Sometimes you want to know how often an event happened over time. This query will give you the number of list views each month split over each of the list view modes. This will give you up to 4 data series that you could plot on a line chart to compare student views against academic edits to see when peak periods were for both of those user types.

View mode will be one of:

- `view` — a student or non-logged in view of the list
- `view_draft` — a user is looking at a draft but not allowed to edit the list 
- `edit` — a user who can edit the list is looking at it
- `view_as_student` — a user who can edit the list has elected to view the list as if they were a student.


```redshift
-- list view mode over time
select 
    split_part(dimension_3, ':', 1) as view_mode,
    sum(event_count), 
    date_part('YEAR', time_window) as year,
    date_part('MONTH', time_window) as month
from f_event_timeseries_24hr
where event_class = 'list.entry_point'
group by view_mode, year, month
order by view_mode, year, month;
```

Maybe you want to know whether LTI or direct requests are most prevalent. Here we use the second part of dimension_3 to inspect the method used for the request into Talis Aspire. In this query, `view_method` will either be `direct` or `lti`

```redshift
select
    split_part(dimension_3, ':', 2) as view_method,
    sum(event_count), 
    date_part('YEAR', time_window) as year,
    date_part('MONTH', time_window) as month    
from f_event_timeseries_24hr
where event_class = 'list.entry_point'
group by view_method, year, month
order by year, month;
```

Maybe you want to know whether sections or lists are the most popular when creating an LTI link in the VLE.

```redshift
select
    split_part(dimension_2, ':', 1) as entry_point,
    sum(event_count) 
from f_event_timeseries_24hr
where event_class = 'list.entry_point'
and split_part(dimension_3, ':', 2) = 'lti' 
group by entry_point;
```

Maybe you are building a system to give a personal tutor a view of what a student is interacting with. Or you want to see which students are not engaging with online systems.

```redshift
select distinct dimension_4 as user, dimension_1 as list
from f_event_timeseries_24hr
where event_class = 'list.entry_point'
order by dimension_4;
```

Beyond the list itself, there is a wealth of detail about how individuals are using the lists. Maybe you want to know which item across all lists is clicked on the most?

```redshift
select dimension_2 as item, sum(event_count)
from f_event_timeseries_24hr
where event_class = 'list.item.click'
group by dimension_2
order by sum(event_count) DESC
limit 10;
```

Or maybe you want to know which list features, such as online resource links, bookstore links, catalogue links etc are used the most when leaving the list?

```redshift
select split_part(dimension_3, ':', 2) as action_type, sum(event_count)
from f_event_timeseries_24hr
where event_class = 'list.item.click'
group by interaction_type;
```

Or maybe you are only interested in external links and which destinations are proving the most popular?

```redshift
select dimension_4 as external_link_domain, sum(event_count)
from f_event_timeseries_24hr
where event_class = 'list.item.external_link.click'
group by dimension_4
```

Maybe you want to know whether users open the add resource modal from the list itself or from a section. The `open_location` is either `list` or `section`.

```redshift
select dimension_2 as open_location, sum(event_count) as opens
from f_event_timeseries_24hr
where event_class = 'list.add_resource.open'
group by open_location;
```

Every time the modal is opened it gets a new id, which is recorded in `dimension_3` of the open, search and close events. Counting the search events for each id gives you the number of searches in each modal session. This query shows how many modal sessions had one search, two searches and so on.

```redshift
select searches, count(*) as sessions
from (
    select dimension_3 as session_id, sum(event_count) as searches
    from f_event_timeseries_24hr
    where event_class = 'list.add_resource.search'
    group by dimension_3
) as searches_per_session
group by searches
order by searches;
```

When the modal is dismissed, `close_type` records how. It is one of `close_button`, `escape_key` or `backdrop`.

```redshift
select dimension_2 as close_type, sum(event_count) as closes
from f_event_timeseries_24hr
where event_class = 'list.add_resource.close'
group by close_type;
```

Because the close event shares its session id with the search events, you can find the sessions where a user searched and then dismissed the modal without adding a resource, and see how they left.

```redshift
select c.dimension_2 as close_type, count(distinct s.dimension_3) as sessions
from f_event_timeseries_24hr s
join f_event_timeseries_24hr c
  on c.dimension_3 = s.dimension_3
 and c.event_class = 'list.add_resource.close'
where s.event_class = 'list.add_resource.search'
group by close_type;
```

Maybe you want to get a summary of when edits were made on a particular list and by whom? Note that because we are looking at this in the `f_rl_timeseries_24hr` data, the events are aggregated up to the day. If you want more granularity, you would have to read from the `f_rl_timeseries_1hr` view. 

```redshift
select time_window, dimension_2 as edit_action, event_count, dimension_4 as user
from f_event_timeseries_24hr
where event_class = 'list.edit'
and dimension_3 = 'A-LIST-ID-HERE' -- example DE53F159-8AE9-F8D4-6518-263DED7D56E9
order by time_window ASC;
```

Maybe you want to know where people open the add-resource modal from. This query counts how often the modal was opened from the list itself and from a section of the list.

```redshift
-- add-resource modal opens per open location
select dimension_2 as open_location, sum(event_count) as opens
from f_event_timeseries_24hr
where event_class = 'list.add_resource.open'
group by open_location
order by opens desc;
```

Maybe you want to know how far people get once they open the add-resource modal. Every event from one modal session shares the same `dimension_3`, so grouping by list you can compare how many times the modal was opened, how many searches were made and how many resources were added.

```redshift
-- add-resource modal opens, searches and added resources per list
select
    dimension_1 as list,
    sum(case when event_class = 'list.add_resource.open' then event_count else 0 end) as opens,
    sum(case when event_class = 'list.add_resource.search' then event_count else 0 end) as searches,
    sum(case when event_class = 'list.add_resource.create' then event_count else 0 end) as added_resources
from f_event_timeseries_24hr
where event_class in (
    'list.add_resource.open',
    'list.add_resource.search',
    'list.add_resource.create'
)
group by list
order by opens desc;
```

## Assumptions

When working with user ids in `dimension_4` you will likely want to link this back to a user in your own systems or data warehouse. you can often use the `user.identifed` event to build a set of mapping data that will enable you to link an ID from the SAML conversation, with the internal `talis_guid` used to identify users in Talis Aspire.

## Taking it further

These example queries just get data from the event. The identifiers in the dimensions are intended for you to use in JOINs with the `f_rl_items` and `f_rl_lists` views to get things like list titles and so on. You can then also bring in other information like list status, time periods or importances to further filter and group your view of the data.

When working with list events such as `list.entry_point` or `list.item.click` you can split `dimension_3` into pieces to use each piece as a different grouping or filtering field.