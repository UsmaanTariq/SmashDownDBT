# What are the Business Questions?

## How often do players move up and down courts?

**Why it matters:** Players sometimes complain that theres not variance with players on courts, a lot of times players are playing the same people again and again on top and bottom courts. This is to analyse whether the "King of the Courts" game mode needs a logic overhaul.

**Definition**

- Name: Player ID who has played at leaast 5 games.
- Games Played: Number of games played on rows court.
- Court Name: What tier of court they were on. This is manipulated by either being "First", "Last" or "{Court No}" (If inbetween first and last court)

**Grain** one row per court per player.

**Data needed:** 'profiles.name', "tournament_matches.slot", "matches_players.match_id"


## How much games has each person played?

## What are the quartiles for elo?

## What is the average ELO on each court?
