tf-init:
	make -C terraform tf-init

tf-plan:
	make -C terraform tf-plan

tf-apply:
	make -C terraform tf-apply

tf-show:
	make -C terraform tf-show

tf-destroy:
	make -C terraform tf-destroy

galaxy-install:
	make -C ansible galaxy-install

encrypt:
	make -C ansible encrypt

setup-servers:
	make -C ansible setup-servers

deploy:
	make -C ansible deploy

install-monitoring:
	make -C ansible install-monitoring
