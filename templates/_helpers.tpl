{{- define "keydb.fullname" -}}
{{- if .Values.nameOverride }}
{{- .Values.nameOverride }}
{{- else }}
{{- .Release.Name | printf "%s-%s" .Chart.Name }}
{{- end }}
{{- end -}}

{{- define "keydb.replicaofArgs" -}}
{{- $fullname := include "keydb.fullname" . -}}
{{- $namespace := .Release.Namespace -}}
{{- range $i, $e := until (int .Values.replicaCount) }}
{{- if gt $i 0 }}
--replicaof {{ printf "%s-%d.%s.%s" $fullname $i $fullname $namespace }} 6379
{{- end }}
{{- end }}
{{- end -}}
