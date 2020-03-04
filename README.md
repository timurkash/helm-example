# My helm charts

Description how to create chart `sfpg`

```bash
helm create sfpg
```

You have to modify this helm chart with `README.md`

```bash
helm package sfpg
make index
```

The `index.yaml` will be modified

And

```bash
make next
```

Then in a minute https://timurkash.github.io/helm-example/index.yaml will be changed with `sfpg` chart

So you can add this repo to local as `NAME` (`NAME` in `Makefile`)

```bash
make add
```

And list all charts in `NAME`
```bash
make list
```

You can get
```cmd
NAME            	CHART VERSION	APP VERSION	DESCRIPTION                
find-psy/mychart	0.1.0        	1.16.0     	A Helm chart for Kubernetes
find-psy/sfpg   	0.1.0        	1.16.0     	A Helm chart for Kubernetes
```

with chart `sfpg`

In order to get yamls

```cmd
helm template accounts find-psy/sfpg -f=values.yaml
```
where 
- `accounts` is `.Release.Name`, 
- `find-psy/sfpg` is chart,
- `values.yaml` is file with values that override `sfpg/values.yaml` is chart

To show all installed charts in kubernetes cluster
```bash
make ls
```

To unistall specified chart in namespace 
```bash
helm uninstall events -n=staging
```
