{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "sfpg.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/**/}}
{{/*Create a default fully qualified app name.*/}}
{{/*We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).*/}}
{{/*If release name contains chart name it will be used as a full name.*/}}
{{/**/}}
{{/*{{- define "sfpg.fullname" -}}*/}}
{{/*{{- if .Values.fullnameOverride -}}*/}}
{{/*{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}*/}}
{{/*{{- else -}}*/}}
{{/*{{- $name := default .Chart.Name .Values.nameOverride -}}*/}}
{{/*{{- if contains $name .Release.Name -}}*/}}
{{/*{{- .Release.Name | trunc 63 | trimSuffix "-" -}}*/}}
{{/*{{- else -}}*/}}
{{/*{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}*/}}
{{/*{{- end -}}*/}}
{{/*{{- end -}}*/}}
{{/*{{- end -}}*/}}

{{- define "sfpg.nameVersion" -}}
{{- printf "%s-%s" .Values.name .Values.version -}}
{{- end -}}

{{- define "sfpg.releaseNameConfig" -}}
{{- printf "%s-config" .Release.Name -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "sfpg.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "sfpg.labels" -}}
helm.sh/chart: {{ include "sfpg.chart" . }}
{{ include "sfpg.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "sfpg.selectorLabels" -}}
app: {{ .Release.Name }}
version: {{ .Values.version }}
app.kubernetes.io/name: {{ .Release.Name }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "sfpg.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
{{/*    {{ default (include "sfpg.fullname" .) .Values.serviceAccount.name }}*/}}
{{- printf "%s-service-account" .Release.Name -}}
{{- else -}}
    {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{- define "sfpg.gateway" -}}
{{- printf "%s-gateway" .Release.Name -}}
{{- end -}}

{{- define "sfpg.grpc_health_probe_addr" -}}
{{- printf "-addr=%s" .Values.service.grpc.portString -}}
{{- end -}}

{{- define "sfpg.image" -}}
{{- if .Values.image.isPublic -}}
{{ default "default" .Values.image.public }}
{{- else -}}
{{- printf "%s.%s" .Values.image.registry .Values.image.repository -}}
{{- end -}}
{{- end -}}
