# Lock Policy

This policy defines the rules and governance for using `lockTokens` and `mintLocked` functions in the SGi token contract.  
It complements the smart contract implementation by adding operational safeguards and community transparency.

---

## Principles

1. **DAO-Only Control**
   - All lock operations (`lockTokens`, `mintLocked`) can only be executed by the `DAOController` (multi-sig / timelock controlled).
   - Regular users cannot invoke these functions directly.

2. **Parameter Validation**
   - Off-chain governance requires that all submitted lock operations respect the following rules:
     - `duration` must be greater than 0.
     - `cliff` must be less than `duration`.
     - `startTime` must be a valid timestamp (not in the distant past).
   - Invalid parameters are rejected before any DAO proposal is executed.

3. **Transparency**
   - Every lock operation is logged and referenced in the **Lock Registry** for community review.
   - Records include date, wallet, amount, startTime, cliff, and duration.

---

## Exceptional Use Cases
- Token vesting for team, advisor, or private sale allocations.
- Reserve restructuring or migration to a Safe multi-sig.
- Strategic locks for ecosystem incentives.

---

## Execution History (summary)
- As of 2025-09-16, all lock operations have followed DAO review and registry documentation.
- No invalid parameter has been executed.

---

_Last Updated: 2025-09-16_
