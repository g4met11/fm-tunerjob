fx_version 'cerulean'
game 'gta5'

author 'Focking Mikkel'
description 'Tunerjob made for QBCore'
version '1.0.0'

shared_script 'config.lua'

client_scripts { 
    'client/main.lua'
}


server_scripts {
    '@oxmysql/wrapper.lua',
    'server/main.lua',
}