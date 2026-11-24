# TODO

- [ ] HLTV counts as a player while it connects. `WritePlayers` runs 0.1 s after `client_connect` and counts with `get_players` flags `"chi"`, but the `h` flag (skip HLTV) only works once the engine has flagged the client as a proxy, which it hasn't yet. So the file says 1 when only HLTV is on, and the counter-strike repo's `hltv.sh` starts a recording after every server start, which then stops after `RECORD_IDLE_STOP`. Fix: skip clients whose userinfo has `*hltv` (set from the start of the connection) as well as `is_user_hltv`, or count again in `client_putinserver`
- [ ] Write the count only when it changes (keep the last one written), instead of on every connect and disconnect
