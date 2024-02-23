// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/utils/Base64.sol";

contract ERC721Token is ERC721 {
    using Strings for uint256;
    uint256 private s_tokenCounter;
    mapping(uint256 => string) private s_tokenIdToUri;

    constructor(string calldata _name, string calldata _symbol) ERC721(_name, _symbol) {
        s_tokenCounter = 0;
    }

    function mintNft(string memory _name) external {
        require(bytes(_name).length > 3);
        s_tokenIdToUri[s_tokenCounter] = getTokenURI(_name);
        _safeMint(msg.sender, s_tokenCounter);
        s_tokenCounter++;
    }
}