/**********************************************************************
*These solidity codes have been obtained from Etherscan for extracting
*the smartcontract related info.
*The data will be used by MATRIX AI team as the reference basis for
*MATRIX model analysis,extraction of contract semantics,
*as well as AI based data analysis, etc.
**********************************************************************/
pragma solidity ^0.4.19;


contract theRelayer {
    address public owner;
    address public target;
    
    function theRelayer(address _target) public {
        owner = msg.sender;
        target = _target;
    }
    
    function () public {
        require(msg.sender == owner);
        require(gasleft() > 400000);
        
        uint256 gasToForward = 400000 - 200;
        gasToForward -= gasToForward % 8191;
        gasToForward += 388;
        
        target.call.gas(gasToForward)(msg.data);
    }
    
    function setTarget(address _target) public {
        require(msg.sender == owner);
        
        target = _target;
    }
}