// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract BasicNft is ERC721 {
    uint256 private s_tokenCounter;
    // string private baseURI;
    mapping(uint256 id => string Uri) private s_tokenIdToURI;

    constructor() ERC721("Dogie", "DOG") {
        // _mint(msg.sender, 1);
        // s_tokenCounter = 0;
    }

    function mintNft(string memory _uri) public {
        s_tokenIdToURI[s_tokenCounter] = _uri;
        s_tokenCounter++;
        _safeMint(msg.sender, s_tokenCounter);
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        return s_tokenIdToURI[tokenId];
    }
}
