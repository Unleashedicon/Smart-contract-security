// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

import "./StorageVictim.sol";

contract TestStorageVictim is StorageVictim {
    constructor() {
        Storage memory initialStorage = Storage({
            user: owner,
            amount: 500
        });

        storages[owner] = initialStorage;
    }

    function echidna_owner_is_valid_user() public view returns (bool) {
        return storages[owner].user == owner;
    }

    function echidna_owner_amount_greater_than_zero() public view returns (bool) {
        return storages[owner].amount > 0;
    }
    function echidna_testStore() public returns (bool) {
        // Use Echidna's 'call' function to invoke the 'store' function
        bool success;
        (success, ) = address(this).call(abi.encodeWithSignature("store(uint256)", 500));

        // Add a basic assertion to check if the call was successful
        assert(success);

        return true;
    }
}
