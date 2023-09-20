//SPDX-License-Identifier:MIT

pragma solidity ^0.8.18;
import {Test} from "forge-std/Test.sol";
import {ReconquistaDeploy} from "../script/ReconquistaDeploy.s.sol";
import {Reconquista} from "../src/Reconquista.sol";

contract ReconquistaTest is Test {
    uint256 public constant USER_INITAL_SUPPLY = 10 ether;

    Reconquista token;
    ReconquistaDeploy deployer;

    address alice = makeAddr("alice");
    address bob = makeAddr("bob");

    function setUp() public {
        deployer = new ReconquistaDeploy();
        token = deployer.run();

        vm.prank(msg.sender);
        token.transfer(alice, USER_INITAL_SUPPLY);
    }

    function testUserInitialSupply() public {
        assertEq(token.balanceOf(alice), USER_INITAL_SUPPLY);
    }

    function testAllowances() public {
        uint256 allowanceAmount = 1000;
        uint256 transferAmount = 50;

        vm.prank(alice);
        token.approve(bob, allowanceAmount);

        vm.prank(bob);
        // simple transfer: whoever calls the transfer function, is set as the from
        // it go through only if the from is approved before
        token.transferFrom(alice, bob, transferAmount);

        assertEq(token.balanceOf(bob), transferAmount);
        assertEq(token.balanceOf(alice), USER_INITAL_SUPPLY - transferAmount);
    }
}
