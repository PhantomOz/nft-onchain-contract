import { ethers } from "hardhat";

async function main() {
  const NAME = "Web3Bridge Students";
  const SYMBOL = "W3BS";

  const nft = await ethers.deployContract("ERC721Token", [NAME, SYMBOL]);

  await nft.waitForDeployment();

  console.log(
    `deployed to ${nft.target}`
  );
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
