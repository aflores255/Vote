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
            emit Whitelisted(_whitelistedAddresses[i]);
        }
    }

    // Modifiers

    modifier onlyMod() {
    if(msg.sender != moderator) revert("Only moderator can call this function");
    _;
    }   

    modifier onlyWhitelisted() {
        if(!whitelist[msg.sender]) revert("Not included in whitelist");
        _;
    }

    modifier notVoted(){
        if(hasVoted[msg.sender]) revert("You have already voted");
        _;
    }

    modifier votingEnded() {
        if(votesCount < totalVoters) revert("Voting has not ended yet");
        _;
    }

    // Events

    event Voted(address indexed voter, Candidates candidate);
    event Whitelisted(address indexed user);

    // External Functions
    function vote(Candidates _candidate) external onlyWhitelisted notVoted {
            votes[uint8(_candidate)]++;
            hasVoted[msg.sender] = true;
            votesCount = votesCount + 1;
            emit Voted(msg.sender, _candidate);
        }
    
    function getCurrentVotes() external view onlyMod returns (uint256[4] memory) {
       
        return [votes[0], votes[1], votes[2], votes[3]];
    }
    
    function hasVotingEnded() external view returns (bool) {
       
        if(votesCount == totalVoters){
            return true;
        }
        else{
            return false;
        }
       
    }

    function getFinalResults() external view votingEnded returns (uint256[4] memory) {
        return [votes[0], votes[1], votes[2], votes[3]];
    }

}