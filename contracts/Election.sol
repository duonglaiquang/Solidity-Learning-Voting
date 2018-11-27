pragma solidity ^0.5; //version

//define contract
contract Election {
  //model of candidate
  struct Candidate {
    uint id;
    string name;
    uint voteCount;
  }

  //Read/write candidate
  //set to public to get a free getter & setter function, can be called outside of contract
  //mapping each candidate object to an id
  mapping(uint => Candidate) public candidates;

  //store account that vote
  mapping(address => bool) public voters;

  //store candidate count
  uint public candidatesCount;

  //create voted event
  event votedEvent( uint indexed _candidateId );

  //constructor has same name as contract
  constructor() public {
    addCandidate("Candidate 1");
    addCandidate("Candidate 2");
  }

  //private can only be called from inside contract
  function addCandidate (string _name) private {
    candidatesCount ++;
    candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);

  }

  function vote(uint _candidateId) public{
    //check if user hasn't voted before
    // if require pass the code will continue else throw exception
    require(!voters[msg.sender]);

    //require valid candidates
    require(_candidateId > 0 && _candidateId <= candidatesCount);

    //record that voter has voted
    voters[msg.sender] = true;

    //update candidate vote_count
    candidates[_candidateId].voteCount ++;

    //trigger voted event
    votedEvent(_candidateId);
  }
}