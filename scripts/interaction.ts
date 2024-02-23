import { ethers } from "hardhat";

async function main() {
  const NAME = "Favour Aniogor";
  const ADDRESS = "0xa67972265516E4BFEA3d4f9c70749768be2d29F8";

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
