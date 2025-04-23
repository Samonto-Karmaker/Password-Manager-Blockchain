// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

error NotFound();

contract SimplePasswordStorage {
    mapping(address => bytes32) private keyToPassword;

    function setPassword(string memory _password) external {
        bytes32 hashedPassword = keccak256(abi.encodePacked(_password));
        keyToPassword[msg.sender] = hashedPassword;
    }

    function getPasswordById(address _user) external view returns (bytes32) {
        bytes32 storedPassword = keyToPassword[_user];
        if (storedPassword == bytes32(0)) revert NotFound();
        return storedPassword;
    }
}
