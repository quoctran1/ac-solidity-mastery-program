import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";
import { ethers } from "hardhat";


const BasicCalculatorModule = buildModule("BasicCalculatorModule", (m) => {

  const lock = m.contract("AdvancedCalculator",);
  return { lock };
});


export default BasicCalculatorModule;

