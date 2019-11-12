pragma solidity ^0.5.0;

contract Adoptions {
    address[16] public adopters;

    // adopt a pet
    function adopt(uint256 petId) public returns (uint256) {
        require(petId >= 0 && petId <= 15);
        adopters[petId] = msg.sender;
        return petId;
    }

    // return adopters
    function getAdopters() public view returns (address[16] memory) {
        return adopters;
    }
}
