// 1. License
// SPDX-License-Identifier: LGPL-3.0-only
//2. Solidity version
pragma solidity 0.8.24;

//3. Contract

contract Vote {

    // Variables definition

    address public moderator;
    mapping(address => bool) public whitelist;
    mapping(address => bool) public hasVoted;
    mapping(uint8 => uint256) public votes;
    uint256 public totalVoters;
    uint256 public votesCount; 
    enum Candidates { Vitalik, Satoshi, Sun, Changpeng}

    // Constructor

    constructor(address[] memory _whitelistedAddresses) {
        moderator = msg.sender;
        totalVoters = _whitelistedAddresses.length;
        for (uint i = 0; i < _whitelistedAddresses.length; i++) {
            whitelist[_whitelistedAddresses[i]] = true;
        
        }
    }

    // Modifiers

    modifier onlyMod() {
    if(msg.sender != moderator) revert("Only moderator can call this function");
    _;
    }   

    modifier onlyWhitelisted() {
        if(whitelist[msg.sender]) revert("Not included in whitelist");
        _;
    }

    modifier notVoted(){
        if(hasVoted[msg.sender]) revert("You have already voted");
        _;
    }

    // Events

    // External Functions


}