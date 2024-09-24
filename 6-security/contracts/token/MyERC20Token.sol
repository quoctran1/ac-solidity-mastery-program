// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";
contract MyERC20Token is ERC20, Ownable,AccessControl {

    uint256 public constant TOKEN_PRICE = 0.00000001 ether;  // Price of 1 token in ETH
    uint256 public constant MAX_TOKEN_PER_USER =0.1 * (10 ** 18);  // Maximum token a user can buy
    uint256 public constant CLAIM_PERIOD = 5 minutes;  // Whitelisted claim period
    mapping(address => bool) public whitelist;
    mapping(address => uint256) public purchasedTokens;

    bytes32 private constant ADMIN_ROLE = keccak256("ADMIN_ROLE");
    uint256 public claimStartTime;
    
 // Event for logging successful claims
    event TokensClaimed(address indexed user, uint256 amount);
    constructor(address initialOwner) ERC20("MyToken", "MTK") Ownable(initialOwner){
        claimStartTime = block.timestamp;
       
    }

    // Add users to whitelist
    function addToWhitelist(address[] calldata users) external onlyOwner {
        for (uint256 i = 0; i < users.length; i++) {
            whitelist[users[i]] = true;
        }
    }

    // Claim function for both whitelist and public users
    function claimTokens() external {
       require(whitelist[msg.sender], "Not on the whitelist");
        require(purchasedTokens[msg.sender] < MAX_TOKEN_PER_USER, "Max claim reached");
        // require(msg.value == TOKEN_PRICE, "Incorrect ETH amount. The price is 0.00000001 ETH");

        if (block.timestamp < claimStartTime + CLAIM_PERIOD) {
            // Whitelist claim period
            require(whitelist[msg.sender], "Not whitelisted for early claim");
        }

        uint256 amountToClaim = MAX_TOKEN_PER_USER - purchasedTokens[msg.sender];

        purchasedTokens[msg.sender] += amountToClaim;
        _mint(msg.sender, amountToClaim);

        emit TokensClaimed(msg.sender, amountToClaim);
    }

    // Withdraw function to allow the owner to withdraw collected ETH
    function withdrawETH() external onlyOwner {
        payable(owner()).transfer(address(this).balance);
    }

     function mintToken() external onlyOwner {
         _mint(msg.sender, 1000000 * 10 ** decimals());
          // Mint 1,000,000 tokens to contract
    }
}