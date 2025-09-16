# Lock Policy

This policy governs the use of the `lockTokens` and `mintLocked` functions in the SGiToken contract.  
It ensures that all token locking follows strict rules to maintain fairness, prevent misuse, and provide transparency.

---

## Principles

1. **No Self-Locking**
   - A lock operation where the `recipient` is the same as the `sender` is **not permitted**.  
   - This prevents creation of invalid lock records without an actual token transfer.

2. **Cliff & Duration Validation**
   - All locks must include a valid `startTime`, `cliff`, and `duration`.  
   - Zero or invalid values are prohibited to avoid incorrect vesting schedules.

3. **Transparency**
   - All lock operations must be recorded in the **Lock Registry**.  
   - Each entry includes recipient, amount, time parameters, and DAO proposal reference.

4. **Governance**
   - Only the DAO/Owner (multi-sig controlled) can execute lock functions.  
   - Execution requires multi-party approval, ensuring no unilateral action.

---

## Exceptional Use Cases

Locking may be used in the following scenarios:

- Team/Advisor vesting
- Private/Public sale vesting
- DAO reserve allocation
- Ecosystem incentive distribution

---

## Registry & Documentation

- Every lock event must be registered in `/registry/lock-registry.csv`.  
- The registry ensures transparency for the community and external auditors.  
- Any detected invalid attempt (e.g., self-locking, invalid parameters) will be rejected at the DAO governance level.

---

_Last Updated: 2025-09-16_
