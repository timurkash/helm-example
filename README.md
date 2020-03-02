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
