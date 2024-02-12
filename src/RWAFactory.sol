// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract RWAToken is ERC20 {
    //add smth later
    constructor(string memory name, string memory symbol) ERC20(name, symbol) {
        // Mint 100 tokens to msg.sender
        // Similar to how
        // 1 dollar = 100 cents
        // 1 token = 1 * (10 ** decimals)
        _mint(msg.sender, 100 * 10 ** uint256(decimals()));
    }
}

//add only owner
contract RWAFactory {
    RWAToken[] public rwas;

    //add events

    function create(string memory name, string memory symbol) public {
        RWAToken token = new RWAToken(name, symbol);
        rwas.push(token);
    }

    function getRWA(uint256 _index) public view returns (string memory symbol, string memory name, address rwaAddr) {
        RWAToken token = rwas[_index];
        return (token.symbol(), token.name(), address(token));
    }
}
