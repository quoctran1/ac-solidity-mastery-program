// // SPDX-License-Identifier: MIT
// pragma solidity ^0.8.0;

// import "./MyNFT.sol";
// import "@openzeppelin/contracts/access/Ownable.sol";

// contract MintingContract is Ownable {
//     MyNFT public nftContract;

//     constructor(address _nftContractAddress, address initialOwner) {
//         nftContract = MyNFT(_nftContractAddress);  // Set the NFT contract address
//         transferOwnership(initialOwner);  // Set the contract owner
//     }

//     // Mint a new NFT to a receiver using the MyNFT contract
//     function mint(address receiver) external onlyOwner {
//         nftContract.mintNFT(receiver);  // Call mintNFT on the MyNFT contract
//     }
// }