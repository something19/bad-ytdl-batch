@echo off
echo a.youtube
echo b.Spotify 
echo c.Exit

set /p choose= Choose:
	if %choose%== a goto yt-link
	if %choose%== b goto spotify
	if %choose%== c Exit

:spotify
	echo insert spotify playlist/link
		set /p spotlink= Spotify Link:
		set /p spotdir= Spotify Dir:
	goto Spotify-dl

:yt-link
echo insert youtube link
	set /p ytlink= Link:
	Echo audio / video
	Echo a Audio
	Echo v Video
set /p format= Pick:
if %format% == a goto Audio
if %format% == v goto Video

:Audio
	Echo Set Music Directory/path
	set /p auddir=Dir:
	goto Audiodl
:Video
	Echo Set Video Path
	set /p viddir = Video Path:
	Echo Select your video quality
	Echo 1.Best
	Echo 2.720p
	Echo 3 720p60
	Echo 4 1080
	Echo 5 1080p60
	Echo 6.1440p
	Echo 7.4k
	Echo 8.720p //if the format isnt vp9

set /p Pick=
if %Pick%== 1 goto Best
if %Pick%== 2 goto 720p
if %Pick%== 3 goto 720p60
if %Pick%== 4 goto 1080p
if %Pick%== 5 goto 1080p60
if %Pick%== 6 goto 1440p
if %Pick%== 7 goto 4k
if %Pick%== 8 goto avc720p

:Best
		cls
		Echo Downloading Video
		youtube-dl -o %viddir%\%%(title)s-%%(id)s.%%(ext)s %ytlink%
		pause
	goto subs
:720p
		cls
		Echo Downloading Video
		youtube-dl -f 247+251 --merge-output-format mkv -o %viddir%\%%(title)s-%%(id)s.%%(ext)s %ytlink%
		pause
	goto subs
:avc720p 
		cls
		Echo Downloading Video
		Youtube-dl -f 22 --merge-output-format mkv -o %viddir%\%%(title)s-%%(id)s.%%(ext)s %ytlink%
		pause
	goto subs
:720p60
		cls
		Echo Downloading video
		youtube-dl -f 302+251 --merge-output-format mkv -o %viddir%\%%(title)s-%%(id)s.%%(ext)s %ytlink%
		pause
	goto subs
:1080p
		cls
		Echo Downloading Video
		youtube-dl -f 248+251 --merge-output-format mkv -o %viddir%\%%(title)s-%%(id)s.%%(ext)s %ytlink%
		pause
	goto subs
:1080p60
		cls
		Echo Downloading Vido
		youtube-dl -f 303+251 --merge-output-format mkv -o %viddir%\%%(title)s-%%(id)s.%%(ext)s %ytlink%
		pause
	goto subs
:1440p
		cls
		Echo Downloading Video
		youtube-dl -f 248+271 --merge-output-format mkv -o %viddir%\%%(title)s-%%(id)s.%%(ext)s %ytlink%
		pause
	goto subs
:4k
		cls
		Echo Downloading Video
		youtube-dl -f 313+251 --merge-output-format mkv -o %viddir%\%%(title)s-%%(id)s.%%(ext)s %ytlink%
		pause
	goto subs
:subs
		youtube-dl --sub-lang en --write-sub -o %viddir%\%%(title)s-%%(id)s.%%(ext)s --skip-download %ytlink%
		pause
	goto start


:Spotify-dl
		cls
		spotifydl -o %spotdir% %spotlink% 
		pause
	goto start
:Audiodl
		cls
		Echo Downloading Music
		youtube-dl --extract-audio -f bestaudio -o %auddir%\%%(title)s-%%(id)s.%%(ext)s %ytlink%
		pause
	goto start
