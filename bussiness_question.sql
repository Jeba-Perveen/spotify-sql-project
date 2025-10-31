-- EDA
select * from spotify_data;
select count(*) from spotify_data;
select distinct Artist from spotify_data;
select distinct Album_type from spotify_data;
select max(duration_min) from spotify_data;
select min(Duration_min) from spotify_data;
select * from spotify_data where duration_min <= 0;
select distinct channel from spotify_data;
select distinct most_playedon from spotify_data;


--Q1.Retrieve the name of all tracks that have more than 1 billion streams.
select *
from spotify_data
where Stream > 1000000000;

--Q2.List all albums along with their respective artist.
select album,artist
from spotify_data;

--Q3. Get the total number of comments for track where licensed = TRUE.
select sum(comments) as total_comments from spotify_data
where licensed = 'TRUE';

--Q4.find all tracks that belong to the album type single.
select *
from spotify_data
where album_type = 'single'

--Q5.count the total number of tracks by each artist.
select artist , count(*) as total_tracks
from spotify_data
group by artist;

--Q6.calculate the average danceability of tracks in each album
select album , avg(danceability) as avg_danceability
from spotify_data
group by album;


--Q7.find the top 5 tracks with the highest energy values.
select  top 5 track,max(energy) as max_energy
from spotify_data
group by track
order by max_energy desc;

--Q8.list all tracks along with their views and likes where official_video= TRUE.
select track,
	   sum(Views) as total_views,
	   sum(likes) as total_likes
from spotify_data
where official_video = 'TRUE'
group by track

--Q9.for each album, calculate the total views of all associated tracks.
select album,
	   track,
	   sum(views) as total_views
from spotify_data
group by album,track;


--Q10.Retrieve the track names that have been streamed on spotify more than youtube.
select * from(
select track,
       coalesce(sum(case when most_playedon = 'Spotify' then Stream end),0) as stream_on_spotify,
	   coalesce(sum(case when most_playedon = 'youtube' then Stream end),0) as stream_on_youtube
from spotify_data
group by track)t
where stream_on_spotify>stream_on_youtube
      and stream_on_youtube !=0

--Q11.find the top 3 most viewed tracks for each artist using window functions.
select Artist,
	   track,
	   total_views 
from(
	select Artist , 
		   track,
		   sum(views) as total_views,
		   DENSE_RANK() over(partition by Artist order by sum(views) desc) as rnk
	from spotify_data
	group by Artist,track)t
where rnk <=3



--Q12.write a query to find tracks where the liveness score is above the average.

select track,
	   artist,
	   Liveness
from spotify_data
where Liveness > (select avg(liveness) from spotify_data);


--Q13.use a with clause to calculate the difference between the highest and lowest energy value
  -- for tracks in each  album
with energ_value as (
	select Album,
		   max(energy) as max_energy,
		   min(energy) as min_energy
	from spotify_data
	group by album)
select Album,
	   max_energy - min_energy as energy_diff
from energ_value
where max_energy - min_energy !=0


--Q14.find tracks where the energy-to-liveness ratio is greater than 1.2
select track,
	   artist,
	   energy,
	   liveness,
	   energy/nullif(Liveness,0) as energy_liveness_ration
from spotify_data
where liveness is not null
	  and liveness != 0
	  and energy/nullif(Liveness,0) >1.2


--Q15.calculate the cumulative sum of likes for tracks ordered by number of views .
select track,
	   artist,
	   views,
	   likes,
	   sum(likes) over(order  by views rows between unbounded preceding and current row)  as cum_likes
from spotify_data
order by Views;
