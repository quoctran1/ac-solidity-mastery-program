import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
import * as dotenv from "dotenv";
import "hardhat-abi-exporter";
import "hardhat-gas-reporter";
dotenv.config();
const {
  PRIVATE_KEY: privateKey,
  REPORT_GAS: reportGas,
} = process.env;

const config: HardhatUserConfig = {
  solidity: "0.8.24",
};
module.exports = {
  networks: {
    "localhost": {
      url: "http://127.0.0.1:8545/",
      chainId: 31337,
      accounts: [privateKey],
      timeout: 2_147_483_647,
    },
    "sepoliatest": {
      url: "https://rpc.sepolia.org",
      chainId: 11155111,
      accounts: [privateKey],
      timeout: 2_147_483_647,
    }
    ,
    "metistest": {
      url: "https://sepolia.metisdevops.link",
      chainId: 59902,
      accounts: [privateKey],
      timeout: 2_147_483_647,
    }
  },
  solidity: {
    version: "0.8.24",
    settings: {
      optimizer: {
        enabled: true,
        runs: 1000,
      },
    },
  },
  abiExporter: {
    path: "data/abi",
    runOnCompile: true,
    clear: true,
    flat: true,
    only: [],
    spacing: 4,
  },
  gasReporter: {
    enabled: reportGas == "1",
  },
  mocha: {
    timeout: 20000,
  },
};
export default config;
