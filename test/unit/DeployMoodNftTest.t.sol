// SPDX-License_IDENTIFIER: MIT

pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {MoodNft} from "src/MoodNft.sol";
import {DeployMoodNft} from "script/DeployMoodNft.s.sol";

contract DeployMoodNftTest is Test {
    DeployMoodNft public deployer;

    function setUp() public {
        deployer = new DeployMoodNft();
    }

    function testConvertSvgToUri() public {
        string memory expectedUri =
            "data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iNTAwIiBoZWlnaHQ9IjUwMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48dGV4dCB4PSIwIiB5PSIxNSIgZmlsbD0icGluayI+SGkhIHlvdXIgYnJvd3NlciBkZWNvZGVkIHRoaXMhQDwvdGV4dD48L3N2Zz4=";
        string memory svg =
            '<svg width="500" height="500" xmlns="http://www.w3.org/2000/svg"><text x="0" y="15" fill="pink">Hi! your browser decoded this!@</text></svg>';
        string memory actualUri = deployer.svgToImageURI(svg);
        assertEq(actualUri, expectedUri);
        assert(keccak256(abi.encodePacked(actualUri)) == keccak256(abi.encodePacked(expectedUri)));
    }
}
