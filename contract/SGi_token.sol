// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

interface INSgi {
    function burnFrom(address account, uint256 amount) external;
}

contract SGiToken is ERC20, Ownable {
    struct LockInfo {
        uint256 amount;
        uint256 startTime;
        uint256 cliff;
        uint256 duration;
        string lockType;
    }

    mapping(address => LockInfo[]) public lockedTokens;
    address public daoController;
    address public nSgiContract;

    event Locked(address indexed to, uint256 amount, uint256 startTime, uint256 cliff, uint256 duration, string lockType);
    event Reclaimed(address indexed from, address indexed to, uint256 amount);
    event MintedFromNFT(address indexed to, uint256 amount);

    constructor(address _daoController) ERC20("SmartGolfToken", "SGi") Ownable(msg.sender) {
        _mint(msg.sender, 1_000_000_000 * 10 ** decimals());
        daoController = _daoController;
    }

    modifier onlyDAO() {
        require(msg.sender == owner() || msg.sender == daoController, "Not authorized");
        _;
    }

    function setDAOController(address _dao) external onlyOwner {
        daoController = _dao;
    }

    function setNSgiContract(address _nSgi) external onlyOwner {
        nSgiContract = _nSgi;
    }

    function transfer(address to, uint256 amount) public override returns (bool) {
        require(_availableBalance(msg.sender) >= amount, "SGi: trying to transfer locked tokens");
        return super.transfer(to, amount);
    }

    function transferFrom(address from, address to, uint256 amount) public override returns (bool) {
        require(_availableBalance(from) >= amount, "SGi: trying to transfer locked tokens");
        return super.transferFrom(from, to, amount);
    }

    function _availableBalance(address account) public view returns (uint256) {
        uint256 locked = 0;
        LockInfo[] storage locks = lockedTokens[account];
        for (uint256 i = 0; i < locks.length; i++) {
            LockInfo storage lock = locks[i];
            if (block.timestamp < lock.startTime + lock.cliff) {
                locked += lock.amount;
            } else if (block.timestamp < lock.startTime + lock.cliff + lock.duration) {
                uint256 elapsed = block.timestamp - (lock.startTime + lock.cliff);
                uint256 vested = (lock.amount * elapsed) / lock.duration;
                locked += (lock.amount - vested);
            }
        }
        return balanceOf(account) - locked;
    }

    function getLockedBalance(address account) external view returns (uint256 totalLocked) {
        LockInfo[] storage locks = lockedTokens[account];
        for (uint256 i = 0; i < locks.length; i++) {
            LockInfo storage lock = locks[i];
            if (block.timestamp < lock.startTime + lock.cliff) {
                totalLocked += lock.amount;
            } else if (block.timestamp < lock.startTime + lock.cliff + lock.duration) {
                uint256 elapsed = block.timestamp - (lock.startTime + lock.cliff);
                uint256 vested = (lock.amount * elapsed) / lock.duration;
                totalLocked += (lock.amount - vested);
            }
        }
    }

    function lockTokens(
        address recipient,
        uint256 amount,
        uint256 startTime,
        uint256 cliff,
        uint256 duration,
        string memory lockType
    ) external onlyDAO {
        require(balanceOf(msg.sender) >= amount, "SGi: insufficient balance for locking");
        _transfer(msg.sender, recipient, amount);
        lockedTokens[recipient].push(LockInfo(amount, startTime, cliff, duration, lockType));
        emit Locked(recipient, startTime, cliff, duration, amount, lockType);
    }

    function mintLocked(
        address recipient,
        uint256 amount,
        uint256 startTime,
        uint256 cliff,
        uint256 duration,
        string memory lockType
    ) external onlyDAO {
        _mint(recipient, amount);
        lockedTokens[recipient].push(LockInfo(amount, startTime, cliff, duration, lockType));
        emit Locked(recipient, startTime, cliff, duration, amount, lockType);
    }

    function reclaimLockedTokens(address from, uint index) external onlyDAO {
        require(index < lockedTokens[from].length, "Invalid index");
        LockInfo memory lock = lockedTokens[from][index];
        _transfer(from, msg.sender, lock.amount);

        for (uint i = index; i < lockedTokens[from].length - 1; i++) {
            lockedTokens[from][i] = lockedTokens[from][i + 1];
        }
        lockedTokens[from].pop();

        emit Reclaimed(from, msg.sender, lock.amount);
    }

    function mintFromNFT(address to, uint256 amount) external {
        require(msg.sender == nSgiContract, "Only nSGi contract can call this");
        _mint(to, amount);
        emit MintedFromNFT(to, amount);
    }
}
