# Foundry Fund Me

This repository is part of the **Cyfrin Solidity Course** and demonstrates how to build, deploy, and interact with a decentralized "Fund Me" contract using **Foundry** and **zkSync**.

## 🚀 Table of Contents

- [Overview](#overview)
- [Getting Started](#getting-started)
  - [Requirements](#requirements)
  - [Quickstart](#quickstart)
  - [Optional Gitpod](#optional-gitpod)
- [Usage](#usage)
  - [Deploy](#deploy)
  - [Testing](#testing)
  - [Test Coverage](#test-coverage)
  - [Local zkSync](#local-zksync)
- [Deployment](#deployment)
  - [To Local zkSync Node](#to-local-zksync-node)
  - [To Testnet/Mainnet](#to-testnetmainnet)
- [Scripts](#scripts)
  - [Withdraw Funds](#withdraw-funds)
  - [Estimate Gas](#estimate-gas)
- [Formatting](#formatting)
- [Additional Info](#additional-info)
  - [What "Official" Means](#what-official-means)
- [Contributing](#contributing)
- [License](#license)
- [Acknowledgements](#acknowledgements)

---

## Overview

**Foundry Fund Me** is a Solidity-based smart contract project that allows users to donate and withdraw funds to/from a contract. It’s built using **Foundry** for local development and deployment and **zkSync** for scaling to Layer 2 (L2). The contract leverages Chainlink oracles for price feeds in some instances.

---

## Getting Started

### Requirements

To get started with this project, you need to have the following tools and dependencies installed:

- **Git**:  
  Ensure Git is installed by running:  
  `git --version`

- **Foundry**:  
  Install and verify Foundry by running:  
  `forge --version`

- **Docker** (optional, for local zkSync node):  
  Check if Docker is installed and running:  
  `docker --version`

- **Node.js & npm**:  
  Make sure you have Node.js and npm installed. Verify with:  
  `npm --version`  
  `npx --version`

### Quickstart

1. Clone the repository:
   ```bash
   git clone https://github.com/analydiadev/foundry-fund-me-f3
   cd foundry-fund-me-f3
   ```

## Usage

Deploying the Contract
To deploy the FundMe contract, run the following command:

`forge script script/DeployFundMe.s.sol`

This will deploy the contract using the script located in script/DeployFundMe.s.sol.

### Testing

This project includes tests across different tiers:

### Unit Tests

1. Integration Tests
2. Forked Tests
3. Staging Tests

To run all tests:

`forge test`

You can also run tests for specific functions using:

`forge test --match-test <testFunctionName>`

To run tests on a forked network (e.g., Sepolia):

`forge test --fork-url $SEPOLIA_RPC_URL`

Test Coverage
To check test coverage:

`forge coverage`

### Local zkSync

To set up a local zkSync node for development, follow the instructions in the section below.

### Deployment

To Local zkSync Node
Install Local zkSync Node: Follow these steps to set up a local zkSync node:

`npx zksync-cli dev config`

Select “In memory node” (no extra modules).

Start the node:

`npx zksync-cli dev start`
Deploy to zkSync: Once the local zkSync node is running, deploy the contract with:

`make deploy-zk`

### To Testnet or Mainnet

Setup Environment Variables:
You will need to set up the following environment variables:

1. PRIVATE_KEY: The private key of your account (e.g., from Metamask).
2. SEPOLIA_RPC_URL: RPC URL for the Sepolia testnet (you can get this from Alchemy).
3. ETHERSCAN_API_KEY (optional for contract verification).

You can create a .env file to store them.

### Deploy to Testnet:

Run the following script to deploy to Sepolia:

`forge script script/DeployFundMe.s.sol --rpc-url $SEPOLIA_RPC_URL --private-key $PRIVATE_KEY --broadcast --verify --etherscan-api-key $ETHERSCAN_API_KEY`

## Scripts

### Withdraw Funds

To withdraw funds from the deployed contract, use the following command:

`cast send <FUNDME_CONTRACT_ADDRESS> "withdraw()" --private-key <PRIVATE_KEY>`

## Estimate Gas

### To estimate gas usage:

`forge snapshot`

This will generate a .gas-snapshot file with the estimated gas costs.

Formatting
To format your code:

`forge fmt`

## Additional Info

What "Official" Means
Some users were having confusion regarding whether Chainlink-brownie-contracts is an official Chainlink repository. It is an official repository maintained by the Chainlink team for the purpose of supporting Chainlink oracles. It follows the official Chainlink release process and packages it in a way that’s compatible with Foundry.

For more information, see:

Chainlink-brownie-contracts on GitHub

## Contributing

Contributions are welcome! Please fork the repository, create a new branch, make your changes, and submit a pull request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgements

Special thanks to Patrick Collins for creating the course and repository.
Chainlink for their official libraries and support.
zkSync for providing Layer 2 scaling solutions.
