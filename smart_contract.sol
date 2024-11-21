// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DVFundDistribution {
    address public hospital;
    address public victimSupport;

    constructor(address _hospital, address _victimSupport) {
        hospital = _hospital;
        victimSupport = _victimSupport;
    }

    function distributeFunds() public payable {
        require(msg.value > 0, "Funds must be greater than zero.");
        payable(hospital).transfer(msg.value / 2);
        payable(victimSupport).transfer(msg.value / 2);
    }

    function getBalances() public view returns (uint256, uint256) {
        return (hospital.balance, victimSupport.balance);
    }
}
