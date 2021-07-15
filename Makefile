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
