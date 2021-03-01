pragma solidity ^0.5.0;

contract AssociateProfitSplitter {
    address payable employee_one;
    address payable employee_two;
    address payable employee_three;
    address myAddress = 0x889F3BD6c9ADD3941166079C0574924E8B851882;
    uint public msgvalue = msg.value;
    
    constructor(address payable _one, address payable _two, address payable _three) public {
        employee_one = _one;
        employee_two = _two;
        employee_three = _three;
    }
    
    function balance() public view returns(uint) {
        return address(this).balance;
    }
    
    function deposit() public payable {
        uint amount = msg.value; 
        uint splitToEmployee = amount/3;
        require(msg.sender == myAddress, "You cannot make the transaction.");
        
        employee_one.transfer(splitToEmployee);
        employee_two.transfer(splitToEmployee);
        employee_three.transfer(splitToEmployee);
        
        msg.sender.transfer(msg.value-(splitToEmployee*3));
    }
    
    function()external payable {
        
        deposit();
        
    }
    
}
