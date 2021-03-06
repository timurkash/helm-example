
BRANCH:=gh-pages
URL:=https://timurkash.github.io/
ROUTER:=helm-example
NAME:=find-psy
CHART:=node

pull:
	git pull origin $(BRANCH)

next:
	git add .
	git commit -m "Next"
	git push -u origin $(BRANCH)

push:
	git push -u origin $(BRANCH)
	echo "You can open $(URL)$(ROUTER)/index.yaml in some time"

update:
	helm repo update

index:
	helm repo index .. --url $(URL)
	mv -f ../index.yaml ./index.yaml

pack:
	@echo Packaging $(CHART)
	helm package $(CHART)
	make index

pack-all:
	helm package sfpg node redi
	make index
	git add .

list:
	helm search repo --regexp $(NAME)/*

add:
	helm repo add $(NAME) $(URL)$(ROUTER)
	helm repo update

del:
	helm repo remove $(NAME)

ls:
	helm ls -A

temp:
	helm template name-chart $(CHART) > temp.yaml

start:
	start "$(URL)$(ROUTER)/index.yaml"
