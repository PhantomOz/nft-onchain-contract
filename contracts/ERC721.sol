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

    function generateCharacter(string memory _name) internal pure returns(string memory){
        bytes memory svg = abi.encodePacked(
            '<svg xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMinYMin meet" viewBox="0 0 350 350">',
            '<style>.base { fill: white; font-family: serif; font-size: 14px; }</style>',
            '<rect width="100%" height="100%" fill="black" />',
            '<text x="50%" y="40%" class="base" dominant-baseline="middle" text-anchor="middle">',"",_name,'</text>',
            '<text x="50%" y="50%" class="base" dominant-baseline="middle" text-anchor="middle">', "Web3Bridge CX Student",'</text>',
            '</svg>'
        );
        return string(
            abi.encodePacked(
                "data:image/svg+xml;base64,",
                Base64.encode(svg)
            )    
        );
    }

    function getTokenURI(string memory _name) internal view returns (string memory){
        bytes memory dataURI = abi.encodePacked(
            '{',
                '"name": "Web3Bridge Cohort X #', s_tokenCounter.toString(), '",',
                '"description": "Students in Web3bridge",',
                '"image": "', generateCharacter(_name), '"',
            '}'
        );
        return string(
            abi.encodePacked(
                "data:application/json;base64,",
                Base64.encode(dataURI)
            )
        );
    }

    function tokenURI(
        uint256 _tokenId
    ) external view override returns (string memory) {
        return s_tokenIdToUri[_tokenId];
    }
    
}