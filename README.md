# gNGN Smart Contract
## Overview
The gNGN smart contract is an ERC20 token contract with additional access control features. It is designed to manage a token called "G-Naira" (symbol: gNGN).
The contract includes functionality for minting and burning tokens, as well as blacklisting addresses to prevent certain operations.
Access to sensitive operations is restricted to accounts with a specific role (GOVERNOR_ROLE), which is assigned to a multisignature wallet for enhanced security.

## Features
### ERC20 Token Implementation:
The contract inherits from OpenZeppelin's ERC20 implementation, providing standard ERC20 functionality.

### Access Control:
Uses OpenZeppelin's AccessControl to manage permissions.

### Minting: 
Allows minting of new tokens to specified addresses.

### Burning:
Allows burning of tokens from the caller's balance.

### Blacklisting:
Allows blacklisting of addresses, preventing them from minting or burning tokens.

## Contract Details
### State Variables
- mapping(address => bool) isBlacklisted: A mapping to keep track of blacklisted addresses.
- bytes32 public constant GOVERNOR_ROLE: A constant identifier for the governor role.

### Constructor
The constructor initializes the contract by:
- Setting the name (G-Naira) and symbol (gNGN) of the ERC20 token.
- Assigning the GOVERNOR_ROLE to the specified multisignature wallet address.

### Functions
### mint
Mints new tokens to a specified address.

### Parameters:
- to: The address to receive the minted tokens.
- amount: The number of tokens to mint.
  
### Modifiers:
- onlyRole(GOVERNOR_ROLE): Restricts access to accounts with the GOVERNOR_ROLE.
  
### Conditions:
The to address must not be blacklisted.

### burn
Burns tokens from the caller's balance.

### Parameters:
- amount: The number of tokens to burn.
  
### Modifiers:
- onlyRole(GOVERNOR_ROLE): Restricts access to accounts with the GOVERNOR_ROLE.

## Interacting with the Contract
### Minting Tokens
To mint tokens, an account with the GOVERNOR_ROLE must call the mint function, specifying the recipient address and the amount of tokens to mint.

### Burning Tokens
To burn tokens, an account with the GOVERNOR_ROLE must call the burn function, specifying the amount of tokens to burn from the user's balance.

### Blacklisting Addresses
To blacklist an address, an account with the GOVERNOR_ROLE must call the blackList function, specifying the address to blacklist.

## Security Considerations
- Access Control: The GOVERNOR_ROLE is assigned to a multisignature wallet to ensure that no single individual has control over the sensitive operations of the contract.
This helps in preventing misuse of minting, burning, and blacklisting functionalities.

- Blacklisting: Blacklisted addresses are prevented from minting or burning tokens, adding an extra layer of security to the contract's operations.
  
## Conclusion
The gNGN smart contract is a robust implementation of an ERC20 token with enhanced security features through access control and blacklisting.
By utilizing OpenZeppelin's libraries, it ensures reliability and security, making it suitable for managing a digital token in a secure manner.
