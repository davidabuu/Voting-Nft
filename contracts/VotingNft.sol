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
    //Modifier
    modifier onlyManager{
        require(msg.sender == manager);
        _;
    }
    //Store the candidates in an array
    Candidates [] public candidates;
    function addCandidates(string memory fullName, string memory department, string memory matricNumber, string memory image, uint256 voteCount, string memory role ) private onlyManager{
        Candidates memory newCandidate = Candidates(fullName, department, matricNumber, image, voteCount, role);
        candidates.push(newCandidate);
    }
    //Vote for a praticular candidate
    function vote(uint256 index) public {
        if(voted[msg.sender]){
            revert VotingNft__YouHaveVotedAlready();
        }else{
         candidates[index].s_voteCount +=1;
        voted[msg.sender] = true;
        }
       
    }
    //Pick Winner
    function winner () public view onlyManager returns(string memory, string memory, string memory, string memory, uint256, string memory) {
        uint256 largestCount = 0;
        uint256 num;
        for(num = 0 ; num < candidates.length; num++){
            if(candidates[num].s_voteCount > largestCount){
                largestCount = candidates[num].s_voteCount;
            }
        }
        return (candidates[num].s_fullName, candidates[num].s_department, candidates[num].s_matricNumber, candidates[num].image, candidates[num].s_voteCount, candidates[num].s_role);
    }
}