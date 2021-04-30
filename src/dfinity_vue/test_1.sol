#
#  Panoramix v4 Oct 2019 
#  Decompiled source of goerli:0x2aC3c1d3e24b45c6C310534Bc2Dd84B5ed576335
# 
#  Let's make the world open source 
# 

def storage:
  name is array of uint256 at storage 0
  symbol is array of uint256 at storage 1
  decimals is uint8 at storage 2
  balanceOf is mapping of uint256 at storage 3
  allowance is mapping of uint256 at storage 4
  totalSupply is uint256 at storage 5
  stor6 is mapping of uint8 at storage 6
  cap is uint256 at storage 7

def name(): # not payable
  return name[0 len name.length]

def totalSupply(): # not payable
  return totalSupply

def decimals(): # not payable
  return decimals

def cap(): # not payable
  return cap

def balanceOf(address _owner): # not payable
  require calldata.size - 4 >= 32
  return balanceOf[addr(_owner)]

def symbol(): # not payable
  return symbol[0 len symbol.length]

def isMinter(address _account): # not payable
  require calldata.size - 4 >= 32
  if not _account:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'Roles: account is the zero address'
  return bool(stor6[addr(_account)])

def allowance(address _owner, address _spender): # not payable
  require calldata.size - 4 >= 64
  return allowance[addr(_owner)][addr(_spender)]

#
#  Regular functions
#

def _fallback() payable: # default function
  revert

def renounceMinter(): # not payable
  if not caller:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'Roles: account is the zero address'
  if not stor6[caller]:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'Roles: account does not have role'
  stor6[caller] = 0
  log MinterRemoved(address account=caller)

def approve(address _spender, uint256 _value): # not payable
  require calldata.size - 4 >= 64
  if not caller:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'ERC20: approve from the zero address'
  if not _spender:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'ERC20: approve to the zero address'
  allowance[caller][addr(_spender)] = _value
  log Approval(
        address owner=_value,
        address spender=caller,
        uint256 value=_spender)
  return 1

def addMinter(address _minter): # not payable
  require calldata.size - 4 >= 32
  if not caller:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'Roles: account is the zero address'
  if not stor6[caller]:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'MinterRole: caller does not have the Minter role'
  if not _minter:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'Roles: account is the zero address'
  if stor6[addr(_minter)]:
      revert with 0, 'Roles: account already has role'
  stor6[addr(_minter)] = 1
  log MinterAdded(address account=_minter)

def decreaseAllowance(address _spender, uint256 _subtractedValue): # not payable
  require calldata.size - 4 >= 64
  if _subtractedValue > allowance[caller][addr(_spender)]:
      revert with 0, 'ERC20: decreased allowance below zero', Mask(40, -256, 'ERC20: decreased allowance below', ' zero') << 256
  if not caller:
      revert with 0, 'ERC20: approve from the zero address'
  if not _spender:
      revert with 0, 'ERC20: approve to the zero address'
  allowance[caller][addr(_spender)] -= _subtractedValue
  log Approval(
        address owner=(allowance[caller][addr(_spender)] - _subtractedValue),
        address spender=caller,
        uint256 value=_spender)
  return 1

def increaseAllowance(address _spender, uint256 _addedValue): # not payable
  require calldata.size - 4 >= 64
  if _addedValue + allowance[caller][addr(_spender)] < allowance[caller][addr(_spender)]:
      revert with 0, 'SafeMath: addition overflow'
  if not caller:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'ERC20: approve from the zero address'
  if not _spender:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'ERC20: approve to the zero address'
  allowance[caller][addr(_spender)] += _addedValue
  log Approval(
        address owner=(_addedValue + allowance[caller][addr(_spender)]),
        address spender=caller,
        uint256 value=_spender)
  return 1

def burn(uint256 _value): # not payable
  require calldata.size - 4 >= 32
  if not caller:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'Roles: account is the zero address'
  if not stor6[caller]:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'MinterRole: caller does not have the Minter role'
  if not caller:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'ERC20: burn from the zero address'
  if _value > balanceOf[caller]:
      revert with 0, 'ERC20: burn amount exceeds balance', Mask(16, -256, 'ERC20: burn amount exceeds balan', 'ce') << 256
  balanceOf[caller] -= _value
  if _value > totalSupply:
      revert with 0, 'SafeMath: subtraction overflow'
  totalSupply -= _value
  log Transfer(
        address from=_value,
        address to=caller,
        uint256 value=0)

def transfer(address _to, uint256 _value): # not payable
  require calldata.size - 4 >= 64
  if not caller:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'ERC20: transfer from the zero address'
  if not _to:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'ERC20: transfer to the zero address'
  if _value > balanceOf[caller]:
      revert with 0, 'ERC20: transfer amount exceeds balance', Mask(48, -256, 'ERC20: transfer amount exceeds b', 'alance') << 256
  balanceOf[caller] -= _value
  if _value + balanceOf[_to] < balanceOf[_to]:
      revert with 0, 'SafeMath: addition overflow'
  balanceOf[addr(_to)] = _value + balanceOf[_to]
  log Transfer(
        address from=_value,
        address to=caller,
        uint256 value=_to)
  return 1

def mint(address _to, uint256 _amount): # not payable
  require calldata.size - 4 >= 64
  if not caller:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'Roles: account is the zero address'
  if not stor6[caller]:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'MinterRole: caller does not have the Minter role'
  if _amount + totalSupply < totalSupply:
      revert with 0, 'SafeMath: addition overflow'
  if _amount + totalSupply > cap:
      revert with 0, 'ERC20Capped: cap exceeded'
  if not _to:
      revert with 0, 'ERC20: mint to the zero address'
  if _amount + totalSupply < totalSupply:
      revert with 0, 'SafeMath: addition overflow'
  totalSupply += _amount
  if _amount + balanceOf[addr(_to)] < balanceOf[addr(_to)]:
      revert with 0, 'SafeMath: addition overflow'
  balanceOf[addr(_to)] += _amount
  log Transfer(
        address from=_amount,
        address to=0,
        uint256 value=_to)
  return 1

def burnFrom(address _from, uint256 _value): # not payable
  require calldata.size - 4 >= 64
  if not caller:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'Roles: account is the zero address'
  if not stor6[caller]:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'MinterRole: caller does not have the Minter role'
  if not _from:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'ERC20: burn from the zero address'
  if _value > balanceOf[addr(_from)]:
      revert with 0, 'ERC20: burn amount exceeds balance', Mask(16, -256, 'ERC20: burn amount exceeds balan', 'ce') << 256
  balanceOf[addr(_from)] -= _value
  if _value > totalSupply:
      revert with 0, 'SafeMath: subtraction overflow'
  totalSupply -= _value
  log Transfer(
        address from=_value,
        address to=_from,
        uint256 value=0)
  if _value > allowance[addr(_from)][caller]:
      revert with 0, 'ERC20: burn amount exceeds allowance', Mask(32, -256, 'ERC20: burn amount exceeds allow', 'ance') << 256
  if not _from:
      revert with 0, 'ERC20: approve from the zero address'
  if not caller:
      revert with 0, 'ERC20: approve to the zero address'
  allowance[addr(_from)][caller] -= _value
  log Approval(
        address owner=(allowance[addr(_from)][caller] - _value),
        address spender=_from,
        uint256 value=caller)

def transferFrom(address _from, address _to, uint256 _value): # not payable
  require calldata.size - 4 >= 96
  if not _from:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'ERC20: transfer from the zero address'
  if not _to:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'ERC20: transfer to the zero address'
  if _value > balanceOf[addr(_from)]:
      revert with 0, 'ERC20: transfer amount exceeds balance', Mask(48, -256, 'ERC20: transfer amount exceeds b', 'alance') << 256
  balanceOf[addr(_from)] -= _value
  if _value + balanceOf[_to] < balanceOf[_to]:
      revert with 0, 'SafeMath: addition overflow'
  balanceOf[addr(_to)] = _value + balanceOf[_to]
  log Transfer(
        address from=_value,
        address to=_from,
        uint256 value=_to)
  if _value > allowance[addr(_from)][caller]:
      revert with 0, 
                  'ERC20: transfer amount exceeds allowance',
                  Mask(64, -256, 'ERC20: transfer amount exceeds a', 'llowance') << 256
  if not _from:
      revert with 0, 'ERC20: approve from the zero address'
  if not caller:
      revert with 0, 'ERC20: approve to the zero address'
  allowance[addr(_from)][caller] -= _value
  log Approval(
        address owner=(allowance[addr(_from)][caller] - _value),
        address spender=_from,
        uint256 value=caller)
  return 1

