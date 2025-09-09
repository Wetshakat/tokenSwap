// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;

import { IERC20 } from"./interfaces/IERC20.sol";
import { Events } from "./lib/Events.sol";



contract TokenSwap {
    IERC20 public tokenA;
    IERC20 public tokenB;

string public tokenASymbol;
    string public tokenBSymbol;

    

    uint public rate = 3;

      constructor(address _tokenA, address _tokenB) {
        tokenA = IERC20(_tokenA);
        tokenB = IERC20(_tokenB);
        getTokenASymbol();
        getTokenBSymbol();
    }

    function getTokenASymbol()internal returns(string memory _aSymbol){
        _aSymbol = tokenA.symbol();
        tokenASymbol = _aSymbol;
    }

    function getTokenBSymbol()internal returns(string memory _bSymbol){
        _bSymbol = tokenB.symbol();
        tokenBSymbol = _bSymbol;
    }

    function swapAToB(uint _amount) external {

        address sender = msg.sender;

        require(tokenA.balanceOf(sender) >= _amount, "Not enough TokenA to swap");


        uint swapped_ = _amount * rate;

    
        require(tokenA.transferFrom(sender, address(this), _amount), "TokenA transfer failed");

        require(tokenB.transfer(sender, swapped_), "TokenB transfer failed");

        emit Events.swapped(sender, tokenASymbol, _amount, tokenBSymbol, swapped_);
    }


    function swapBToA(uint _amount) external {
        address sender = msg.sender;

        require(tokenA.balanceOf(sender) >= _amount, "Not enough TokenB to swap");


        uint swapped_ = _amount * rate;
    
        require(tokenB.transferFrom(sender, address(this), _amount), "TokenA transfer failed");

        require(tokenA.transfer(sender, swapped_), "TokenB transfer failed");

        emit Events.swapped(sender, tokenBSymbol, _amount, tokenASymbol, swapped_);

    }

    function addLiquidityTokenA (uint _amount) external {
        tokenA.mint(address(this), _amount);
    }

    function addLiquidityTokenB (uint _amount) external {
        tokenB.mint(address(this), _amount);
    }

    function OurBalanceBLT() external view returns(uint256 availableBalance_){
        availableBalance_ = tokenA.balanceOf(address(this));
    } 

    function OurBalanceSLT() external view returns(uint256 availableBalance_){
        availableBalance_ = tokenA.balanceOf(address(this));
    } 

}


