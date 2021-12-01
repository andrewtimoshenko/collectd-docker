# Hostname "{{ .Env "COLLECTD_HOST" }}"

FQDNLookup false
# {{ .Env "COLLECTD_INTERVAL" }}
Interval 5
Timeout 2
ReadThreads 5

# LoadPlugin write_graphite
# <Plugin "write_graphite">
#     <Carbon>
#         Host "{{ .Env "GRAPHITE_HOST" }}"
#         Port "{{ .Env "GRAPHITE_PORT" }}"
#         Protocol "tcp"
#         Prefix "{{ .Env "GRAPHITE_PREFIX" }}"
#         StoreRates true
#         EscapeCharacter "."
#         AlwaysAppendDS false
#         SeparateInstances true
#     </Carbon>
# </Plugin>

<Plugin network>
      # client setup:
      # Server "ff18::efc0:4a42" "25826"
      <Server "172.17.0.1" "25826">
              # SecurityLevel Encrypt
              # Username "user"
              # Password "secret"
              Interface "eth0"
              ResolveInterval 14400
      </Server>
      TimeToLive 128
#
#        # server setup:
#       Listen "ff18::efc0:4a42" "25826"
#        <Listen "0.0.0.0" "25826">
#               SecurityLevel Sign
#               AuthFile "/etc/collectd/passwd"
#                Interface "lo"
#        </Listen>
#        MaxPacketSize 1452
#
#       # proxy setup (client and server as above):
#       Forward true
#
#       # statistics about the network plugin itself
#       ReportStats false
#
#       # "garbage collection"
#       CacheFlush 1800
</Plugin>

LoadPlugin exec
<Plugin exec>
  Exec "collectd-docker-collector" "/usr/bin/collectd-docker-collector" "-endpoint" "unix:///var/run/docker.sock" "-host" "{{ .Env "COLLECTD_HOST" }}" "-interval" "{{ .Env "COLLECTD_INTERVAL" }}"
</Plugin>
