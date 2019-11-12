pragma solidity ^0.5.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Adoptions.sol";

contract TestAdoptions {
    // The address of the adoption contract to be tested
    Adoptions adoption = Adoptions(DeployedAddresses.Adoptions());

    // The id of the pet that will be used for testing
    uint256 expectedPetID = 8;

    //The expected owner of adopted pet is this contract
    address expectedAdopter = address(this);

    function testUserCanAdoptPet() public {
        uint256 returnedId = adoption.adopt(expectedPetID);
        Assert.equal(
            returnedId,
            expectedPetID,
            "Adoption of the expected pet should match what is returned"
        );
    }

    function testGetAdopterAddressByPetId() public {
        address adopter = adoption.adopters(expectedPetID);
        Assert.equal(
            adopter,
            expectedAdopter,
            "The adopter id should match the test contract address"
        );
    }

    function testGetAdopterAddressByPetInArray() public {
        // store adopters in memory!
        address[16] memory adopters = adoption.getAdopters();
        Assert.equal(
            adopters[expectedPetID],
            expectedAdopter,
            "Owner of the expected pet should be this contract"
        );
    }
}
