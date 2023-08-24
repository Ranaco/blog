import * as React from "react";
import { CiMenuFries } from "react-icons/ci";
import { RxCross1 } from "react-icons/rx";
import { motion, AnimatePresence } from "framer-motion";
import { AppContext } from "../pages/_app";

interface NavbarMenuProps {
  children: React.ReactNode;
}

const NavbarMenu: React.FC<NavbarMenuProps> = ({ children }) => {
  const appContext = React.useContext(AppContext);

  const toggleMenu = () => {
    appContext?.setState((val) => ({ ...val, menuIsOpen: !val.menuIsOpen }));
  };

  return (
    <div
      className="h-12 w-12 rounded-md bg-transparent border-solid border-2 dark:border-amber-400 flex justify-center items-center border-pnk z-40 fixed right-12 top-8"
      style={{}}
      onClick={toggleMenu}
    >
      <AnimatePresence mode="wait" initial={false}>
        <motion.div
          key={String(appContext?.state.menuIsOpen)}
          initial={{
            opacity: 0,
            transform: "rotate(-90deg)",
          }}
          animate={{
            opacity: 1,
            transform: appContext?.state.menuIsOpen
              ? "rotate(90deg)"
              : "rotate(0deg)",
          }}
          exit={{
            opacity: 0.4,
            transform: "rotate(-90deg)",
          }}
          transition={{ duration: 0.5 }}
        >
          {appContext?.state.menuIsOpen ? (
            <RxCross1 className="dark:text-amber-400 h-6 w-6 text-pnk font-bold transition-opacity duration-300 ease-in-out" />
          ) : (
            <CiMenuFries className="dark:text-amber-400 h-6 w-6 text-pnk font-bold transition-opacity duration-300 ease-in-out stroke-1" />
          )}
        </motion.div>
      </AnimatePresence>
    </div>
  );
};

export default NavbarMenu;
