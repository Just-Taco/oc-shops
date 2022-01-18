-- Created by Taco
-- Created by Taco
resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

dependency "vrp"

client_scripts {
    "lib/Tunnel.lua",
    "lib/Proxy.lua",
    "client.lua",
    "config.lua",
}

server_scripts {
    "@vrp/lib/utils.lua",
    "server.lua",
    "config.lua",
}