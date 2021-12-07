// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.1;

contract LendingPool{

    uint256 public id = 100;
    uint public totalPools = 0;

    enum RiskType {LOW,MEDIUM,HIGH}
   
    struct Pool {
        uint poolId;
        uint  minScore; 
        uint  maxScore; 
        uint apr;  
        uint maxAmount; 
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

    function getRiskPools(RiskType riskType) public view returns (Pool[] memory) {
        return pools[riskType];
    }


    
   
}
