// SPDX-License-Identifier: MIT

pragma solidity 0.8.24;

import {Script, console} from "forge-std/Script.sol";
import {BasicNft} from "src/BasicNft.sol";

contract DeployBasicNft is Script {
    function run() external returns (BasicNft) {
        vm.startBroadcast();
        BasicNft basicNft = new BasicNft();
        console.log("msg.sender: %s", msg.sender);
        console.log("msg.sender balance", address(msg.sender).balance);
        vm.stopBroadcast();
        return basicNft;
    }
}
