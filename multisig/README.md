# SMARTGOLF Multisig Governance

This folder documents the multisig structure and decentralized governance plan of **SMARTGOLF Inc.** for the **SGi Token** ecosystem.

The purpose of this setup is to enhance transparency, reduce single-point control, and gradually transition toward a fully DAO-managed treasury and ecosystem fund.

---

## 🧩 Current Setup
- **Platform:** Gnosis Safe (Ethereum mainnet)
- **Policy:** 3-of-5 multisig (3 signatures required for any transaction)
- **Safes:**
  - **SGi DAO Reserve Safe:** (30%) Keep foundation asset for future usage (4-of-5 multisig)
  - **SGi Public sale Safe:** (25%) Temporal keeping for CEX public pool
  - **SGi Ecosystem & rewards Safe:** (12%) Manages ecosystem rewards and staking incentives
  - **Team Treasury Safe:** (4.5) Handles internal compensation and development expenses  
  - **lIQUIDITY Safe:** (2%) Used for exchange pool liquidity 

---

## 🔐 Signers (3-of-5)
| Role | Description |
|------|--------------|
| Founder | SMARTGOLF Inc. CEO |
| Core Developer | Smart contract and DApp management |
| Legal Advisor | Compliance and audit confirmation |
| Investor Representative | External oversight signer |
| Ecosystem Partner | DAO representative from community |

---

## 🛠 Transition Plan
SMARTGOLF Inc. is currently improving from a semi-centralized multisig management model to a **fully on-chain DAO-controlled system**, with future integration of:
- Snapshot-based voting for proposal execution
- Automated Safe triggers for approved transactions
- Role-based smart contract signers

All related addresses and updates are available in `safe_addresses.json`.
_Last updated: October 22, 2025_
