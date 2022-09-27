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

    constructor() payable {
        console.log("Hello world Smart Contract!");
    }

    function wave(string memory _message) public {
        totalWaves += 1;
        console.log("%s waved w/ message %s", msg.sender, _message);
        // store the wave data in the array
        waves.push(Wave(msg.sender, totalWaves, _message, block.timestamp));
        // google for
        emit NewWave(msg.sender, totalWaves, block.timestamp, _message);

        uint256 prizeAmount = 0.0001 ether;

        require(
        prizeAmount <= address(this).balance,
        "Trying to withdraw more money than the contract has."
        );
        // address(this).balance is the balance of the contract itself
        // (msg.sender).call{value: prizeAmount}("") is the magic line where we send money
        (bool success, ) = (msg.sender).call{value: prizeAmount}("");
        require(success, "Failed to withdraw money from contract.");
    }

    function getAllWaves() public view returns (Wave[] memory) {
        return waves;
    }

    function getTotalWaves() public view returns (uint256) {
        console.log("We have %d total waves!", totalWaves);

        return totalWaves;
    }
}
