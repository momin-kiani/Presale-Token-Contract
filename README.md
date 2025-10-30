# Presale Contract

## Overview
This project includes a simple **token presale contract** built with Solidity.  
It uses two ERC20 tokens:
- **Payment Token** – used to buy presale tokens (value = $2)
- **Presale Token** – the token being sold (value = $0.125)

The contract allows users to buy presale tokens using payment tokens under certain conditions.

---

## Key Features
- Users can purchase presale tokens by paying with the payment token.
- Presale tokens are **minted directly** to the buyer’s wallet.
- Enforces **minimum**, **maximum**, and **total** presale limits.
- Tracks the total USD value sold.

---

## Presale Rules
| Rule | Description |
|------|--------------|
| **Payment Token Value** | $2.00 |
| **Presale Token Value** | $0.125 |
| **Minimum Purchase** | $0.16 |
| **Maximum Purchase** | $40,000 |
| **Total Sale Cap** | $120,000 |

---

## Function Summary
### `buyToken(uint256 paymentAmount)`
- Transfers payment tokens from the buyer to the contract.
- Calculates equivalent presale tokens based on token values.
- Mints presale tokens to the buyer’s wallet.
- Updates total value sold.

---

## Deployment Steps
1. Deploy the **Payment Token (ERC20)**.  
2. Deploy the **Presale Token (ERC20)** with a `mint()` function.  
3. Deploy the **Presale Contract**, passing both token addresses to the constructor.  
4. Grant minting rights of the Presale Token to the Presale Contract.

---

## License
MIT License  
© 2025 — For learning and testing purposes only.
