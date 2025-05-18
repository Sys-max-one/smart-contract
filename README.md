# Kcoin ICO Smart Contract

This smart contract implements a basic Initial Coin Offering (ICO) for **Kcoin**. It allows investors to buy and sell Kcoin using USD, and check their equity in both Kcoin and USD. The contract is written in Solidity and is compatible with the Ethereum Virtual Machine (EVM).

## 🔧 Features

* 🪙 **Buy Kcoin** using USD (1 USD = 1 Kcoin).
* 💵 **Sell Kcoin** to redeem USD (1 Kcoin = 1 USD).
* 📊 **Check Equity** in both Kcoin and USD.
* 🔐 Protects investors from buying more than the total Kcoin supply.

## 🧪 Tech Stack

* Language: Solidity `0.8.30`

## 🚀 Getting Started

### Prerequisites

* Code is build using [Remix IDE](https://remix.ethereum.org/) and tested on Environment **Remix VM (Prague)**

### Compile and Run

1. Solidity Compiler
<p align="center"><img width="337" alt="1  Solidity Compiler" src="https://github.com/user-attachments/assets/a94df8ef-56e0-432f-9493-ce834dd3f01a" /></p>

2. Deploy and Run Transaction
<p align="center"><img width="342" alt="2  Deploy and Run Transaction" src="https://github.com/user-attachments/assets/f30dec75-b409-4711-a222-d1e3a72abf90" /></p>

3. Deploy Contracts
<p align="center"><img width="334" alt="3  Deploy Contracts" src="https://github.com/user-attachments/assets/21f0c0fb-b1eb-4b94-bb97-b5c2d4dadf15" /></p>

4. Expand BUY_KCOIN
<p align="center"><img width="341" alt="4  Expand BUY_KCOIN" src="https://github.com/user-attachments/assets/481bb1c9-905c-4a46-af5a-ff1e25545ce8" /></p>

5. Input values for Public Address and USD
<p align="center"><img width="338" alt="5  Input values for Public Address and USD" src="https://github.com/user-attachments/assets/c40053e0-942b-4afb-a7e2-67aa51e41fb6" /></p>


### Key Contract Functions

#### Buy Kcoin

```solidity
function buy_kcoin(address investor, uint usd_to_invest) public can_buy_kcoin(usd_to_invest)
```

* Allows the investor to buy Kcoin based on the amount of USD invested.

#### Sell Kcoin

```solidity
function sell_kcoin(address investor, uint kcoin_to_sell) public
```

* Allows the investor to sell their Kcoin for equivalent USD.

#### Check Equity

```solidity
function equity_in_kcoin(address investor) public view returns (uint)
function equity_in_usd(address investor) public view returns (uint)
```

* Returns the investor’s balance in Kcoin and USD respectively.

## 📈 Variables

| Variable             | Description                                |
| -------------------- | ------------------------------------------ |
| `max_kcoin`          | Total supply of Kcoin (100,000)            |
| `one_usd_to_kcoin`   | Exchange rate (1 USD = 1 Kcoin)            |
| `one_kcoin_to_usd`   | Reverse exchange rate (1 Kcoin = 1 USD)    |
| `total_kcoin_bought` | Tracks how many Kcoins have been purchased |
| `equity_kcoin`       | Mapping of user Kcoin balances             |
| `equity_usd`         | Mapping of user USD-equivalent balances    |

## 🖼 Architecture

```mermaid
graph TD
  A[User Wallet] --> B[Smart Contract - Kcoin_ico]
  B --> C{Check if Purchase is Valid}
  C -->|Yes| D[Buy Kcoin]
  D --> E[Update Equity Mappings]
  B --> F[Sell Kcoin]
  F --> G[Update Equity Mappings]
  B --> H[Check Equity]
```
