# NetBird

## Re-registering a peer after login expiration

If a peer was originally registered via interactive login and that login expires, the peer can get stuck in a state where a setup key no longer works.

The reason is that the existing local peer registration/state is still present, and the setup key cannot override it cleanly.

Try this sequence:

```bash
# 1. Stop the service
sudo netbird down

# 2. Clear the local state
sudo netbird service stop
sudo rm -rf /etc/netbird/config.json

# 3. Restart the service
sudo netbird service start

# 4. Register fresh with the setup key
sudo netbird up --management-url https://vpn.techland42.com --setup-key 840A230B-DA76-4D0A-8DE7-CC202BC1832E
```

If that still doesn't work, delete the old peer from the NetBird dashboard under **Peers** before re-registering. The management server may reject the new registration if it sees a conflicting existing peer entry for the same machine identity.

After it is working again, go to the NetBird dashboard settings and disable **Peer Login Expiration**, or at least extend it significantly. Otherwise peers originally registered through interactive login can hit the same issue later.
