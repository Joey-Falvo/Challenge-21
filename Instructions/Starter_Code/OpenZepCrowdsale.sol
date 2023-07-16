pragma solidity ^0.5.5;

import "./KaseiCoin.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/Crowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/emission/MintedCrowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/validation/CappedCrowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/validation/TimedCrowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/distribution/RefundablePostDeliveryCrowdsale.sol";


// Have the KaseiCoinCrowdsale contract inherit the following OpenZeppelin:
// * Crowdsale
// * MintedCrowdsale
contract KaseiCoinCrowdsale is Crowdsale, MintedCrowdsale, CappedCrowdsale, TimedCrowdsale, RefundablePostDeliveryCrowdsale {
    constructor(
        uint256 rate,
        address payable wallet,
        KaseiCoin token,
        uint goal, // the crowdsale goal
        uint open, // the crowdsale opening time
        uint close // the crowdsale closing time

    ) public 
      Crowdsale(rate, wallet, token)
      CappedCrowdsale(goal)
      TimedCrowdsale(open, close)
      RefundableCrowdsale(goal)

    {
// UPDATE THE CONTRACT SIGNATURE TO ADD INHERITANCE
    
    // Provide parameters for all of the features of your crowdsale, such as the `rate`, `wallet` for fundraising, and `token`.
        // YOUR CODE HERE!
        // constructor can stay empty
    }
}


contract KaseiCoinCrowdsaleDeployer {
    address public Kasei_token_address;
    address public Kasei_crowdsale_address;

    // Create an `address public` variable called `kasei_token_address`.
    // YOUR CODE HERE!
    // Create an `address public` variable called `kasei_crowdsale_address`.
    // YOUR CODE HERE!

    // Add the constructor.
    constructor(
        string memory name,
        string memory symbol,
        address payable wallet,
        uint goal
       // YOUR CODE HERE!
    ) public { KaseiCoin token = new KaseiCoin(name, symbol, 0);
        Kasei_token_address = address(token);
        KaseiCoinCrowdsale KCcrowdsale = new KaseiCoinCrowdsale (1, wallet, token, goal, now, now + 24 weeks);
        Kasei_crowdsale_address = address(KCcrowdsale);

        token.addMinter(Kasei_crowdsale_address);
        token.renounceMinter();
    }

       


}