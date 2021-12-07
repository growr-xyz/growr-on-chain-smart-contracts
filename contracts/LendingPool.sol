// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.1;

/** 
 * @title Ballot
 * @dev Implements voting process along with vote delegation
 */
contract LendingPool{

    uint256 public id = 100;
    uint public totalPools = 0;

    enum RiskType {LOW,MEDIUM,HIGH}
   
    struct Pool {
        uint poolId;
        uint  minScore; // weight is accumulated by delegation
        uint  maxScore; 
        uint apr;  // if true, that person already voted
        uint maxAmount; // person delegated to
        RiskType riskType;
    }

    mapping(RiskType => Pool[]) pools;
    Pool[] poolFinal;

    function createPool(uint minScore, uint maxScore, uint apr, uint maxAmount, RiskType riskType) public
    {
        Pool memory pool;
        pool.poolId = ++id;
        pool.minScore = minScore;
        pool.maxScore = maxScore;
        pool.maxAmount = maxAmount;
        pool.riskType = riskType;
        pool.apr = apr;   
        pools[riskType].push(pool);  
        poolFinal.push(pool); 
        ++totalPools;  
    }

       function getPools() public view returns (Pool[] memory) {
        return poolFinal;
    }
    
   
}
