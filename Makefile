
BRANCH:=gh-pages
URL:=https://timurkash.github.io/
NAME:=fp

pull:
	git pull origin $(BRANCH)

next:
	git add .
	git commit -m "Next"
	git push -u origin $(BRANCH)

update:
	helm repo update

index:
	helm repo index .. --url $(URL)
	mv ../index.yaml ./index.yaml -f

pack:
	@echo Packaging $(CHART)
	helm package $(CHART)
	make index

list:
	helm search repo --regexp $(NAME)/*

add:
	helm repo add $(NAME) $(URL)

del:
	helm repo remove $(NAME)