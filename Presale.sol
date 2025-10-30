/*Make a simple presale contract:
Deploy 2 basic erc20 tokens to serve as a:
Payment token
Presale token
Make a presale contract that takes the payment token (valued at 2$) and returns equivalent in value amount of the presale token (valued at 0.125$)
The presale token must be minted directly to the buyer's wallet
The minimum value that a user can buy for is 0.16$
The maximum value that a user can buy for is 40,000$
The presale should end when 120,000$ of tokens are purchased*/

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.30;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

import "./IPresaleToken.sol";

contract Presale is Ownable {
    IERC20 public paymentToken;
    IPresaleToken public presaleToken;

    uint256 public constant MIN_VALUE = 0.16 * 1e18;
    uint256 public constant MAX_VALUE = 40000 * 1e18;
    uint256 public constant TOTAL_VALUE = 120000 * 1e18;

    uint256 public totalValueSold;

    constructor(IERC20 newPaymentToken, IPresaleToken newPresaleToken) Ownable(msg.sender) {
        paymentToken = newPaymentToken;
        presaleToken = newPresaleToken;
    }

    function buyToken(uint256 paymentAmount) public {
        uint256 usdValue = paymentAmount * 2;

        require(usdValue >= MIN_VALUE && usdValue <= MAX_VALUE, "Invalid amount");
        require(totalValueSold + usdValue <= TOTAL_VALUE, "Presale cap reached");

        // Transfer PaymentToken from buyer → contract
        paymentToken.transferFrom(msg.sender, address(this), paymentAmount);

        uint256 tokensToMint = (usdValue * 1000) / 125;

        // Update total sold
        totalValueSold += usdValue;

        // Mint PresaleTokens to buyer
        presaleToken.mint(msg.sender, tokensToMint);
    }
}
