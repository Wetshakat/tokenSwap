import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

export default buildModule("TokenSwap", (m) => {

    const TKA$Address = "0x1DBbbb32C25bC7b86DcAE981367C046e239F7f95";
    const TKB$Address = "0x7E938b347408f9C6d999b8F08A8007b120D89e6e";
    
    const TokenSwap = m.contract("TokenSwap",[TKA$Address, TKB$Address]);

  return { TokenSwap };
});
