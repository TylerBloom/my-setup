#!/usr/bin/env python3

import dbus

trunclen = 25

try:
    session_bus = dbus.SessionBus()
    spotify_bus = session_bus.get_object("org.mpris.MediaPlayer2.spotify", "/org/mpris/MediaPlayer2")

    spotify_properties = dbus.Interface(spotify_bus, "org.freedesktop.DBus.Properties")

    status = spotify_properties.Get("org.mpris.MediaPlayer2.Player", "PlaybackStatus")

    if status == "Paused":
        print(f'Spotify {status}')
    else:
        metadata = spotify_properties.Get("org.mpris.MediaPlayer2.Player", "Metadata")

        artist = metadata['xesam:artist'][0]
        song = metadata['xesam:title']

        if len(song) > trunclen:
            song = song[0:trunclen]
            song += '...'
            if ('(' in song) and (')' not in song):
                song += ')'
        print(f'Playing: {song} by {artist}')
except:
    print("")
