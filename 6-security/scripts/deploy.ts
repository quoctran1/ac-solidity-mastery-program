import "@nomicfoundation/hardhat-ethers";
import { ethers } from "hardhat";

const JAN_1ST_2030 = 1893456000;
const ONE_GWEI: bigint = 1_000_000_000n;

async function main() {
  const [owner] = await ethers.getSigners();
  console.log("Deploying contracts with the account: ", owner.address);
  console.log("Account balance: ", (await owner.provider.getBalance(owner)).toString());

  // const deploy = async () => {
  //   const Lock = await ethers.getContractFactory("Lock");
  //   const lock = await Lock.deploy(JAN_1ST_2030, {
  //     value: ONE_GWEI,
  //   });

  //   console.table({
  //     lock: await lock.getAddress(),
  //   });
  // };
  const accessControl = async () => {
    const VulnerableAccessControl = await ethers.getContractFactory("VulnerableAccessControl");
    const vulnerableAccessControl = await VulnerableAccessControl.deploy();

    const AccessControlAttacker = await ethers.getContractFactory("AccessControlAttacker");
    const accessControlAttacker = await AccessControlAttacker.deploy(vulnerableAccessControl);

    console.table({
      vulnerableAccessControl: await vulnerableAccessControl.getAddress(),
      accessControlAttacker: await accessControlAttacker.getAddress(),
    });
  };

  const externalCall = async () => {
    const VulnerableExternalCall = await ethers.getContractFactory("VulnerableExternalCall");
    const vulnerableExternalCall = await VulnerableExternalCall.deploy();

    const ExternalCallAttacker = await ethers.getContractFactory("ExternalCallAttacker");
    const externalCallAttacker = await ExternalCallAttacker.deploy(vulnerableExternalCall);

   

    console.table({
      vulnerableExternalCall: await vulnerableExternalCall.getAddress(),
      externalCallAttacker: await externalCallAttacker.getAddress(),
    });
  };
  
  const overflow = async () => {
    const VulnerableOverflow = await ethers.getContractFactory("VulnerableOverflow");
    const vulnerableOverflow = await VulnerableOverflow.deploy();

    const OverflowAttacker = await ethers.getContractFactory("OverflowAttacker");
    const overflowAttacker = await OverflowAttacker.deploy(vulnerableOverflow);

   

    console.table({
      vulnerableOverflow: await vulnerableOverflow.getAddress(),
      overflowAttacker: await overflowAttacker.getAddress(),
    });
  };
  
  // await accessControl();
  // await externalCall();
  await overflow();
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
