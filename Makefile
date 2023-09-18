install:
	forge install OpenZeppelin/openzeppelin-contracts --no-commit


push:
	git add .
	git commit -m "init repo"
	git push origin master