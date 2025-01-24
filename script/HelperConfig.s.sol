//SPDX-License-Identifier: MIT

pragma solidity ^0.8.21;
import {Script} from "../lib/forge-std/src/Script.sol";
import {MockV3Aggregator} from "../test/mocks/MockV3Aggregator.sol";

contract HelperConfig is Script {
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
        NetworkConfig memory sapoliaConfig = NetworkConfig({
            priceFeed: 0x694AA1769357215DE4FAC081bf1f309aDC325306
        });
        return sapoliaConfig;
    }
    function getAnvilEthConfig() public returns (NetworkConfig memory) {
        vm.startBroadcast();
        MockV3Aggregator mockPriceFeed = new MockV3Aggregator(8, 5000e8);
        vm.stopBroadcast();
        NetworkConfig memory anvilConfig = NetworkConfig({
            priceFeed: address(mockPriceFeed)
        });
        return anvilConfig;
    }
}
