pragma solidity ^0.8.0;

contract EtherConverter {
    address public owner;
    
    constructor() {
        owner = msg.sender;
    }
    
    receive() external payable {
        // This function allows the contract to receive ether when it's sent.
    }
    
    function getBalanceInWei() public view returns (uint) {
        return address(this).balance;
    }
    
    function getBalanceInEther() public view returns (uint) {
        return address(this).balance / 1 ether;
    }
    
    function getBalanceInGwei() public view returns (uint) {
        return address(this).balance / 1 gwei;
    }
    
 
    function withdraw() public {
        require(msg.sender == owner, "Only the owner can withdraw");
        payable(owner).transfer(address(this).balance);
    }
}
