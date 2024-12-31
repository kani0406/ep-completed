// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract HealthcareRecords {
    struct Record {
        string patientId;
        string data;
    }

    mapping(string => Record) public records;

    event RecordAdded(string patientId, string data);
    event RecordUpdated(string patientId, string newData);

    function addRecord(string memory patientId, string memory data) public {
        require(bytes(records[patientId].patientId).length == 0, "Record already exists.");
        records[patientId] = Record(patientId, data);
        emit RecordAdded(patientId, data);
    }

    function updateRecord(string memory patientId, string memory newData) public {
        require(bytes(records[patientId].patientId).length != 0, "Record not found.");
        records[patientId].data = newData;
        emit RecordUpdated(patientId, newData);
    }

    function getRecord(string memory patientId) public view returns (string memory) {
        return records[patientId].data;
    }
}
