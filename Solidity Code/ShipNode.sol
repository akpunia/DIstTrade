pragma solidity ^0.4.8;

import "./MasterNode.sol";

contract ShipNode is MasterNode{
 
    //ran out of time, but should include modifiers assigned by owner to make sure no one else can call these functions 
 
    address public shipId;
    mapping (uint256 => address) public shipContainers;
    
    function whoOwns(uint256 _containerID) constant returns (address _owner){
        return shipContainers[_containerID];
    }
    
    function ShipNode(address _shipId, address _masterShip, uint256 _containerId){
        shipId = _shipId;
        shipContainers[_containerId] = shipId;
        ships[_masterShip].push(_shipId);
    }
    
}