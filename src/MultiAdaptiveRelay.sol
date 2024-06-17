// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "./ICommitmentManager.sol";

contract MultiAdaptiveRelay {
    mapping(bytes32 => bool) blobhashes;

    ICommitmentManager public immutable commonitmentManager;

    constructor(address _commonitmentManager) {
        commonitmentManager = ICommitmentManager(_commonitmentManager);
    }

    function store(bytes32 _blobhash) internal {
        blobhashes[_blobhash] = true;
    }

    function SubmitCommitment(
        uint256 _length,
        bytes32 _nodeGroupKey,
        bytes[] calldata _signatures,
        uint256 _nameSpaceId,
        bytes1[48] calldata _commitment
    )
        external
        payable
    {
        bytes32 hash = hashCommitment(_commitment);
        require(blobhashes[hash], "commitment does not exist.");
        commonitmentManager.SubmitCommitment(_length, _nodeGroupKey, _signatures, _nameSpaceId, _commitment);
    }

    function hashCommitment(bytes1[48] calldata _commitment) public returns (bytes32) {
        bytes32 hash = keccak256(abi.encode(_commitment));
        bytes32 modified = hash | bytes32(uint256(1) << 248);
        return modified;
    }

    function indices(address _user) external view returns (uint256) {
        return commonitmentManager.indices(_user);
    }
}
