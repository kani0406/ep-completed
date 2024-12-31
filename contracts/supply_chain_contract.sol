// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract SupplyChain {
    struct Goods {
        string goodsId;
        string location;
    }

    mapping(string => Goods) public goodsTracking;

    event GoodsAdded(string goodsId, string location);
    event LocationUpdated(string goodsId, string newLocation);

    function addGoods(string memory goodsId, string memory location) public {
        require(bytes(goodsTracking[goodsId].goodsId).length == 0, "Goods already added.");
        goodsTracking[goodsId] = Goods(goodsId, location);
        emit GoodsAdded(goodsId, location);
    }

    function updateLocation(string memory goodsId, string memory newLocation) public {
        require(bytes(goodsTracking[goodsId].goodsId).length != 0, "Goods not found.");
        goodsTracking[goodsId].location = newLocation;
        emit LocationUpdated(goodsId, newLocation);
    }

    function getGoodsLocation(string memory goodsId) public view returns (string memory) {
        return goodsTracking[goodsId].location;
    }
}
