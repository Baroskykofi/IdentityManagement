# Identity Management Smart Contract

## Overview
This project implements an **Identity Management Smart Contract** in Solidity. The contract allows users to register their identity, authorized verifiers to verify or revoke identities, and provides functions to manage verifiers. It ensures transparency through events and access control through modifiers.

### Features Implemented

1. **Identity Struct**
   - Stores the user's name, email, verification document, and status flags (`isVerified`, `isRevoked`).

2. **Mappings**
   - `identities`: Links user addresses to their identity data.
   - `authorizedVerifiers`: Tracks addresses authorized to verify/revoke identities.

3. **Modifiers**
   - `onlyManager`: Restricts certain actions to the identity owner.
   - `onlyVerifier`: Restricts verification and revocation to authorized verifiers.
   - `onlyContractOwner`: Ensures only the contract owner can manage verifiers.

4. **Functions**
   - `registerIdentity`: Users can register their identity details.
   - `verifyIdentity`: Verifiers can mark identities as verified.
   - `revokeIdentity`: Verifiers can revoke identities.
   - `getIdentity`: Publicly retrieves identity details.
   - `addVerifier` / `removeVerifier`: The contract owner can manage verifiers.

5. **Events**
   - `IdentityRegistered`, `IdentityVerified`, `IdentityRevoked`, `VerifierAdded`, and `VerifierRemoved` ensure transparency.

### Requirements Fulfilled
- **Struct Definition**: Defined an `Identity` struct with all required fields.
- **Mappings**: Used to store identities and manage authorized verifiers.
- **Modifiers**: Implemented to enforce role-based access control.
- **Functions**: Included registration, verification, revocation, and verifier management.
- **Events**: Added for key actions to ensure transparency.
- **Access Control**: Implemented to restrict unauthorized actions.

---

## Deployment Process

1. **Tools Used**:
   - **Remix IDE**: For writing, testing, and deploying the smart contract.
   - **Testnet**: Deployed the contract on the Sepolia testnet.

2. **Deployment Steps**:
   - Opened Remix IDE and created a new file for the contract.
   - Copied and pasted the contract code into the file.
   - Compiled the contract with Solidity version `0.8.0`.
   - Connected to the Sepolia testnet using MetaMask.
   - Deployed the contract.

3. **Testnet Address**:
   - Contract Address: [0x67B0E67aFff6B278E9B1157b54b25fd6F209ec91]

---

## Testing the Contract

### Functions Tested

1. **registerIdentity**
   - Verified users can register their identity.
   - Checked that duplicate registrations are not allowed.

2. **verifyIdentity**
   - Tested that only authorized verifiers can mark identities as verified.
   - Ensured the `isVerified` status is updated correctly.

3. **revokeIdentity**
   - Verified that only authorized verifiers can revoke identities.
   - Checked that `isVerified` is set to `false` and `isRevoked` is set to `true`.

4. **getIdentity**
   - Retrieved the identity details for different users.
   - Confirmed the data returned is accurate.

5. **addVerifier** / **removeVerifier**
   - Confirmed only the contract owner can add or remove verifiers.
   - Verified that added verifiers can perform their roles.

### Edge Cases
- Attempted unauthorized actions (e.g., non-verifiers trying to verify/revoke identities).
- Tried registering with an already existing identity.
- Verified the handling of revoked identities.

---

## Challenges Faced and Solutions

1. **Access Control**
   - **Challenge**: Ensuring only specific roles can perform certain actions.
   - **Solution**: Implemented modifiers (`onlyManager`, `onlyVerifier`, `onlyContractOwner`) to enforce access control.

2. **Transparency**
   - **Challenge**: Keeping track of actions like verification and revocation.
   - **Solution**: Added events for key actions to log them on the blockchain.

3. **Gas Optimization**
   - **Challenge**: Managing gas usage with large data sets.
   - **Solution**: Used mappings to efficiently store and access data.

---

## Insights Gained

1. **Solidity Best Practices**
   - Importance of modular code and reusable modifiers.
   - Use of events for better transparency.

2. **Access Control**
   - Role-based access control ensures a secure contract.

3. **Gas Efficiency**
   - Learned to optimize gas usage by leveraging mappings and struct design.

---

## How to Interact with the Contract

1. **Register Identity**:
   - Call `registerIdentity` with `name`, `email`, and `verificationDocument`.

2. **Verify Identity**:
   - Call `verifyIdentity` with the user’s address (verifier-only).

3. **Revoke Identity**:
   - Call `revokeIdentity` with the user’s address (verifier-only).

4. **Get Identity**:
   - Call `getIdentity` with the user’s address to retrieve their details.

5. **Manage Verifiers**:
   - Use `addVerifier` and `removeVerifier` to authorize or remove verifiers (owner-only).

---



