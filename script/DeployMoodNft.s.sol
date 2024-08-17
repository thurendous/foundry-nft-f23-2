// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {Script, console} from "forge-std/Script.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";
import {MoodNft} from "src/MoodNft.sol";

contract DeployMoodNft is Script {
    function run() external returns (MoodNft) {
        string memory sadSvg = vm.readFile("./img/sad.svg");
        string memory happySvg = vm.readFile("./img/happy.svg");
        console.log("sadSvg: %s", sadSvg);
        console.log("happySvg: %s", happySvg);

        vm.startBroadcast();
        MoodNft moodNft = new MoodNft(svgToImageURI(sadSvg), svgToImageURI(happySvg));
        vm.stopBroadcast();
        console.log("Deployed MoodNft at: %s", address(moodNft));
        console.log("MoodNft.sadSvgImageUri: %s", moodNft.tokenURI(0));

        return moodNft;
    }

    function svgToImageURI(string memory svg) public pure returns (string memory) {
        // example:<svg width="500" height="500" xmlns="http://www.w3.org/2000/svg">
        // data:image/svg+xml;base64,Cjxzdmcgd2lkdGg9IjUwMCIgaGVpZ2h0PSI1MDAiIHhtbG5zPSJ
        string memory baseURL = "data:image/svg+xml;base64,";
        // return string(abi.encodePacked("data:image/svg+xml;base64,", svg));
        string memory svgBase64Encoded = Base64.encode(bytes(string(abi.encodePacked(svg))));

        return string(abi.encodePacked(baseURL, svgBase64Encoded));
    }
}
