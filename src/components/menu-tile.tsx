import * as React from "react";
import { AnimatePresence, motion } from "framer-motion";
import { AppContext } from "@/pages/_app";

interface MenuTileProps {
  children: React.ReactNode;
  duration: number;
}

const MenuTile: React.FC<MenuTileProps> = ({ children, duration }) => {
  const appContext = React.useContext(AppContext);
  return (
    <AnimatePresence>
      {appContext?.state.menuIsOpen && (
        <motion.div
          className="h-[23%] w-screen z-30 flex justify-center items-center bg-light/10 rounded-md dark:bg-dark/10"
          style={{
            backdropFilter: "blur(20px)",
          }}
          initial={{
            transform: `rotate(calc(-90deg / ${duration}))`,
            top: "-100vw",
          }}
          animate={{
            transform: "rotate(0deg)",
            top: 0,
          }}
          exit={{
            transform: `rotate(calc(-90deg / ${duration}))`,
            top: "-100vw",
          }}
          transition={{ duration: 0.5, ease: "easeInOut" }}
        >
          {children}
        </motion.div>
      )}
    </AnimatePresence>
  );
};

export default MenuTile;
