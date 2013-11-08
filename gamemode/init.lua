AddCSLuaFile("shared.lua")
AddCSLuaFile("cl_init.lua")
include("shared.lua")

GAMEMODE = {}

GAMEMODE.Teams[TEAM_AFD] = {name = "Amalgamated Fluorodynamics", efficency = 1}
GAMEMODE.Teams[TEAM_MCL] = {name = "Midland Carbide Labs", efficency = 1}