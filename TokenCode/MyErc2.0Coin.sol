/*
This Token Contract implements the standard token functionality (https://github.com/ethereum/EIPs/issues/20) as well as the following OPTIONAL extras intended for use by humans.

1. Initial Finite Supply (upon creation one specifies how much is minted).
2. In the absence of a token registry: Optional Decimal, Symbol & Name.
3. Optional approveAndCall() functionality to notify a contract if an approval() has occurred.
*/

pragma solidity ^0.4.4;

import "./StandardToken.sol";

contract MyErc2.0Coin is StandardToken {
    function () {
        //if ether is sent to this address, send it back, 如果向该合约地址发送以太坊则自动退回。
        throw;
        
    }

    /*
    Public variables of the token, 通证的参数。
    */
    
    /*
    NOTE:
    参数是可选的不必全部都有, 并不影响核心功能。
    The following variables are OPTIONAL vanities. One does not have to include them.
    They allow one to customise the token contract & in no way influences the core functionality.
    Some wallets/interfaces might not even bother to look at this information.
    */
    
    string public name;
    // Token名称
    
    uint8 public decimals;
    // Token小数点精度
    
    string public symbol;
    // Token缩写
    
    string public version = 'H0.1';
    // 版本号

    function MyErc2.0Coin(
        uint256 _initialAmount,
        string _tokenName,
        uint8 _decimalUnits,
        string _tokenSymbol
        ) {
        
        balances[msg.sender] = _initialAmount;
        // 合约发布者的余额是发行数量
        
        totalSupply = _initialAmount;
        // 发行量
        
        name = _tokenName;
        // Token名称
        
        decimals = _decimalUnits;
        // Token小数点精度
        
        symbol = _tokenSymbol;
        // Token缩写
        
    }

    /* 批准然后调用接收合约 */
    function approveAndCall(address _spender, uint256 _value, bytes _extraData) returns (bool success) {
        allowed[msg.sender][_spender] = _value;
        Approval(msg.sender, _spender, _value);

        //调用你想要通知合约的 receiveApprovalcall 方法 ，这个方法是可以不需要包含在这个合约里的。
        //receiveApproval(address _from, uint256 _value, address _tokenContract, bytes _extraData)
        
        //假设这么做是可以成功，不然应该调用vanilla approve。
        if(!_spender.call(bytes4(bytes32(sha3("receiveApproval(address,uint256,address,bytes)"))), msg.sender, _value, this, _extraData)) { throw; }
        return true;
        
    }
}
