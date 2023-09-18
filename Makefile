install-libs:
	forge install OpenZeppelin/openzeppelin-contracts


push:
	git add .
	git commit -m "init repo"
	git push origin master