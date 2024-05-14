// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/access/Ownable.sol";

contract AccessControl {
    address public owner;
    mapping(address => bool) public hasAccess;
    mapping(string => address) public usernameToAddress; // Mapping from verified usernames to Ethereum addresses
    
    
    // Events to track sensitive operations
    event VideoChatAccessed(address indexed user);
    event VideoCallInitiated(address indexed user);
    event FriendStatusViewed(address indexed user, address indexed friend);
    event GroupChatParticipation(address indexed user);


    event AccessGranted(address indexed user);
    event AccessRevoked(address indexed user);

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }

    modifier onlyAuthenticated() {
        require(hasAccess[msg.sender], "User is not authenticated");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function authenticateUser(string memory _username, address _userAddress) external onlyOwner {
        require(usernameToAddress[_username] == _userAddress, "Username and address do not match");
        hasAccess[_userAddress] = true;
        emit AccessGranted(_userAddress);
    }

    function grantAccess(string memory _username) external onlyOwner {
        address userAddress = usernameToAddress[_username];
        require(userAddress != address(0), "Username not found");
        hasAccess[userAddress] = true;
        emit AccessGranted(userAddress);
    }

    function revokeAccess(address _user) external onlyOwner {
        hasAccess[_user] = false;
        emit AccessRevoked(_user);
    }

    function sensitiveFunction() external onlyAuthenticated {
       // Simulate accessing video chat rooms
       emit VideoChatAccessed(msg.sender);

       // Simulate initiating a video call
       emit VideoCallInitiated(msg.sender);

      // Simulate viewing a friend's status
      address friendAddress = 0x625BCC1142E97796173104A6e817Ee46C593b3C5; // Replace with friend's address
      emit FriendStatusViewed(msg.sender, friendAddress);

      // Simulate participating in a group chat
      emit GroupChatParticipation(msg.sender);
    }
}
