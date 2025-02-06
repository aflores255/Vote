# 🗳️ Whitelist Voting Smart Contract

## 📌 Overview

The **Whitelist Voting Smart Contract** is a blockchain-based voting system that allows only a predefined set of whitelisted addresses to participate in an election. Each whitelisted voter can vote only once for one of the four predefined candidates. The contract ensures fair voting and provides functionality to check results once all votes have been completed.

This contract was developed using **Solidity** and is compatible with **Ethereum Virtual Machine (EVM)-based blockchains**.

---

## 🚀 Features

| Feature                  | Description                                            |
| ------------------------ | ------------------------------------------------------ |
| ✅ Whitelist-based voting | Only whitelisted addresses can vote                    |
| 🗳️ Single vote per user | Each user can vote only once                           |
| 📊 Vote counting         | Keeps track of votes for each candidate                |
| 🔐 Access control        | Admin can manage the whitelist and deploy the contract |
| ⏳ Voting finalization    | Results can only be accessed once all votes are cast (except if you deployed the contract. In that case you can check the results anytime)  |

---

## 📜 Smart Contract Details

### ⚙️ Modifiers

| Modifier          | Description                                                          |
| ----------------- | -------------------------------------------------------------------- |
| `onlyMod`       | Restricts function access to the contract owner (moderator)            |
| `onlyWhitelisted` | Ensures only whitelisted addresses can vote and haven't voted before |
| `notVoted`     | Ensures the address has not voted before                                 |
| `votingEnded`     | Ensures voting has ended before final results can be accessed        |

---

## 📡 Events

| Event                                        | Description                                       |
| -------------------------------------------- | ------------------------------------------------- |
| `Voted(address voter, Candidates candidate)` | Emitted when a user successfully votes            |
| `Whitelisted(address user)`                  | Emitted when an address is added to the whitelist |

---

## 💻 Contract Functions

### 🗳️ Voting Functions

| Function                      | Description                                                                 |
| ----------------------------- | --------------------------------------------------------------------------- |
| `vote(Candidates _candidate)` | Allows a whitelisted user to vote for one of the candidates                 |
| `getCurrentVotes()`           | Returns the current vote count for each candidate (only deployer can access)|
| `hasVotingEnded()`            | Returns `true` if all votes have been completed, otherwise `false`          |
| `getFinalResults()`           | Returns the final vote count (only after voting has ended)                  |

---

## 🛠️ How to Use

### 🔧 Prerequisites

- **Remix IDE** (or any Solidity-compatible development environment)
- **Ethereum wallet** (e.g., MetaMask) for deployment in testnet or Mainnet


### 🚀 Deployment Steps

1. Open **Remix IDE** and create a new Solidity file (e.g., `Vote.sol`).
2. Paste the smart contract code into the file.
3. Compile the contract using **Solidity version 0.8.24**.
4. Deploy the contract by passing an array of whitelisted addresses as a constructor argument:
   ```solidity
   ["0x1234567890abcdef1234567890abcdef12345678", "0xabcdefabcdefabcdefabcdefabcdefabcdefabcd"]
   ```
5. Confirm the transaction in your wallet to complete the deployment.

### 🖱️ Interacting with the Contract

- **Vote:** Call the `vote()` function with a candidate index (0 = First Candidate, 1 = Second Candidate, etc.).
- **View Results:** Use `getCurrentVotes()` before voting ends and `getFinalResults()` after it ends.

---

## 📄 License

This project is licensed under the **This project is licensed under the LGPL-3.0-only.**



