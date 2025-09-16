# SGi Clawback Policy

## Scope
- This policy applies **strictly to locked tokens**.  
- Circulating or unlocked tokens are **never** subject to clawback.  

## Principles
1. **Cliff Restriction**  
   - Clawbacks are only executed **before the cliff**.  
   - The sole exception is in case of **KYC/AML failure or legal requirements**.  

2. **Transparency**  
   - All clawback actions are documented in a public registry for community review.  
   - See: [Clawback Registry](../registry/clawback-registry.csv).  

3. **Governance**  
   - The `reclaimLockedTokens` function itself is controlled by the DAO/Owner role. 
   - However, in practice all clawback actions are executed in alignment with the 3-of-5 Gnosis Safe governance model. 
   - This means that any operational use of the function follows multi-sig approvals, and all actions are transparently recorded in the Clawback Registry. 
   - This prevents unilateral action and ensures collective decision-making, even though the contract does not enforce multi-sig at the code level.
## Exceptional Use Cases
- Mis-sent allocation correction (administrative error)  
- Reserve/Treasury restructuring  
- Advisor inactivity or breach of obligations  
- KYC/AML or legal requirement  
- Migration to secure custody (Safe multi-sig)  

## Execution History (summary)
As of 2025-09-16, four clawbacks have been executed, all affecting **locked tokens only**:
1. Mis-sent correction – reclaimed and re-issued correctly.  
2. Reserve restructuring – reclaimed and redistributed between team and reserve buckets.  
3. Advisor inactivity – reclaimed prior to vesting.  
4. Migration to Safe multi-sig – locked reserve moved into DAO Treasury Safe.  

Full details (date, address, amount, tx hash) are maintained in the [Clawback Registry](../registry/clawback-registry.csv).  

---

_Last Updated: 2025-09-16_
