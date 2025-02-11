--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function widget:GetInfo()
	return {
		name	= "Music Player Lite",
		desc	= "Plays music for ingame lobby client",
		author	= "GoogleFrog and KingRaptor",
		date	= "25 September 2016",
		license	= "GNU GPL, v2 or later",
		layer	= 2000,
		enabled	= true	--	loaded by default?
	}
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

local playingTrack	-- boolean
local previousTrack
local loopTrack	-- string trackPath
local randomTrackList
local openTrack

local function GetRandomTrack(previousTrack)
	local trackCount = #randomTrackList
	local previousTrackIndex
	if previousTrack then
		for i = 1, #randomTrackList do
			if randomTrackList[i] == previousTrack then
				trackCount = trackCount - 1
				previousTrackIndex = i
				break
			end
		end
	end

	local randomTrack = math.ceil(math.random()*trackCount)
	if randomTrack == previousTrackIndex then
		randomTrack = trackCount + 1
	end
	return randomTrackList[randomTrack]
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

local function StartTrack(trackName, volume)
	trackName = trackName or GetRandomTrack(previousTrack)
	volume = volume or WG.Chobby.Configuration.menuMusicVolume
	Spring.Echo("Starting Track", trackName, volume)
	if volume == 0 then
		return
	end
	Spring.StopSoundStream()
	Spring.PlaySoundStream(trackName, volume)
	Spring.SetSoundStreamVolume(volume)
	playingTrack = true
end

local function LoopTrack(trackName, trackNameIntro, volume)
	trackNameIntro = trackNameIntro or trackName
	loopTrack = trackName
	StartTrack(trackNameIntro, volume)
end

local function StopTrack()
	Spring.StopSoundStream()
	playingTrack = false
	loopTrack = nil
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

local function SetTrackVolume(volume)
	if volume == 0 then
		StopTrack()
		return
	end
	if playingTrack then
		Spring.SetSoundStreamVolume(volume)
		return
	end
	StartTrack(GetRandomTrack(), volume)
	previousTrack = nil
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

local firstActivation = true
local ingame = false

function widget:Update()

	if ingame or (WG.Chobby.Configuration.menuMusicVolume == 0 )then
		return
	end

	if not playingTrack then
		return
	end

	local playedTime, totalTime = Spring.GetSoundStreamTime()
	playedTime = math.floor(playedTime)
	totalTime = math.floor(totalTime)

	if (playedTime >= totalTime) then
		local newTrack = loopTrack or GetRandomTrack(previousTrack)
		StartTrack(newTrack)
		previousTrack = newTrack
	end
end

local MusicHandler = {
	StartTrack = StartTrack,
	StopTrack = StopTrack,
	LoopTrack = LoopTrack
}

-- Called just before the game loads
-- This could be used to implement music in the loadscreen
--function widget:GamePreload()
--	-- Ingame, no longer any of our business
--	if Spring.GetGameName() ~= "" then
--		ingame = true
--		StopTrack()
--	end
--end

-- called when returning to menu from a game
function widget:ActivateMenu()
	ingame = false
	if firstActivation then
		StartTrack(openTrack)
		previousTrack = openTrack
		firstActivation = false
		return
	end
	-- start playing music again
	local newTrack = GetRandomTrack(previousTrack)
	StartTrack(newTrack)
	previousTrack = newTrack
end


function playlistMerge(t1, t2)
	for k,v in ipairs(t2) do
	   table.insert(t1, v)
	end 
	return t1
end

function widget:Initialize()

	--math.randomseed( os.clock() )
	--math.random(); math.random(); math.random()

	randomTrackList = {}
	local originalSoundtrackEnabled = Spring.GetConfigInt('UseSoundtrackNew', 1)
	local customSoundtrackEnabled	= Spring.GetConfigInt('UseSoundtrackCustom', 1)
	local allowedExtensions = "{*.ogg,*.mp3}"
	
	local musicPlaylist = {}
	-- Original Soundtrack List
	if originalSoundtrackEnabled == 1 then
		local musicDirOriginal 		= 'luamenu/configs/gameconfig/byar/lobbyMusic/original'
		randomTrackList = playlistMerge(randomTrackList, VFS.DirList(musicDirOriginal, allowedExtensions))
	end

	-- Custom Soundtrack List
	if customSoundtrackEnabled == 1 then
		local musicDirCustom 		= 'music/custom/menu'
		randomTrackList = playlistMerge(randomTrackList, VFS.DirList(musicDirCustom, allowedExtensions))
		local musicDirCustom2 		= 'music/custom/peace'
		randomTrackList = playlistMerge(randomTrackList, VFS.DirList(musicDirCustom2, allowedExtensions))
	end

	if randomTrackList == nil or #randomTrackList == 0 then
		Spring.Log("snd_music.lite.lua", LOG.NOTICE, "No random track list found, disabling lobby music")
		widgetHandler:RemoveWidget()
		return
	end

	for i = 1,1000 do
		openTrackTest = randomTrackList[math.random(#randomTrackList)]
		Spring.Echo("[LobbyMusicPlayer] OpenTrackTest path: "..openTrackTest)
		if string.find(openTrackTest, "(intro)") or string.find(openTrackTest, "(INTRO)") then
			openTrack = openTrackTest
			break
		end
		if i == 1000 then
			openTrack = randomTrackList[math.random(#randomTrackList)]
		end
	end

	local Configuration = WG.Chobby.Configuration

	local function onConfigurationChange(listener, key, value)
		if key == "menuMusicVolume" then
			SetTrackVolume(value)
		end
	end
	Configuration:AddListener("OnConfigurationChange", onConfigurationChange)

	local function OnBattleAboutToStart()
		ingame = true
		StopTrack()
	end
	WG.LibLobby.localLobby:AddListener("OnBattleAboutToStart", OnBattleAboutToStart)
	WG.LibLobby.lobby:AddListener("OnBattleAboutToStart", OnBattleAboutToStart)

	WG.MusicHandler = MusicHandler
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
