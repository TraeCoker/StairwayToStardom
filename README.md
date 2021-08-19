# Stairway to Stardom

Stairway to Stardom is a fantasy band simulator made with Ruby on Rails.

## Installation

After cloning to a directory on your local machine run
```bash
bundle install
```
followed by
```bash
rake db:migrate
```
and finally to start the server run
```bash
rails s
```
In your browser, navigate to localhost:3000 to access the homepage.


## Usage
Upon visiting the homepage users are invited to make a new account or log in to an existing account


Upon logging in, users are invited to start a new band. Users may choose between available musicians (musicians not currently in a band) or create new musicians upon band formation. Every band must have a vocalist, guitarist, bassist, and drummer.

Once a band is formed, users can then practice and play shows to build their band's reputation. 

The band dashboard has many metrics including total shows played, practices since last show, overall band mood, reputation and each individual musician's reputation and fatigue level. Each of these metrics are updated as a band play's shows and practices and will effect the overall outcome of each show.

Users can disband their project or edit their name, genre, and hometown at anytime. Frequent updating is discouraged for it will have an effect on a band's reputation.

Clicking "book show" will navigate to an index of music venues matched to that band's reputation. As a band's reputation grows larger venues and shows will become available to play.

Selecting a venue users are then taken to a show confirmation form. Bonus options to promote a show will periodically appear and allow a show to have a greater influence on the reputation of a band's musicians.

When a show is completed an outcome of the show will be calculated via the band and venue's metrics at that moment in time and a "review" will be generated based on this outcome with a 0-4 star rating and a headline about the show custom to that band/venue.

A band's mood and reputation, how much they practice, and how quickly they play shows are all important considerations for playing a positive scoring show. These considerations evolve in importance as a band/musicians gain reputation. 

Negative show outcomes with increased musician fatigue increases the likelihood that a musician will quit a band following a show. If this happens the user must replace the musician either by creating a new musician or selecting from the available pool before they can continue. 

Users can only select from musicians matching the reputation of their band or lower, and musicians added to the lineup with a lower reputation can effect the overall band reputation. 

A musician who just left a band cannot rejoin that same band until they have joined (and departed) from a different band, but other users may now pick up the disbanded musician to join their band.

The game is one when a user achieves a band with a reputation of 10 and all the musicians also have a reputation of 10. Bands that beat the game are invited to the "Great Gig in the Sky" where they get to retire into the Hall of Fame.

For more information, here is a full video walkthrough:
https://www.youtube.com/watch?v=f-NMVfe-DE8


## License
[MIT](https://choosealicense.com/licenses/mit/)