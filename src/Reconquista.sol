//SPDX-Identifier: MIT

// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Reconquista is ERC20 {
    constructor(uint256 _initialSupply) ERC20("Reconquista", "RQ") {}
}
