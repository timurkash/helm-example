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

Then

```bash
make next
```
