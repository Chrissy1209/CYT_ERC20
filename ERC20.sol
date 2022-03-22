//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "./SafeMath.sol";
import "./IERC20.sol";

contract ERC20 is IERC20{
    using SafeMath for uint256;
    
    string public constant name = "Chrissy's token";
    uint8 public constant decimals = 18;
    string public constant symbol = "CYT";

    uint256 internal _totalSupply;
    mapping(address => uint256) _balanses;
    mapping(address => mapping(address => uint256)) _approve;

    /**
     * @dev Returns the amount of tokens in existence.
     */
    function totalSupply() external override view returns (uint256) {
        return _totalSupply;
    }

    /**
     * @dev Returns the amount of tokens owned by `account`.
     */
    function balanceOf(address account) external override view returns (uint256) {
        return _balanses[account];
    }

    /**
     * @dev Moves `amount` tokens from the caller's account to `to`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(address to, uint256 amount) external override returns (bool) {
        return _transfer(msg.sender, to, amount);
    }

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(address owner, address spender) external override view returns (uint256) {
        return _approve[owner][spender];
    }

    /**
     * @dev Sets `amount` as the allowance of `spender` over the caller's tokens.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits an {Approval} event.
     */
    function approve(address spender, uint256 amount) external override returns (bool) {
        _approve[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
        return true;
    }

    /**
     * @dev Moves `amount` tokens from `from` to `to` using the
     * allowance mechanism. `amount` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(
        address from,
        address to,
        uint256 amount
    ) external override returns (bool) {
        _approve[from][msg.sender] = _approve[from][msg.sender].Sub(amount);

        return _transfer(from, to, amount); 
    }

    function _transfer(address from, address to, uint value) internal returns(bool) {
        _balanses[from] = _balanses[from].Sub(value);
        _balanses[to] = _balanses[to].Add(value);
        
        emit Transfer(from, to, value);
        return true;
    }
}