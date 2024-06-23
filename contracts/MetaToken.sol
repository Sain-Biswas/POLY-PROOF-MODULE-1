// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract MetaToken is ERC721, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    constructor() ERC721("Spiderman", "kh") {}

    string[] uri = [
        "https://lime-fascinating-chameleon-495.mypinata.cloud/ipfs/QmdRp5V2hqtG63BWy3ERV7bPudfusXZGxEYR4C6SmQGg2q",
        "https://lime-fascinating-chameleon-495.mypinata.cloud/ipfs/QmWucJVVf3EZv74KuHkfVmk2mEqrmKZ9AydCvjsQUoJk8H",
        "https://lime-fascinating-chameleon-495.mypinata.cloud/ipfs/QmVJFV5scW73iqYuffZGJu6PnKu6ksSvXFmP1h4jQwZ42N",
        "https://lime-fascinating-chameleon-495.mypinata.cloud/ipfs/QmRHaDvbKgQgr9URPmGPYGdMCjQymUR6LtrK8CG3ZCmE9t",
        "https://lime-fascinating-chameleon-495.mypinata.cloud/ipfs/QmQDAJDGmv2ipAgMjDTdk1UNNJNADPkjC4ifLk4PWxHax9"
    ];

    string[] prompt = [
        "Water Painted Colorful Bear with light theme",
        "Angry colorful dragon with dark background",
        "red dragon with flowers",
        "colorful dragon with dark background and sun",
        "colorful dragon with white background"
    ];

    function mint(address to) public onlyOwner returns (uint256) {
        _tokenIds.increment();

        uint256 tokenId = _tokenIds.current();

        _safeMint(to, tokenId);
        return tokenId;
    }

    function promptDescription(
        uint256 tokenID
    ) external view returns (string memory) {
        return prompt[tokenID];
    }
}
