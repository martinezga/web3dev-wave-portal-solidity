// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract WavePortal {
    struct Wave{
        address waver;
        uint256 id;
        string message;
        uint256 timestamp;
    }
    uint256 totalWaves;
    event NewWave(address indexed from, uint256 id, uint256 timestamp, string message);
    Wave[] waves;

    constructor() {
        console.log("Hello world Smart Contract!");
    }

    function wave(string memory _message) public {
        totalWaves += 1;
        console.log("%s waved w/ message %s", msg.sender, _message);
        // store the wave data in the array
        waves.push(Wave(msg.sender, totalWaves, _message, block.timestamp));
        // google for
        emit NewWave(msg.sender, totalWaves, block.timestamp, _message);
    }

    function getAllWaves() public view returns (Wave[] memory) {
        return waves;
    }

    function getTotalWaves() public view returns (uint256) {
        console.log("We have %d total waves!", totalWaves);

        return totalWaves;
    }
}
