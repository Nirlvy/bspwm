#!/bin/bash
if mpd
then
  while true; do
    while true; do
      mpc idle player &>/dev/null && break || mpd
    done

    file=`mpc current -f %file%`
    if [ "$file" == "$before_file" ]
    then
      continue
    fi

    before_file="$file"
    title=`mpc current -f %title%`
    artist=`mpc current -f %artist%`
    album=`mpc current -f %album%`

    ffmpeg -i /run/media/nirlvy/Document/Music"$file" /tmp/cover.jpg -y &> /dev/null
    notify-send -i /tmp/cover.jpg "$title" "$artist - $album"
  done
fi

