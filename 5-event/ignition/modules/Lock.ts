import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const JAN_1ST_2030 = 1893456000;
const ONE_GWEI: bigint = 1_000_000_000n;

const SimpleStorageModule = buildModule("InterfaceCalculatorModule", (m) => {
   

  const lock = m.contract("InterfaceCalculator");

  return { lock };
});

export default SimpleStorageModule;
