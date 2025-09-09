import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

export default buildModule("TokenB_Module", (m) => {
  const tokenB = m.contract("TokenB", ["TokenB", "TKB$"]);

  return { tokenB };
});
