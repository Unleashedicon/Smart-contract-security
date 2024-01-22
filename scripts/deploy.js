const { ethers } = require('hardhat');

async function main() {
    const StorageVictim = await ethers.getContractFactory("StorageVictim");
    const storageVictim = await StorageVictim.deploy();
    await storageVictim.deployed();
    console.log("StorageVictim deployed to:", storageVictim.address);

}

main()
    .then(() => process.exit(0))
    .catch(error => {
        console.error(error);
        process.exit(1);
    });
