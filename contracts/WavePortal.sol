// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract WavePortal {
    struct user{
        address _address;
        uint256 id;
    }
    uint256 totalWaves;
    mapping(address => user) userInfo;

    constructor() {
        console.log("Hello world Smart Contract!");
    }

    function addUser(address waveSender, uint256 idSender) public {
        userInfo[waveSender]._address = waveSender;
        userInfo[waveSender].id = idSender;
    }

    function getUser() public view returns(address) {
        // FIX: require(userInfo[msg.sender]._address == msg.sender, "You are not allowed.");

        return userInfo[msg.sender]._address;
    }

    function wave() public {
        totalWaves += 1;
        addUser(msg.sender, totalWaves);
        console.log("%s has waved!", msg.sender);
    }

    function getTotalWaves() public view returns (uint256) {
        console.log("We have %d total waves!", totalWaves);

        return totalWaves;
    }
}
