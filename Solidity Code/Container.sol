pragma solidity ^0.4.8;

contract Container {
    
    struct container{
        string metaData;
        uint256 weight;
    }
    
    mapping (uint256 => container) public totalSupply;
    address public owner;
    
    function balanceOf(address _owner) constant returns (uint256 balance);
    function transfer(address _to, uint256 _value) returns (bool success);
    
    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event GetWeight(address _documentOwner, address _requester, uint _containerNum);
    event GetDocuments(address _documentOwner, address _requester, uint _containerNum);
    event ApproveViewer(address _approved, address _approver);
    
    function owned() {
        owner = msg.sender;
    }

    modifier onlyOwner {
        if (msg.sender != owner) throw;
        _;
    }

    function transferOwnership(address newOwner) onlyOwner {
        owner = newOwner;
    }
}