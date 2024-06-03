// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";

contract gNGN is ERC20, AccessControl {
    mapping(address => bool) isBlacklisted;

     bytes32 public constant GOVERNOR_ROLE = keccak256("GOVERNOR_ROLE");

    constructor(address multisigWallet) ERC20("G-Naira", "gNGN") {
        _grantRole(GOVERNOR_ROLE, multisigWallet);
    }

    function mint(address to, uint256 amount) public onlyRole(GOVERNOR_ROLE) {
        require(!isBlacklisted[to], "Address is blacklisted");
        _mint(to, amount);
    }

    function burn(uint256 amount) public onlyRole(GOVERNOR_ROLE) {
        require(!isBlacklisted[_msgSender()], "Address is blacklisted");
        _burn(_msgSender(), amount);
    }

    function blackList(address _user) public onlyRole(GOVERNOR_ROLE) {
        require(!isBlacklisted[_user], "user is already blacklisted");
        isBlacklisted[_user] = true;
    }
}


