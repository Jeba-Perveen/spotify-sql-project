create database spotify_db;

create table spotify(
		Artist            nvarchar(300),
		Track             nvarchar(300),
		Album             nvarchar(300),
		Album_type        nvarchar(60),
		Danceability      float,
		Energy            float,
		Loudness          float,
		Speechiness		    float,
		Acousticness	    float,
		Instrumentalness  float,
		Liveness		      float,
		Valence			      float,
		Tempo			       float,
		Duration_min	   float,
		Title			       nvarchar(300),
		Channel			     nvarchar(300),
		Views			       float,
		Likes		         bigint,
		Comments		     bigint,
		Licensed		     nvarchar(10),
		official_video    nvarchar(10),
		Stream			     bigint,
		EnergyLiveness    float,
		most_playedon     nvarchar(60));

bulk insert spotify
from 'C:\Users\jebap\Downloads\cleaned_dataset.csv'
with (
		fieldterminator = ',',
		firstrow = 2,
		tablock,
		keepnulls)
		
