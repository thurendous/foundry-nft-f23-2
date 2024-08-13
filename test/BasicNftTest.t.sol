// SPDX-License-Identifier: MIT

pragma solidity 0.8.24;

import {Test, console} from "forge-std/Test.sol";
import {DeployBasicNft} from "../script/DeployBasicNft.s.sol";
import {BasicNft} from "../src/BasicNft.sol";

contract BasicNftTest is Test {
    DeployBasicNft public deployer;
    BasicNft public basicNft;
    address public USER = address(1);
    string public constant PUG =
        "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";

    function setUp() public {
        deployer = new DeployBasicNft();
        basicNft = deployer.run();
    }

    function testCanMintAndHaveABalance() public {
        console.log("msg.sender: ", msg.sender);
        console.log("address this: ", address(this));

        vm.prank(USER);
        basicNft.mintNft(PUG);
        assertEq(basicNft.ownerOf(1), USER);
    }

    function testNameIsCorrect() public view {
        assertEq(basicNft.name(), "Dogie");
        assertEq(basicNft.symbol(), "DOG");

        assert(keccak256(abi.encodePacked(basicNft.name())) == keccak256(abi.encodePacked("Dogie")));
    }
}
