resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

server_script "server.lua"

client_script "client.lua"

data_file("AUDIO_WAVEPACK")("stream/occlusions/shmann_audio_mix.dat")
data_file("AUDIO_SOUNDDATA")("stream/occlusions/shmann_audio_game.dat")

files {
    'html/sounds/*.ogg',
    'stream/**'
}

author 'Stevelo'