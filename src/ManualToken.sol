//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

// a erc20 token with manual minting and burning
contract ManualToken {
    mapping(address => uint256) private s_balances;

    // Track how many tokens are owned by each address.
    function name() public pure returns (string memory) {
        return "Manual Token";
    }

    // Returns the symbol of the token
    function totalSupply() public pure returns (uint256) {
        return 100 ether; //1ether = 10^18 wei
    }

    // Returns the number of decimals the token uses
    function decimals() public pure returns (uint8) {
        return 18;
    }

    function balanceOf(address _owner) public view returns (uint256) {
        return s_balances[_owner];
    }

    function transfer(address _to, uint256 _amount) public {
        uint256 previousSenderBalance = balanceOf(msg.sender) + balanceOf(_to);
        s_balances[msg.sender] -= _amount;
        s_balances[_to] += _amount;
        assert(balanceOf(msg.sender) + balanceOf(_to) == previousSenderBalance);
    }
}
