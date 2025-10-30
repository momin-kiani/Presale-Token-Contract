// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract PresaleToken is ERC20, Ownable {
    address public presale;

    error InvalidAddress();
    error InvalidAssignment();
    error NotAllowed();

    constructor() ERC20("PresaleToken", "PST") Ownable(msg.sender) {}

    function setPresale(address newPresale) external onlyOwner {
        if (newPresale == address(0)) {
            revert InvalidAddress();
        }

        if (newPresale == presale) {
            revert InvalidAssignment();
        }

        presale = newPresale;
    }

    function mint(address to, uint256 amount) external {
        /*if (msg.sender != presale) {
            revert NotAllowed();
        }*/

        _mint(to, amount);
    }
}