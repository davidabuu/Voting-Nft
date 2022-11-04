// const { network } = require("hardhat");

const { network } = require("hardhat");

// module.exports = async ({ getNamedAccounts, deployments }) => {
//   const { deploy, log } = deployments;
//   const { deployer } = await getNamedAccounts();

//   await deploy("VotingNft", {
//     from: deployer,
//     args: [],
//     log: true,
//     waitConfirmation: network.config.blockConfirmation || 1,
//   });
//   log("-------Deploying Contract");
// };

module.exports = async ({ getNamedAccounts, deployments }) => {
  const { deploy, log } = deployments;
  const { deployer } = await getNamedAccounts();

  await deploy("VotingContract", {
    from: deployer,
    args: [],
    log: true,
    waitConfirmations: network.config.blockConfirmations || 1,
  });
};
