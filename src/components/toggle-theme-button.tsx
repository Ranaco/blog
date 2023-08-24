import * as React from "react";
import { BiSolidMoon, BiSun } from "react-icons/bi";
import { AppContext } from "@/pages/_app";
import { AnimatePresence, motion } from "framer-motion";

const ToggleThemeButton = () => {
  const appContext = React.useContext(AppContext);

  return (
    <AnimatePresence mode="wait" initial={false}>
      <motion.div
        onClick={() => appContext?.state.toggleTheme(!appContext?.state.isDark)}
        className="h-12 w-12 rounded-md dark:bg-amber-400 bg-blu flex items-center justify-center"
        key={String(appContext?.state.isDark)}
        initial={{ y: -20, opacity: 0 }}
        animate={{ y: 0, opacity: 1 }}
        exit={{ y: 20, opacity: 0 }}
        transition={{ duration: 0.2 }}
      >
        {appContext?.state.isDark ? (
          <BiSun className={"h-6 w-6"} />
        ) : (
          <BiSolidMoon className={"h-6 w-6 text-white"} />
        )}
      </motion.div>
    </AnimatePresence>
  );
};

export default ToggleThemeButton;
