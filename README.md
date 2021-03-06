Group Project - README
===

# zotCourse

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
zotCourse is an app which provides a integrated platform for UCI students (currently) to find course-related information through their iPhones. It offers useful features like subscribing class updates, making comments to a course, and creating user-based customized to-do-lists.

### App Evaluation
[Evaluation of your app across the following attributes]
- **Category:** Effectiveness / Education
- **Mobile:** Designed perfectly and specifically for mobile use, mainly for iPhone, also compatible with iPad. The app follows the new iOS design pattern of iOS 11+, in order to improve the user experience.
- **Story:** Allows user to add courses and activities into their own list. Present corresponding info for every course, and welcome user to contribute their own opinion toward the platform.
- **Market:** Currently UCI students, would expand to all college students if applicable. "Made for student" is always the main idea for this app.
- **Habit:** We wish this app could be a must-have to college students, for it is simple but detailed, and would satisfy the real needs of students.
- **Scope:** Starting from part of courses selected by our team, we would try to cover every courses available in this school, with precise and well organized content presenting to users.

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* User logs in to view the subscribed course list.
* User can manage the courses they subscribed.
* User can remain logged in or log out safely.
* User can get more detailed information of a specific course by touch the course title. Course info includes time and location for each session (e.g. lecture, lab, discussion, etc.), recent activities, and comments made by users.
* User can leave comments under a specific course, and view comments from other users as well.

**Optional Nice-to-have Stories**

* Recent activities for courses.
* Add pre-installed activities to to-do-list.
* Display all imported activities to user.
* Allow user to add self-defined activities into to-do-list.
* Setting page.
* Colorful user interface

### 2. Screen Archetypes

* Login
   * Allows user to login with existing account or create a new account
* CourseView - List of subscribed courses
   * User select the course by touching the title to get further information
   * Swipe up and down to browse the whole list
* AddCourseView - All courses available to subscribe
   * Enter by selecting the Add button
   * User can manage their subscription course list by switching on/off a course
* CourseDetailView - Showing details of a specific course
   * Showing session time/location, recent activities, and comments
   * could enter further info by selecting the last two sections
* ActivityView - Showing all activities related to a specific course
   * Enter by selecting the Recent Activity Cell
   * Showing all activities related to a specific course
* CommentView - Showing all comments related to a specific course
   * Enter by selecting the Comment Cell
   * Showing all comments related to a specific course
* ToDoView - All user-defined activities

### 3. Navigation

**Tab Navigation** (Tab to Screen)
* Courses
* ToDo List

**Flow Navigation** (Screen to Screen)

* Login -> CourseView
* CourseView -> AddCourseView
* CourseView -> CourseDetailView
* CourseDetailView -> ActivityView
* CourseDetailView -> CommentView

## Wireframes
<img src="https://i.imgur.com/JCTy1N1.jpg" width=800>

## Schema 
### Models
#### User

   | Property     | Type   | Description |
   | ------------ | ------ | ----------- |
   | username     | String | user's unique username |
   | password     | String | user's password |
   | createdAt    | Date   | Date that the object has been updated |
   | updatedAt    | Date   | Date that the object has been updated |
   | coursesAdded | Array of Course | array of all courses subscribed by the user |
   | eventsAdded  | Array of Event | array of all event added by the user |
   
#### Course

   | Property | Type   | Description |
   | -------- | ------ | ----------- |
   | name     | String | course name |
   | lecTime  | String | lecture gathering time (E.g. "TuTh 02:00-03:20pm") |
   | lecPos   | String | lecture gathering room (E.g. "ALP 1200") |
   | disTime  | String | discussion gathering time |
   | disPos   | String | discussion gathering room |
   | labTime  | String | lab gathering time |
   | labPos   | String | lab gathering room |
   | events   | Array of Event | array of all event related to the course |
   | comments | Array of Comment | array of all comments under the course |
   
#### Event

   | Propoerty | Type   | Description |
   | --------- | ------ | ----------- |
   | title     | String | event title |
   | due       | String | event deadline (E.g. "11:59pm Jun02") |
   
#### Comment

   | Property | Type   | Description |
   | -------- | ------ | ----------- |
   | course   | Pointer to Course | identify which course this comment belongs to |
   | text     | String | comment text |
   | author   | Pointer to User | identify which user wrote this comment |  

### Networking
- [Add list of network requests by screen ]
- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp]
