import * as React from "react";
import { AppContext } from "@/pages/_app";
import { AnimatePresence, motion } from "framer-motion";
import MenuTile from "./menu-tile";

const MenuPage: React.FC = () => {
  const appContext = React.useContext(AppContext);
  const children = ["something", "never", "change", "time"];
  return (
    <AnimatePresence>
      {appContext?.state.menuIsOpen && (
        <motion.div
          className="h-screen w-screen fixed z-30 flex flex-col gap-10"
          style={{}}
          initial={{
            top: "-100vw",
          }}
          animate={{
            top: 0,
          }}
          exit={{
            top: "-100vw",
          }}
          transition={{ duration: 0.5, ease: "easeInOut" }}
        >
          {children.map((e, index) => {
            return (
              <MenuTile key={index} duration={index + 1}>
                {e}
              </MenuTile>
            );
          })}
        </motion.div>
      )}
    </AnimatePresence>
  );
};

export default MenuPage;
