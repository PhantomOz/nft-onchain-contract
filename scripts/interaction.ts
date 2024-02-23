import { ethers } from "hardhat";

async function main() {
  const NAME = "Favour Aniogor";
  const ADDRESS = "0x10A6608a198a2BC946e2cDE6A1a34Cc218Da0EFA";

  const nft = await ethers.getContractAt("ERC721Token", ADDRESS);

  await nft.mintNft(NAME);

  console.log(
    `Token URI ${await nft.tokenURI(0)}`
  );
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
