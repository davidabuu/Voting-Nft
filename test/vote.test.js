const { assert, chai } = require("chai");
const { getNamedAccounts, deployments, ethers } = require("hardhat");

describe("Voting App", async () => {
  let voteContract;
  let deployer;
  beforeEach(async () => {
    deployer = (await getNamedAccounts()).deployer;
    await deployments.fixture(["all"]);
    voteContract = await ethers.getContract("VotingContract", deployer);
  });
  it("Check the number of Candidates", async () => {
    const numberOfCandidates = await voteContract.getAllCandidates();
    console.log(numberOfCandidates);
  });
});
