//SPDX-License-Identifier:MIT

pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {Reconquista} from "../src/Reconquista.sol";

contract ReconquistaDeploy is Script {
    uint256 public constant INITIAL_SUPPLY = 1000 ether;

    function run() external returns (Reconquista) {
        vm.startBroadcast();
        Reconquista reconquista = new Reconquista(INITIAL_SUPPLY);
        vm.stopBroadcast();
        return reconquista;
    }
}
