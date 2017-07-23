pragma solidity ^0.4.8;

import "./StandardContainer.sol";
contract HumanStandardToken is StandardContainer{
    
    function (){
        throw;
    }
    
    uint256 public weight;
    string public dataHash;
    uint256 public count;
    
    function HumanStandardToken(uint256 _weight, string _dataHash, uint256 _id) returns (bool success){
        _id = count;
        container cont = (_weight, _dataHash);
        totalSupply[_id] = cont;
        count ++;
        return true;
    }
}