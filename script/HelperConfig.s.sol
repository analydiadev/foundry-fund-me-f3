//SPDX-License-Identifier: MIT

pragma solidity ^0.8.21;
import {Script} from "../lib/forge-std/src/Script.sol";

contract HelperConfig {
    NetworkConfig public activeNetworkConfig;

    struct NetworkConfig {
        address priceFeed;
    }

    constructor() {
        activeNetworkConfig = block.chainid == 11155111
            ? getSapoliaEthConfig()
            : getAnvilEthConfig();
    }
    function getSapoliaEthConfig() public pure returns (NetworkConfig memory) {
        //price feed address
        NetworkConfig memory sapoliaConfig = NetworkConfig({
            priceFeed: 0x694AA1769357215DE4FAC081bf1f309aDC325306
        });
        return sapoliaConfig;
    }
    function getAnvilEthConfig() public pure returns (NetworkConfig memory) {
        //price feed address
    }
}
