require("@nomiclabs/hardhat-waffle")
require("dotenv").config({ path: ".env" });

const API_KEY = process.env.ALCHEMY_API_KEY_URL;

const PRIVATE_KEY = process.env.GOERLI_PRIVATE_KEY;

module.exports = {
  solidity: "0.8.0",
  networks: {
    goerli: {
      url: API_KEY,
      accounts: [PRIVATE_KEY],
    },
  },
};