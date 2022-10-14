// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;

error VotingNft__YouHaveVotedAlready();
contract VotingNft {
    address private manager;
    mapping(address => bool) voted;
    constructor(){
        manager = msg.sender;
    }
    struct Candidates{
        string s_fullName;
        string s_department;
        string s_matricNumber;
        string image;
        uint256 s_voteCount;
        string s_role;
    }
     mapping (uint256 => Candidates) public users;
    //Modifier
    modifier onlyManager{
        require(msg.sender == manager);
        _;
    }
    //Store the candidates in an array
    Candidates [] public candidates;
    function addCandidates(string memory fullName, string memory department, string memory matricNumber, string memory image, uint256 voteCount, string memory role ) public onlyManager{
        Candidates memory newCandidate = Candidates(fullName, department, matricNumber, image, voteCount, role);
        candidates.push(newCandidate);
    }
    //Vote for a particular candidate
    function vote(uint256 index) public {
        if(voted[msg.sender]){
            revert VotingNft__YouHaveVotedAlready();
        }else{
         candidates[index].s_voteCount +=1;
        voted[msg.sender] = true;
        }
       
    }

    //Get All Candidates
    function getAllCandidate() public view returns (Candidates[] memory) {
        return candidates;
    }
    
}