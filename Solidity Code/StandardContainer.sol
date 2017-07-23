pragma solidity ^0.4.8;

import "./Container.sol";
import "./PortNode.sol";

contract StandardContainer is Container{
    
    mapping (uint256 => address) balances;
    mapping (address => string) masterNodeList;
    mapping (address => string) shipNodeList;
    mapping (address => string) portNodeList;
    mapping (address => mapping (address => bool)) approved;
    
    function initialAssignmentMaster(address _to, string name) onlyOwner returns (bool success){
        masterNodeList[_to] = name;
        return true;
    }
    
    function initialAssignmentShip(address _to, string name) onlyOwner returns (bool success){
        shipNodeList[_to] = name;
        return true;
    }
    
    function initialAssignmentPort(address _to, string name) onlyOwner returns (bool success){
        portNodeList[_to] = name;
        return true;
    }
    
    // Value refers to the identity of the container
    // Check is the container belongs to the current owner, if it does it transfers ownership to the sender
    function transfer(address _to, uint256 _value) returns (bool success) {
        if(balances[_value] != msg.sender) { throw;
        } else{
            if (PortNode.isApproved[_value] == true){
              balances[_value] = _to;
            Transfer(msg.sender, _to, _value);
            return true;  
            }
        }
    }
    
    function getDocuments(address _documentOwner, uint256 _containerNum) constant returns (bool success){
        if (approved[msg.sender][_documentOwner]){
            totalSupply[_containerNum].metaData;
            GetDocuments(_documentOwner, msg.sender, _containerNum);
            return true;
        }
        else { return false;}
    }
    
    function getWeight(address _documentOwner, uint256 _containerNum) constant returns (bool success){
        if (approved[msg.sender][_documentOwner]){
            totalSupply[_containerNum].weight;
            GetWeight(_documentOwner, msg.sender, _containerNum);
            return true;
        }
        else { return false;}
    }
    
    function approveViewer(address _approved) returns (bool success){
        approved[_approved][msg.sender] = true;
        ApproveViewer(_approved, msg.sender);
        return true;
    }
    
    //function getApproved()
    
    function balanceOf(address _owner) constant returns (uint256 _value){
        uint256 count;
        for (uint256 i = 0; i < 1000; i ++){
            if (balances[i] == _owner){
                count ++;
            }
        }
        return count;
    }
    

}