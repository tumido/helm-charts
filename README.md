# ⚓️ Project Thoth Helm Charts

A collection of Helm Charts to that are not available in any upstream location or customised to the point it does not make sense to support up stream chart development.

## 🧰 Add this Helm Repo to your local 🧰
```
helm repo add thoth-station https://thoth-station.ninja/helm-charts/
```

## 🏃‍♀️💨 How do I run a chart?
Login to your cluster and into your destination project. To install any given Chart using the default values just run:

```bash
helm install $NAME thoth-station/$CHART_NAME
```
Where:
* $NAME - is the name you want to give the installed Helm App
* $CHART_NAME - name of the chart found in `charts` directory


## 🏃‍♂️💨Customisation to a chart prior to install
For each chart, navigate to the root of it for the readme and default values. To over ride them, you could create your own `deployment-values.yaml` and make your changes there before installing

```bash
helm install $NAME -f deployment-values.yaml thoth-station/$CHART_NAME
```

## 🏃‍♂️💨 Chart linting

Before adding a chart to this repo, make sure there is no linting issues, otherwise the PR actions will fail.
We use both the integrated [`helm lint`](https://helm.sh/docs/helm/helm_lint/) command and the [`chart testing`](https://github.com/helm/chart-testing/blob/master/doc/ct_lint.md) tool.

```bash
helm lint charts/meteor-pipelines
ct lint charts/meteor-pipelines
```

## 👩‍🏫 Chart README Files
For more info on each chart checkout these!
* [meteor-pipelines](/charts/meteor-pipelines)
