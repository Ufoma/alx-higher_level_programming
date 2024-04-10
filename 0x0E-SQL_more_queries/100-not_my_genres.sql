-- a script that lists all genres not linked to a show
SELECT tv_genres.name FROM tv_genres
LEFT JOIN (
    SELECT tv_genres.id
    FROM tv_genres
    JOIN tv_show_genres ON tv_genres.id = tv_show_genres.genre_id
    JOIN tv_shows ON tv_show_genres.show_id = tv_shows.id
    WHERE tv_shows.title = 'Dexter'
) AS linked_genres ON tv_genres.id = linked_genres.id
WHERE linked_genres.id IS NULL
ORDER BY tv_genres.name ASC;
