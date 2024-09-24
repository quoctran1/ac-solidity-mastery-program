// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyNFT is ERC721, Ownable {
    uint256 public nextTokenId;
    uint256 public maxSupply=1000;
    bool public whitelistEnabled = true;

    mapping(address => bool) private whitelist;
    mapping(address => uint256) private claimed;  // To track the number of NFTs claimed by each address

    constructor(address initialOwner) ERC721("MyNFT", "MNFT") Ownable(initialOwner){
       
    }

    modifier onlyWhitelisted() {
        require(!whitelistEnabled || whitelist[msg.sender], "Not whitelisted");
        require(claimed[msg.sender] < 1, "Already claimed your NFT");
        _;
    }

    // Add an address to the whitelist
    function addToWhitelist(address _address) external onlyOwner {
        whitelist[_address] = true;
    }

    // Remove an address from the whitelist
    function removeFromWhitelist(address _address) external onlyOwner {
        whitelist[_address] = false;
    }

    // Enable or disable the whitelist
    function setWhitelistEnabled(bool _enabled) external onlyOwner {
        whitelistEnabled = _enabled;
    }

    // Mint a new NFT (only 1 allowed per whitelisted address)
    function mint() external onlyWhitelisted {
        require(nextTokenId < maxSupply, "Max supply reached");
        
        _safeMint(msg.sender, nextTokenId);
        nextTokenId++;

        claimed[msg.sender] = 1;  // Mark that this address has claimed 1 NFT
    }
}