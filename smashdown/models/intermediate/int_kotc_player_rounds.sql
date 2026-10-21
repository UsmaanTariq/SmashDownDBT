with tournaments as (
    select * from {{ ref("stg_app__tournaments") }}
    where format = 'king_of_the_courts'
),

profiles as (
    select * from {{ ref("stg_app__profiles") }}
),

matches_players as (
    select * from {{ ref("stg_app__matches_players") }}
),

tournament_matches as (
    select * from {{ ref("stg_app__tournaments_matches") }}
),

matches as (
    select * from {{ ref("stg_app__matches") }}
),

rating_ledger as (
    select * from {{ ref("stg_app__rating_ledger") }}
)

SELECT 
    matches.match_id,
    matches.format,
    matches.completed_at,
    matches_players.player_id,
    matches_players.side,
    rating_ledger.rating_before,
    tournament_matches.slot,
    tournament_matches.round_number,
    tournaments.tournament_id,
    tournaments.format,
    tournaments.status,
    tournaments.is_rated
FROM matches
LEFT JOIN matches_players on matches.match_id = matches_players.match_id
LEFT JOIN rating_ledger on matches_players.player_id = rating_ledger.player_id and matches.match_id = rating_ledger.match_id
LEFT JOIN tournament_matches on matches.match_id = tournament_matches.match_id
LEFT JOIN tournaments on tournament_matches.tournament_id = tournaments.tournament_id
