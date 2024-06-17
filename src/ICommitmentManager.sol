// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

struct G1Point {
    uint256 X;
    uint256 Y;
}

interface ICommitmentManager {
    function SubmitCommitment(
        uint256 length,
        bytes32 nodeGroupKey,
        bytes[] calldata signatures,
        uint256 nameSpaceId,
        bytes1[48] calldata commitment
    )
        external
        payable;

    function indices(address user) external view returns (uint256);
}
