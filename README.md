# hltv-tools

An AMX Mod X plugin for recording GoldSrc servers with HLTV, made for CS 1.6 on ReHLDS.

- **Voice in demos.** HLTV is a spectator, so normally it hears nobody and the demos have no voice chat. With this plugin HLTV hears every player, while players still hear only who the game rules allow (alltalk, teams, dead/alive). No `sv_alltalk` needed.
- **Who's on.** It writes the number of players to a file, connecting ones included, bots and HLTV not. A script next to HLTV can then record only while someone is on, instead of hours of an empty server.

## Requirements

- AMX Mod X 1.10
- ReAPI
- ReGameDLL, for the voice part. Without it the plugin still writes the player count, and logs that HLTV hears only who the rules allow.

## Install

Compile it, put it in `addons/amxmodx/plugins/`, and add a line to `addons/amxmodx/configs/plugins.ini`:

```sh
cd addons/amxmodx/scripting
./amxxpc /path/to/hltv_tools.sma -o../plugins/hltv_tools.amxx
echo hltv_tools.amxx >> ../configs/plugins.ini
```

## Using it

| | |
|---|---|
| `hltv_tools_voice` | cvar, `1` (default): HLTV hears every player. `0`: only who the game rules allow |
| `addons/amxmodx/data/hltv_tools_players.txt` | the player count, one number and a newline, rewritten when someone connects and every 2 seconds |

To record only while someone is on, have a script watch the file and send HLTV `record <name>` when the count goes above 0, and `stoprecording` once it has been 0 for a while. HLTV finishes the demo properly on `stoprecording` (it writes the directory), unlike when it gets killed.

[counter-strike-podman](https://git.nnstdios.com/nnra6864/counter-strike-podman) does exactly that (`scripts/hltv.sh`), and runs [goldsrc-demo-tools](https://git.nnstdios.com/nnra6864/goldsrc-demo-tools) on each finished demo: it repairs demos left by a crash, deletes those nobody joined, and writes the voice chat of the rest to a `.mka` with a track per player.

# ☦

```
   Ὤ
 Ὁ   Ν
Ι̅Ϲ̅ │ Χ̅Ϲ̅
───┼───
ΝΙ │ ΚΑ
   ☦
```

Εἰς δόξαν τοῦ Θεοῦ<br>
*To the glory of God*

Τῇ Ὑπεραγίᾳ Θεοτόκῳ δόξα<br>
*Glory to the Most Holy Theotokos*

Δόξα τῷ Θεῷ πάντων ἕνεκεν<br>
*Glory to God for all things*

ΑΜΗΝ

☦
