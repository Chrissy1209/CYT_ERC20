//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

library SafeMath {
    function Add(uint a, uint b) public pure returns(uint) {
        uint c = a + b;
        require(c >= a); //overflow

        return c;
    }
    function Sub(uint a, uint b) public pure returns(uint) {
        require(b <= a); //underflow
        return a-b;
    }
    function Mul(uint a, uint b) public pure returns(uint) {
        uint c = a * b;
        require(c / a == b);

        return c;
    }
    function Div(uint a, uint b) public pure returns(uint) {
        require(b > 0);
        return a/b;
    }
    function Mod(uint a, uint b) public pure returns(uint) {
        require(b != 0);
        return a%b;
    }
}

contract Libraries {
    function add(uint a, uint b) public pure returns(uint) {
        return SafeMath.Add(a, b);
    }
    function sub(uint a, uint b) public pure returns(uint) {
        return SafeMath.Sub(a, b);
    }
}