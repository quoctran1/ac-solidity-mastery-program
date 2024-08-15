import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const JAN_1ST_2030 = 1893456000;
const ONE_GWEI: bigint = 1_000_000_000n;

const SimpleStorageModule = buildModule("ReentrancyattackerModule", (m) => {
   

  const lock = m.contract("Reentrancyattacker",["0x80DbEf132295bF93376185FFc5d98E99B08c1778"]);

  return { lock };
});

export default SimpleStorageModule;
