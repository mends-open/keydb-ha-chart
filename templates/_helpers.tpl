{{- define "keydb.fullname" -}}
{{- if .Values.nameOverride }}
{{- .Values.nameOverride }}
{{- else }}
{{- .Release.Name | printf "%s-%s" .Chart.Name }}
{{- end }}
{{- end -}}

{{- define "keydb.replicaofArgs" -}}
{{- range $i, $e := until .Values.replicaCount }}
{{- if gt $i 0 }}
--replicaof {{ printf "%s-%d.%s.%s" (include "keydb.fullname" $) $i (include "keydb.fullname" $) .Release.Namespace }} 6379 
{{- end }}
{{- end }}
{{- end -}}
