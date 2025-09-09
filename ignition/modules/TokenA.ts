import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

export default buildModule("TokenA_Module", (m) => {
  const tokenA = m.contract("TokenA", ["TokenA", "TKA$"]);

  return { tokenA };
});
