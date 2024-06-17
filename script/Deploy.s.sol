// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import { Script, console2 } from "forge-std/Script.sol";
import { MultiAdaptiveRelay } from "../src/MultiAdaptiveRelay.sol";

contract Deploy is Script {
    function setUp() public { }

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        new MultiAdaptiveRelay();
        vm.stopBroadcast();
    }
}
