// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract StorageVictim {

    address public owner;

    struct Storage {
        address user;
        uint256 amount;
    }

    mapping(address => Storage) public storages;

    constructor() {
        owner = msg.sender;
    }

    function store(uint256 _amount) external {
        require(_amount > 0, "Amount must be greater than zero");

        Storage memory str = Storage({
            user: msg.sender,
            amount: _amount
        });

        storages[msg.sender] = str;
    }

    function getStore() external view returns (address, uint256) {
        Storage memory str = storages[msg.sender];
        return (str.user, str.amount);
    }

    function getOwner() external view returns (address) {
        return owner;
    }
}
