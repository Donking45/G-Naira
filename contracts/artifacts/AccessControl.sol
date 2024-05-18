// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";

contract SeeMeContract is Ownable, AccessControl {
    // Define roles with context-specific names
    bytes32 public constant ADMIN_ROLE = keccak256("ADMIN_ROLE");
    bytes32 public constant USER_ROLE = keccak256("USER_ROLE");

    
    constructor() Ownable(msg.sender) {
        _grantRole(ADMIN_ROLE, msg.sender);
        _grantRole(USER_ROLE, msg.sender);
    }

    function grantUserRole(address user) public onlyOwner {
        grantRole(USER_ROLE, user);
    }

    
    function rovokeUserRole(address user) public onlyOwner {
        revokeRole(USER_ROLE, user);
    }

    function foo() public view {
        require(
            hasRole(USER_ROLE, msg.sender),
            "Should have USER_ROLE to call this function"
        );
        // Content of the function
    }
}