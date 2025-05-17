// SPDX-License-Identifier: MIT
//latest solidity complier version
pragma solidity 0.8.30;

/**
 * @title Kcoin_ico
 * @dev Kcoin ico
 * @custom:dev-run-script ./Kcoin_ico.sol
 */
contract Kcoin_ico {

    uint public max_kcoin = 100000;

    //1 USD can buy how many Kcoin
    uint public one_usd_to_kcoin = 1;

    //1 Kcoin is how many USD
    uint public one_kcoin_to_usd = 1;

    uint public total_kcoin_bought = 0;

    //Map of investor public address to its equity in Kcoin
    mapping(address => uint)equity_kcoin;

    //Map of investor public address to its equity in USD
    mapping(address => uint)equity_usd;

    //To check if we still have KCoin left to sell
    modifier can_buy_kcoin(uint usd_to_invest){
        require(((usd_to_invest*one_usd_to_kcoin) + total_kcoin_bought) <= max_kcoin);
        //_; to make sure if require condition is true then only apply modifier
        _;
    }

    //To check if investor has any Kcoin in the account to sell for usd
    modifier can_sell_kcoin(address investor_public_address){
        require(equity_kcoin[investor_public_address] >= 0);
        //_; to make sure if require condition is true then only apply modifier
        _;
    }

    //get equity of investor in Kcoin
    function equity_in_kcoin(address investor_public_address) external view returns (uint){
        return equity_kcoin[investor_public_address];
    }

    //get equity of investor in USD
    function equity_in_usd(address investor_public_address) external view returns (uint){
        return equity_usd[investor_public_address];
    }

    function buy_kcoin(address investor_public_address, uint usd_to_invest) external
    can_buy_kcoin(usd_to_invest) {
        uint kcoin_bought = usd_to_invest*one_usd_to_kcoin;
        //update value of usd and number of Kcoin for the buyer
        equity_kcoin[investor_public_address] += kcoin_bought;
        //Total equity of investor is  = (total # of Kcoin that investor has * usd value of each Kcoin)
        equity_usd[investor_public_address] += equity_kcoin[investor_public_address]*one_kcoin_to_usd;
        total_kcoin_bought += kcoin_bought;
    }

    function sell_kcoin(address investor_public_address, uint kcoin_to_sell) external
    can_sell_kcoin(investor_public_address){
        equity_kcoin[investor_public_address] -= kcoin_to_sell;
        //Total equity of investor is  = (total # of Kcoin that investor has * usd value of each Kcoin)
        equity_usd[investor_public_address] = equity_kcoin[investor_public_address]*one_kcoin_to_usd;
        total_kcoin_bought -= equity_kcoin[investor_public_address];
    }

}
