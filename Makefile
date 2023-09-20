include .env

install:
	forge install OpenZeppelin/openzeppelin-contracts --no-commit

push:
	git add .
	git commit -m "deploy script, test"
	git push origin master


deploy-sepolia:
	forge script script/ReconquistaDeploy.s.sol:ReconquistaDeploy --rpc-url $(RPC_URL_SEPOLIA_ALCHEMY) --private-key $(PRIVATE_KEY_METAMASK) --broadcast --verify --etherscan-api-key $(API_KEY_ETHERSCAN) -vvvv

deploy-anvil:
	forge script script/ReconquistaDeploy.s.sol:ReconquistaDeploy --rpc-url http://localhost:8545 --private-key $(PRIVATE_KEY_ANVIL) --broadcast