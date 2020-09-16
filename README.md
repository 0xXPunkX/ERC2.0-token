# 一个基于ETH网络的ERC2.0版本的代币
<p>
编译器：http://remix.ethereum.org/
</p>
<p>
编译器Github链接：https://github.com/ethereum/remix-ide
</p>
<p>
编译器Github文档：https://github.com/ethereum/remix-ide/blob/master/docs/file_explorer.md
</p>
<p>
编译器文档：https://remix-ide.readthedocs.io/en/latest/
</p>
<p>
语言：Solidity，类似Java
</p>

## 前期准备
<p>
在发Token前，你先的确定以下几个内容：
</p>
<p>
TOKENNAME-Token的全称
</p>
<p>
TOKENSYMBOL-Token的标识/缩写
</p>
<p>
DECIMALUNITS-Token的小数位：小数位是18位，表示这个Token最小可以到 .0000000000000000001
</p>
<p>
INITIALAMOUNT-Token发行量
</p>

## Tips
<p>
每一份代码开头的pragma solidity ^0.4.4里面的^表示向上兼容，如果限制用哪一个版本请自行百度
</p>
<p>
如果想要发行自己的token，只需要把代码文件里面MyErc2.0Coin出现的地方替换为你的Token全称即可
</p>
