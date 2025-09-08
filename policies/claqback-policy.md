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
   - Mis-sent allocation correction (administrative error)  
   - Reserve/Treasury restructuring (e.g., consolidation)  
   - Advisor/partner inactivity or breach of obligations  
   - KYC/AML failure or legal requirement  
   - Migration to secure custody (e.g., Gnosis Safe multi-sig)

4. **Governance Control**  
   - Any clawback requires approval through DAO/Multisig governance.  
   - Transaction details will be recorded and disclosed publicly.

## Execution History
   - Case #1 – **Mis-sent correction**: Wrong recipient address; allocation reclaimed and re-issued correctly.  
   - Case #2 – **Reserve restructuring**: Core team reserve reclaimed from a lock and redistributed (team + reserve buckets).  
   - Case #3 – **Advisor inactivity**: Unvested advisor allocation reclaimed prior to vesting.  
   - Case #4 – **Safe migration**: Locked reserve reclaimed and moved to the SGi Treasury **Gnosis Safe (3/5)**.

 > Full on-chain details (addresses, amounts, tx hashes) are maintained in the public registry file in registry repo.


## Transparency
   - We maintain a **public clawback registry** containing date, wallet addresses, amount, reason, and transaction hash for each action.  
   - The registry only contains on-chain information (no personal data).

---

*This policy ensures that the clawback function exists only as a protective measure and does not compromise circulating token holders.*
