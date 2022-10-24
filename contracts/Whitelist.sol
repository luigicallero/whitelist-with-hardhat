
//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract Whitelist {

    // Represents the total number of accounts we want to have in our whitelist.
    // Value of this will be set with the constructor when we deploy.
    uint  public maxWhitelistedAddresses;

    // This logic creates a mapping of address to boolean
    // default value is false. It will be set to true when an address joins.
    mapping(address => bool) public whitelistedAddresses;

    // This variable will keep track of the number of whitelisted addresses. 
    // It will increase until the maximum number is reached.
    uint public numAddressesWhitelisted;

    // Takes an input that will set the value of maxWhitelistAddress
    // Owner will put the value at the time of deployment
    constructor(uint _maxWhitelistedAddresses) {
        maxWhitelistedAddresses =  _maxWhitelistedAddresses;
    } 

    function addAddressToWhitelist() public {
  // ensures that the caller of the function is not already part of the whitelist. 

  require(!whitelistedAddresses[msg.sender], "Sender has already been whitelisted");

   // check if the maximum number of whitelisted addresses is not reached, if not then throw an error.
   require(numAddressesWhitelisted < maxWhitelistedAddresses, "You cannot join now. Limit has been reached");

   // Sets the callers address to true.
   // This makes it a legible whitelisted addres
   whitelistedAddresses[msg.sender] = true;

    // This will increase the number of whitelisted addresses
    numAddressesWhitelisted += 1;
  }

 }