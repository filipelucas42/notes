# openvpn3

openvpn3 uses D-Bus and does not require root for most operations.

## Config management

* import a config: `openvpn3 config-import --config client.ovpn`
* import with persistent name: `openvpn3 config-import --config client.ovpn --name mywork --persistent`
* list imported configs: `openvpn3 configs-list`
* show config details: `openvpn3 config-show --config <config_name>`
* remove a config: `openvpn3 config-remove --config <config_name>`

## Connect and disconnect

* start a session: `openvpn3 session-start --config client.ovpn`
* start from imported config: `openvpn3 session-start --config <config_name>`
* disconnect a session: `openvpn3 session-manage --disconnect --session-path <session_path>`
* disconnect by config name: `openvpn3 session-manage --disconnect --config <config_name>`
* pause a session: `openvpn3 session-manage --pause --config <config_name>`
* resume a session: `openvpn3 session-manage --resume --config <config_name>`
* restart a session: `openvpn3 session-manage --restart --config <config_name>`

## List and inspect sessions

* list active sessions: `openvpn3 sessions-list`
* show session stats: `openvpn3 session-stats --config <config_name>`

## Logging

* stream live logs: `openvpn3 log --config <config_name>`
* set log level (0-6): `openvpn3 log --config <config_name> --log-level 6`
