// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyToken is ERC20, Ownable {

    // Mapping for whitelist
    mapping(address => bool) public whitelist;

    // Mapping to track if an address has claimed tokens
    mapping(address => uint256) public claimedAmount;

    // Number of tokens to be dropped per claim  
    uint256 public constant maxClaimAmount = 0.1 * (10 ** 18); // 0.1 token

    // Token price
    uint256 public constant tokenPrice = 0.00000001 ether;

    // Start and end time for claiming
    uint256 public claimStartTime;
    uint256 public claimEndTime;

    // Event for logging successful claims
    event TokensClaimed(address indexed user, uint256 amount);

    constructor(address initialOwner) ERC20("MyToken", "MTK") Ownable(initialOwner) {
    _mint(msg.sender, 1000 * 10 ** decimals());
    }
    
    // Function to add addresses to the whitelist
    function addToWhitelist(address[] calldata addresses) external onlyOwner {
        for (uint256 i = 0; i < addresses.length; i++) {
            whitelist[addresses[i]] = true;
        }
    }

    // Function to remove addresses from the whitelist
    function removeFromWhitelist(address[] calldata addresses) external onlyOwner {
        for (uint256 i = 0; i < addresses.length; i++) {
            whitelist[addresses[i]] = false;
        }
    }

    // Function for whitelisted addresses to claim tokens
    function claimTokens() external payable {
        require(block.timestamp >= claimStartTime, "Claim period has not started");
        require(block.timestamp <= claimEndTime, "Claim period has ended");
        require(whitelist[msg.sender], "Not on the whitelist");
        require(claimedAmount[msg.sender] < maxClaimAmount, "Max claim reached");
        require(msg.value == tokenPrice, "Incorrect ETH amount. The price is 0.00000001 ETH");

        uint256 amountToClaim = maxClaimAmount - claimedAmount[msg.sender];

        _mint(msg.sender, amountToClaim);
        claimedAmount[msg.sender] += amountToClaim;

        emit TokensClaimed(msg.sender, amountToClaim);
    }

    // Function to withdraw collected ETH (only callable by the contract owner)
    function withdraw() external onlyOwner {
        uint256 contractBalance = address(this).balance;
        require(contractBalance > 0, "No funds to withdraw");
        (bool success, ) = payable(owner()).call{value: contractBalance}("");
        require(success, "Withdrawal failed");
    }

    // Function to set the claim period
    function setClaimPeriod(uint256 _claimStartTime, uint256 _claimEndTime) external onlyOwner {
        require(_claimEndTime > _claimStartTime, "Invalid claim period");
        claimStartTime = _claimStartTime;
        claimEndTime = _claimEndTime;
    }
}