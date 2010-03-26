--- 
wordpress_id: 323
layout: post
title: The spec so far
wordpress_url: http://blog.sideline.ca/2007/05/14/the-spec-so-far/

<p>This is the output that comes from running my test/spec tests on my current project.  As you can see, there are still some tests that aren't implemented yet.</p>
<p>What I love about this output is that I could easily show this to a client or product manager and they could instantly know how the project is going based on reading the output from the tests.  Heck, it might even entice them to regularly check the CruiseControl.rb project page!  That little step breaks down a lot of communication barriers on the team and allows everyone to start speaking the same language.</p>
<p>First for the models:</p>
<pre>
A game (in general)
- should not have a team playing itself
- should have two teams
- should return team names when sent #to_s
- should store starts_at in UTC format (disabled)

Trying to find upcoming games
- should return a list of future games
- should respect an arbitrary limit

A league (in general)
- should be invalid without a name
- should be invalid without a user
- should accept an optional url
- should be valid with a full set of valid attributes
- should be able to list its games (disabled)

A score (in general)
- should have both a home_team and away_team score if the game is in progress or completed
- should not have a score unless the game is inprogress or completed
- should not have a period or time_left unless game is inprogress
- should only support valid status entries from Score::STATUS_TYPES
- should have a UTC timestamp (disabled)

A team (in general)
- should be invalid without a name
- should be invalid without a league
- should accept an optional url

A user (in general)
- should be able to score the stats for a game
- should be able to see which games he has scored

Finished in 0.478132 seconds.

21 specifications, 3 disabled (26 requirements), 0 failures
</pre>
<p>And then for the controllers:</p>
<pre>
TeamsController
- should create team
- should destroy team
- should get edit
- should get index
- should get new
- should show team
- should update team

ScoresController
- should create score
- should destroy score
- should get edit
- should get index
- should get new
- should show score
- should update score

LeaguesController
- should create league
- should destroy league
- should get edit
- should get index
- should get new
- should show league
- should update league

A page listing games
- should provide a link to see tomorrow's games (disabled)
- should provide a link to see yesterday's games (disabled)

A page listing games (for each game) that are inprogress or completed
- should show the most recent score (disabled)
- should provide a count of the number of scores (disabled)
- should allow a visitor/user to vote on the score (disabled)

A page listing games (for each game) that have any status
- should provide a link to the game page (disabled)
- should show a count of comments (disabled)

A page listing an individual game that is inprogress or completed
- should list all of the scores for that game in order of creation (disabled)
- should provide links to the game score on other sporting sites (disabled)

A page listing an individual game that has any status
- should list the teams involved (disabled)
- should list the start date and time (disabled)
- should list all of the comments for that game (disabled)
- should allow a user to vote on any score (disabled)
- should allow a user to create a new score (disabled)

Finished in 0.84261 seconds.

35 specifications, 14 disabled (39 requirements), 0 failures
</pre>
