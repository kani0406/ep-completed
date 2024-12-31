// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract DigitalIdentity {
    struct Identity {
        string userId;
        string data;
    }

    mapping(string => Identity) public identities;

    event IdentityCreated(string userId, string data);
    event IdentityUpdated(string userId, string newData);

    function createIdentity(string memory userId, string memory data) public {
        require(bytes(identities[userId].userId).length == 0, "Identity already exists.");
        identities[userId] = Identity(userId, data);
        emit IdentityCreated(userId, data);
    }

    function updateIdentity(string memory userId, string memory newData) public {
        require(bytes(identities[userId].userId).length != 0, "Identity not found.");
        identities[userId].data = newData;
        emit IdentityUpdated(userId, newData);
    }

    function getIdentity(string memory userId) public view returns (string memory) {
        return identities[userId].data;
    }
}
