// Helpers for HLTV recording.
//
// Voice: HLTV hears every player, so voice chat ends up in the recorded demos (cvar
// hltv_tools_voice, 1 by default). Players still hear only who the game rules allow
// (alltalk, teams, dead/alive). Needs ReGameDLL.
//
// Players: the number of players on the server (connecting ones included, bots and HLTV
// not) is written to <amxx datadir>/hltv_tools_players.txt when someone connects and every
// 2 seconds, so HLTV can record only while someone is on.
#include <amxmodx>
#include <reapi>

new g_voice
new g_players_file[PLATFORM_MAX_PATH]

public plugin_init()
{
	register_plugin("HLTV Tools", "1.1", "nnra")

	g_voice = create_cvar("hltv_tools_voice", "1", FCVAR_NONE, "HLTV hears every player")
	if (is_regamedll())
		RegisterHookChain(RG_CSGameRules_CanPlayerHearPlayer, "@CanPlayerHearPlayer", false)
	else
		log_amx("ReGameDLL not loaded: HLTV hears only who the game rules allow")

	get_localinfo("amxx_datadir", g_players_file, charsmax(g_players_file))
	add(g_players_file, charsmax(g_players_file), "/hltv_tools_players.txt")
	WritePlayers()
	set_task(2.0, "WritePlayers", _, _, _, "b")
}

@CanPlayerHearPlayer(const listener, const sender)
{
	if (!get_pcvar_num(g_voice) || !is_user_hltv(listener))
		return HC_CONTINUE

	SetHookChainReturn(ATYPE_BOOL, true)
	return HC_SUPERCEDE
}

public client_connect(id)
{
	// The player counts as connecting once the forward has returned
	set_task(0.1, "WritePlayers")
}

public WritePlayers()
{
	new players[MAX_PLAYERS], count
	get_players(players, count, "chi")
	new file = fopen(g_players_file, "wt")
	if (file)
	{
		fprintf(file, "%d^n", count)
		fclose(file)
	}
}
