## Purpose
The SGi Token contract includes a clawback function (`reclaimLockedTokens`) that allows the DAO Controller or Owner to reclaim **locked tokens** under specific circumstances.  
This document clarifies the operating principles, limitations, and execution history of this function.


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
     - Reserve restructuring (e.g. migration to a Safe Treasury)

4. **Governance Control**  
   - Any clawback requires approval through DAO/Multisig governance.  
   - Transaction details will be recorded and disclosed publicly.

## Execution History
- **Case #1 (Advisor)**: Tokens allocated to an advisor who ceased contributing were clawed back prior to vesting.  
- **Case #2 (Treasury Migration)**: Locked reserve tokens were clawed back to consolidate into the SGi DAO Treasury Safe for secure multi-signature management.  

## Transparency
- A **public registry** of clawback actions, including wallet addresses and transaction hashes, will be maintained in this repository.  
- To date, **2 clawbacks have been executed**, both aligning with the above principles.


---

*This policy ensures that the clawback function exists only as a protective measure and does not compromise circulating token holders.*
