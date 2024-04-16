# fly with tai

## Table of Contents

1. [Overview](#Overview)
2. [Product Spec](#Product-Spec)
3. [Wireframes](#Wireframes)
4. [Schema](#Schema)

## Overview

### Description

The Flight Bookings & Price Tracking app allows users to seamlessly search for available flights and conveniently track up to 5 flights of their choice. With automated notifications every 24 hours, users stay informed about any price changes, ensuring they never miss out on the best deals. Push notifications enhance the experience by delivering real-time updates, making travel planning effortless and cost-effective.

### App Evaluation

#### Mobile Experience
- **How uniquely mobile is the product experience?** 
  - The ability to search and track flights on the go makes it inherently mobile.
- **What makes your app more than a glorified website?** 
  - Integration of push notifications for flight price changes enhances real-time engagement and utility beyond a static website.

#### Story
- **How compelling is the story around this app once completed?**
  - The story of empowering users to effortlessly monitor and book flights amidst fluctuating prices is quite compelling.
- **How clear is the value of this app to your audience?**
  - The value is crystal clear: saving money and time by tracking and booking flights conveniently.
- **How well would your friends or peers respond to this product idea?**
  - Most would likely find it useful, especially frequent travelers or those who enjoy spontaneity.

#### Market
- **How large or unique is the market for this app?**
  - The market for flight booking apps is sizable and competitive, but the added feature of price tracking could set it apart.
- **What's the size and scale of your potential user base?**
  - Potential user base could range from occasional travelers to frequent flyers, encompassing a broad demographic.
- **Does this app provide huge value to a niche group of people?**
  - Yes, especially to those who are price-sensitive or frequently travel for business or leisure.
- **Do you have a well-defined audience of people for this app?**
  - Yes, primarily travelers who seek convenience and savings.

#### Habit
- **How habit-forming or addictive is this app?**
  - While not inherently addictive, the convenience of tracking flight prices could encourage habitual usage, especially for frequent travelers.
- **How frequently would an average user open and use this app?**
  - Usage frequency would likely vary depending on travel frequency, but regular notifications could prompt consistent usage.
- **Does an average user just consume your app or do they create?**
  - Users primarily consume by searching for flights and tracking prices.

#### Scope
- **How well-formed is the scope for this app?**
  - The scope is well-defined, focusing on flight search, tracking, and push notifications.
- **How technically challenging will it be to complete this app by the end of the program?**
  - Implementing real-time price tracking and push notifications may pose technical challenges but are feasible.
- **Is a stripped-down version of this app still interesting to build?**
  - Yes, even a basic version with flight search functionality would be useful.
- **How clearly defined is the product you want to build?**
  - The product is clearly defined as a mobile app for flight bookings with price tracking and push notifications.

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* user can track a flights prices
* user can search for flights
* user can view flight details
* user can be redirected to a payment page to buy a ticket
* user can see a list of all flights that match the search parameters.
* user can see a list of flights they are tracking 
* User signs up or logs into their account


**Optional Nice-to-have Stories**
* user can filter flights based on different parameters such as price
* user can have selected airlines that pop-up whenever they search
* users can add dream destination and can be notified when a travel deal is available


### 2. Screen Archetypes

- [ ] Login / Register
* User signs up or logs into their account

- [ ] Search
* user can search for flights


- [ ] Stream
* user can see a list of all flights that match the search parameters.

- [ ] Detail
* User can see the details of a particular flight
* user can be redirected to a payment page to buy a ticket

- [ ] Profile
* user can see a list of flights they are tracking 

- [ ] Settings
* user can change profile settings

### 3. Navigation

**Tab Navigation** (Tab to Screen)
* Stream
* Flight Search
* Profile

**Flow Navigation** (Screen to Screen)
- [ ] Login/Register
   * => Stream
- [ ] Search
   * => Detail
- [ ] Profile
   * => Settings
- [ ] Stream
   * => Detail



## Wireframes

[Add picture of your hand sketched wireframes in this section]
<img src="wirefram1.jpg" width=600>

### [BONUS] Digital Wireframes & Mockups

### [BONUS] Interactive Prototype

## Schema 

[This section will be completed in Unit 9]

### Models

[Add table of models]

### Networking

- [Add list of network requests by screen ]
- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp]
