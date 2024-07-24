{{- define "keydb.fullname" -}}
{{- if .Values.nameOverride }}
{{- .Values.nameOverride }}
{{- else }}
{{- .Release.Name | printf "%s-%s" .Chart.Name }}
{{- end }}
{{- end -}}

{{- define "keydb.replicaofArgs" -}}
{{- $fullname := include "keydb.fullname" . -}}
{{- range $i, $e := until (int .Values.replicaCount) }}
{{- if gt $i 0 }}
--replicaof {{ printf "%s-%d" $fullname (modulo (add $i 1) (int .Values.replicaCount)) }} 6379
{{- end }}
{{- end }}
{{- end -}}
