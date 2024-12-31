// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract LandRegistry {
    struct Property {
        address owner;
        string propertyId;
    }

    mapping(string => Property) public properties;

    event PropertyRegistered(string propertyId, address owner);
    event PropertyTransferred(string propertyId, address newOwner);

    function registerProperty(string memory propertyId) public {
        require(properties[propertyId].owner == address(0), "Property already registered.");
        properties[propertyId] = Property(msg.sender, propertyId);
        emit PropertyRegistered(propertyId, msg.sender);
    }

    function transferProperty(string memory propertyId, address newOwner) public {
        require(properties[propertyId].owner == msg.sender, "Only the owner can transfer the property.");
        properties[propertyId].owner = newOwner;
        emit PropertyTransferred(propertyId, newOwner);
    }

    function getPropertyOwner(string memory propertyId) public view returns (address) {
        return properties[propertyId].owner;
    }
}
