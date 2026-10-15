---
layout: site
title: Event classes
body_class: event-classes
---

Each event has a `class` which defines the type and characteristics of the event. The current classes
of event supported by Advanced MIS, and whether they are available in raw or timeseries form, are listed
below.

This page is broken up into sections for different areas of Talis Aspire.

- [Login Activity](#login-activity)
- [Reading Lists](#reading-lists)
- [Copyright Clearance](#copyright-clearance)
- [Reviews](#reviews)
- [Tenant Settings](#tenant-settings)
- [Talis Elevate](#talis-elevate)

## Login Activity

| Class | Description | Timeseries data? | Raw data? |
| :- | :- | :- | :- |
| `login.success` | A user signed into Talis via SSO |  [<i class="yes fas fa-check-circle"><span class="sr-only">Available</span></i><br> View definition](timeseries.html#login-success)  |  <i class="no fas fa-times-circle"><span class="sr-only">Not available</span></i>  |
| `user.identified` &#10033; | Following sign in (`login.success`) this event is fired and matches up the institution's identity with the talis user's profile |  [<i class="yes fas fa-check-circle"><span class="sr-only">Available</span></i><br> View definition](timeseries.html#user-identified)  | [<i class="yes fas fa-check-circle"><span class="sr-only">Available</span></i><br> View definition](raw.html#user-identified)  |

## Reading Lists

| Class | Description | Timeseries data? | Raw data? |
| :- | :- | :- | :- |
| `annotations.readingIntention` | A user made, or updated, a reading intention |  [<i class="yes fas fa-check-circle"><span class="sr-only">Available</span></i><br> View definition](timeseries.html#reading_intention)  |  <i class="no fas fa-times-circle"><span class="sr-only">Not available</span></i>  |
| `bookmark.created` | A bookmark was created |  [<i class="yes fas fa-check-circle"><span class="sr-only">Available</span></i><br> View definition](timeseries.html#bookmark-created)  |  <i class="no fas fa-times-circle"><span class="sr-only">Not available</span></i>  |
| `addToList` | An item was added to a list |  [<i class="yes fas fa-check-circle"><span class="sr-only">Available</span></i><br> View definition](timeseries.html#addToList)  |  <i class="no fas fa-times-circle"><span class="sr-only">Not available</span></i>  |
| `list.publish` | A list was published |  [<i class="yes fas fa-check-circle"><span class="sr-only">Available</span></i><br> View definition](timeseries.html#list-publish)  |  <i class="no fas fa-times-circle"><span class="sr-only">Not available</span></i>  |
| `list.entry_point` &#10033; | A list was accessed either directly or by LTI, includes precise entry point (top of list, specific item or section) |  [<i class="yes fas fa-check-circle"><span class="sr-only">Available</span></i><br> View definition](timeseries.html#list-entry_point)  |  [<i class="yes fas fa-check-circle"><span class="sr-only">Available</span></i><br> View definition](raw.html#list-entry_point)  |
| `list.view` &#10033; <span class="deprecated">DEPRECATED</span> | A list was viewed |  [<i class="yes fas fa-check-circle"><span class="sr-only">Available</span></i><br> View definition](timeseries.html#list-view)  |  [<i class="yes fas fa-check-circle"><span class="sr-only">Available</span></i><br> View definition](raw.html#list-view)  |
| `list.edit` &#10033; | An edit action on a list |  [<i class="yes fas fa-check-circle"><span class="sr-only">Available</span></i><br> View definition](timeseries.html#list-edit)  |  <i class="no fas fa-times-circle"><span class="sr-only">Not available</span></i>  |
| `list.item.click` &#10033; | An item in a list interacted with in some way  |  [<i class="yes fas fa-check-circle"><span class="sr-only">Available</span></i><br> View definition](timeseries.html#list-item-click)  |  <i class="no fas fa-times-circle"><span class="sr-only">Not available</span></i>  |
| `list.item.view` &#10033; <span class="deprecated">DEPRECATED</span> | An item in a list was expanded/navigated to  |  [<i class="yes fas fa-check-circle"><span class="sr-only">Available</span></i><br> View definition](timeseries.html#list-item-view)  |  [<i class="yes fas fa-check-circle"><span class="sr-only">Available</span></i><br> View definition](raw.html#list-item-view)  |
| `list.item.external_link.click` &#10033; | The user exited the list to an external content location  |  [<i class="yes fas fa-check-circle"><span class="sr-only">Available</span></i><br> View definition](timeseries.html#list-item-external_link-click)  |  [<i class="yes fas fa-check-circle"><span class="sr-only">Available</span></i><br> View definition](raw.html#list-item-external_link-click)  |
| `lti.link.followed` | A pre-created LTI launch to a reading list was invoked |  [<i class="yes fas fa-check-circle"><span class="sr-only">Available</span></i><br> View definition](timeseries.html#lti-links)  |  [<i class="yes fas fa-check-circle"><span class="sr-only">Available</span></i><br> View definition](raw.html#lti-links)  |
| `lti.link.buest_guess.found_list` | An LTI launch was invoked but had not been pre-created by an instructor and resulted in finding a single list to show the user |  [<i class="yes fas fa-check-circle"><span class="sr-only">Available</span></i><br> View definition](timeseries.html#lti-links)  |  [<i class="yes fas fa-check-circle"><span class="sr-only">Available</span></i><br> View definition](raw.html#lti-links)  |
| `lti.link.best_guess.search` | An LTI launch was invoked but had not been pre-created by an instructor, and resulted in finding some lists based on a search |  [<i class="yes fas fa-check-circle"><span class="sr-only">Available</span></i><br> View definition](timeseries.html#lti-links)  |  [<i class="yes fas fa-check-circle"><span class="sr-only">Available</span></i><br> View definition](raw.html#lti-links)  |
| `lti.link.best_guess.homepage` | An LTI launch was invoked but had not been pre-created by an instructor, and resulted in finding no lists |  [<i class="yes fas fa-check-circle"><span class="sr-only">Available</span></i><br> View definition](timeseries.html#lti-links)  |  [<i class="yes fas fa-check-circle"><span class="sr-only">Available</span></i><br> View definition](raw.html#lti-links)  |
| `resource.edit` | A resource was updated by a user |  [<i class="yes fas fa-check-circle"><span class="sr-only">Available</span></i><br> View definition](timeseries.html#resource-edit)  | <i class="no fas fa-times-circle"><span class="sr-only">Not available</span></i> |

&#10033; These events are only available since using the revamped list view from aprroximately 2019 onwards. The first data in your tenancy will vary depending on when you switched to the new list view.

## Copyright Clearance

| Class | Description | Timeseries data? | Raw data? |
| :- | :- | :- | :- |
|`digitisation.view`| A digitisation was viewed | [<i class="yes fas fa-check-circle"><span class="sr-only">Available</span></i><br> View definition](timeseries.html#digitisation-view)  |  <i class="no fas fa-times-circle"><span class="sr-only">Not available</span></i>  |
|`digitisation.print.showModal`| A digitisation print modal was opened (file access is also recorded as a `digitisation.download`)| [<i class="yes fas fa-check-circle"><span class="sr-only">Available</span></i><br> View definition](timeseries.html#digitisation-print-showmodal)  |  <i class="no fas fa-times-circle"><span class="sr-only">Not available</span></i>  |
|`digitisation.download`| A digitisation was downloaded | [<i class="yes fas fa-check-circle"><span class="sr-only">Available</span></i><br> View definition](timeseries.html#digitisation-download)  |  <i class="no fas fa-times-circle"><span class="sr-only">Not available</span></i>  |

## Reviews

| Class | Description | Timeseries data? | Raw data? |
| :- | :- | :- | :- |
| `reviews.actions.status.1` | An acquisitions review's status changed |  [<i class="yes fas fa-check-circle"><span class="sr-only">Available</span></i><br> View definition](timeseries.html#reviews-actions-status-1)  |  <i class="no fas fa-times-circle"><span class="sr-only">Not available</span></i>  |
| `reviews.actions.setOutcome.1` | An acquisitions review outcome was set |  [<i class="yes fas fa-check-circle"><span class="sr-only">Available</span></i><br> View definition](timeseries.html#reviews-actions-setOutcome-1)  |  <i class="no fas fa-times-circle"><span class="sr-only">Not available</span></i>  |
| `reviews.actions.assignUser.1` | An acquisitions review was assigned to a user |  [<i class="yes fas fa-check-circle"><span class="sr-only">Available</span></i><br> View definition](timeseries.html#reviews-actions-assignUser-1)  |  <i class="no fas fa-times-circle"><span class="sr-only">Not available</span></i>  |

## Tenant Settings

| Class | Description | Timeseries data? | Raw data? |
| :- | :- | :- | :- |
| `settings.search_source.edit` | A user saved changes to a search source |  [<i class="yes fas fa-check-circle"><span class="sr-only">Available</span></i><br> View definition](timeseries.html#settings-search-source-edit)  |  <i class="no fas fa-times-circle"><span class="sr-only">Not available</span></i>  |

## Talis Elevate

| Class | Description | Timeseries data? | Raw data? |
| :- | :- | :- | :- |
| `player.timer.2` | A resource was viewed by a student in the player for an amount of time |  [<i class="yes fas fa-check-circle"><span class="sr-only">Available</span></i><br> View definition](timeseries.html#player-timer-2)  |  <i class="no fas fa-times-circle"><span class="sr-only">Not available</span></i>  |
| `player.timer.2.contributors` <span class="deprecated">DEPRECATED</span> | A resource was viewed by a contributor (academic, teaching assistant) in the player for an amount of time |  [<i class="yes fas fa-check-circle"><span class="sr-only">Available</span></i><br> View definition](timeseries.html#player-timer-2-contributors)  |  <i class="no fas fa-times-circle"><span class="sr-only">Not available</span></i>  |
| `player.view` | A resource was opened in the player by a student. `digitisation.view` is also recorded by the Talis Elevate player when the content has originated from Copyright Clearance. This is in addition to `player.view`. |  [<i class="yes fas fa-check-circle"><span class="sr-only">Available</span></i><br> View definition](timeseries.html#player-view)  |  <i class="no fas fa-times-circle"><span class="sr-only">Not available</span></i>  |
| `player.view.contributors` <span class="deprecated">DEPRECATED</span> | A resource was opened in the player by a contributor (academic, teaching assistant) |  [<i class="yes fas fa-check-circle"><span class="sr-only">Available</span></i><br> View definition](timeseries.html#player-view-contributors)  |  <i class="no fas fa-times-circle"><span class="sr-only">Not available</span></i>  |
| `player.annotate.createannotation` | A new annotation (comment thread) was created by a user |  [<i class="yes fas fa-check-circle"><span class="sr-only">Available</span></i><br> View definition](timeseries.html#player-annotate-createannotation)  |  <i class="no fas fa-times-circle"><span class="sr-only">Not available</span></i>  |
| `player.annotate.createannotation.highlight` | A new highlight annotation was created by a user |  [<i class="yes fas fa-check-circle"><span class="sr-only">Available</span></i><br> View definition](timeseries.html#player-annotate-createannotation)  |  <i class="no fas fa-times-circle"><span class="sr-only">Not available</span></i>  |
| `player.annotate.createannotation.pin` | A new pindrop annotation was created by a user |  [<i class="yes fas fa-check-circle"><span class="sr-only">Available</span></i><br> View definition](timeseries.html#player-annotate-createannotation)  |  <i class="no fas fa-times-circle"><span class="sr-only">Not available</span></i>  |
| `player.annotate.createannotation.classcomment` | A new class annotation (comment thread) was created by a user |  [<i class="yes fas fa-check-circle"><span class="sr-only">Available</span></i><br> View definition](timeseries.html#player-annotate-createannotation)  |  <i class="no fas fa-times-circle"><span class="sr-only">Not available</span></i>  |
| `player.annotate.createannotation.personalnote` | A new personal annotation (private note) was created by a user |  [<i class="yes fas fa-check-circle"><span class="sr-only">Available</span></i><br> View definition](timeseries.html#player-annotate-createannotation)  |  <i class="no fas fa-times-circle"><span class="sr-only">Not available</span></i>  |
| `player.annotate.createannotation.anonymouscomment` | A new anonymous annotation (comment thread) was created by a user |  [<i class="yes fas fa-check-circle"><span class="sr-only">Available</span></i><br> View definition](timeseries.html#player-annotate-createannotation)  |  <i class="no fas fa-times-circle"><span class="sr-only">Not available</span></i>  |
| `player.annotate.createreply` | A new reply (to an existing thread) was created by a user |  [<i class="yes fas fa-check-circle"><span class="sr-only">Available</span></i><br> View definition](timeseries.html#player-annotate-createreply)  |  <i class="no fas fa-times-circle"><span class="sr-only">Not available</span></i>  |
| `player.profile.complete` <span class="deprecated">DEPRECATED</span> | A user completed their profile |  [<i class="yes fas fa-check-circle"><span class="sr-only">Available</span></i><br> View definition](timeseries.html#player-profile-complete)  |  <i class="no fas fa-times-circle"><span class="sr-only">Not available</span></i>  |
| `player.search` <span class="deprecated">DEPRECATED</span> | A user used the search function |  [<i class="yes fas fa-check-circle"><span class="sr-only">Available</span></i><br> View definition](timeseries.html#player-search)  |  <i class="no fas fa-times-circle"><span class="sr-only">Not available</span></i>  |
| `player.download` | The player resource was downloaded by a user. `digitisation.download` is also recorded by the Talis Elevate player when the content has originated from Copyright Clearance. This is in addition to `player.download`. | [<i class="yes fas fa-check-circle"><span class="sr-only">Available</span></i><br> View definition](timeseries.html#player-download)  |  <i class="no fas fa-times-circle"><span class="sr-only">Not available</span></i>  |
| `modulemanager.timer` <span class="deprecated">DEPRECATED</span> | A module was viewed by an academic in the module manager for an amount of time |  [<i class="yes fas fa-check-circle"><span class="sr-only">Available</span></i><br> View definition](timeseries.html#modulemanager-timer)  |  <i class="no fas fa-times-circle"><span class="sr-only">Not available</span></i>  |
|`digitisation.print`| A digitisation played through talis elevate was accessed for printing. This event is only emitted when a digitisation is played in Talis Elevate. | [<i class="yes fas fa-check-circle"><span class="sr-only">Available</span></i><br> View definition](timeseries.html#digitisation-print)  |  <i class="no fas fa-times-circle"><span class="sr-only">Not available</span></i>  |
