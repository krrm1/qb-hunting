fx_version 'bodacious'
game 'gta5'

client_script {
    'client/cl_*.lua',
    'config.lua'
}
server_script 'server.lua'


files{
    'html/*'
}

ui_page('html/index.html')