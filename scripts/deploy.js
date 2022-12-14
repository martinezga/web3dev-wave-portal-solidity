const main = async () => {
  const [deployer] = await hre.ethers.getSigners();
  const accountBalanceBefore = await deployer.getBalance();

  console.log("Deploying contracts with account:", deployer.address);
  console.log("Account balance before deploy:", accountBalanceBefore.toString());

  const Token = await hre.ethers.getContractFactory("WavePortal");
  const portal = await Token.deploy({
    value:hre.ethers.utils.parseEther("0.001")
  });
  await portal.deployed();

  const accountBalanceAfter = await deployer.getBalance();
  console.log("Account balance after deploy", accountBalanceAfter.toString());
  console.log("WavePortal address:", portal.address);
};

const runMain = async () => {
  try {
    await main();
    process.exit(0);
  } catch (error) {
    console.error(error);
    process.exit(1);
  }
};

runMain();
