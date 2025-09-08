## Purpose
The SGi Token contract includes a clawback function (`reclaimLockedTokens`) that allows the DAO Controller or Owner to reclaim **locked tokens** under specific circumstances.  
This document clarifies the operating principles and limitations of this function.

## Principles
1. **Locked-Only Scope**  
   - Clawback applies strictly to tokens that are still under lock.  
   - Circulating or unlocked tokens are never subject to clawback.

2. **Pre-Cliff Restriction**  
   - Clawback may only be exercised **before the cliff period starts**.  
   - Once vesting has commenced, clawback will not be executed.

3. **Exceptional Use Cases**  
   - Clawback is reserved for exceptional events, such as:  
     - Fraudulent allocation or misrepresentation  
     - Breach of contractual obligations  
     - KYC/AML failure

4. **Governance Control**  
   - Any clawback requires approval through DAO/Multisig governance.  
   - Transaction details will be recorded and disclosed publicly.

## Transparency
- A **public registry** of any clawback actions, including wallet addresses and transaction hashes, will be maintained in this repository.  
- To date, **no clawback has been executed**.

---

*This policy ensures that the clawback function exists only as a protective measure and does not compromise circulating token holders.*
