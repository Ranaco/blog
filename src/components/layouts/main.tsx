import * as React from "react";
import type { Router } from "next/router";
import Head from "next/head";
import { Hind_Madurai } from "next/font/google";
import NavBar from "../navbar";
import { AnimatePresence, motion } from "framer-motion";
import AnimatedCursor from "../animated-pointer";
import MenuPage from "../menu-page";
import NavbarMenu from "../navbar-menu";
import { bebas } from "@/pages/_app";
import AnimatedText from "../animated-text";

interface MainProps {
  children: React.ReactNode;
  router: Router;
}

const Main: React.FC<MainProps> = ({ children, router }) => {
  let title = "";
  switch (router.asPath) {
    case "/":
      title = "Home";
      break;
    case "/works":
      title = "Works";
      break;
    case "/blog":
      title = "Blog";
      break;
    default:
      title = "Home";
      break;
  }
  return (
    <div
      className={`min-h-screen min-w-screen ${bebas.className} dark:bg-dark bg-light dark:text-light text-dark`}
    >
      <Head>
        <meta name="author" content="Ranaco" />
        <meta name="author" content="https://github.com/Ranaco" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>Ranaco | {title}</title>
      </Head>
      <div className="w-screen h-screen flex">
        <AnimatedCursor />
        <NavBar router={router} />
        <NavbarMenu>
          <div></div>
        </NavbarMenu>
        <MenuPage />
        <AnimatePresence mode="wait" initial={false}>
          <motion.div
            className="mt-28 w-screen h-[72] flex justify-start items-center pb-3"
            key={router.asPath}
            initial={{ opacity: 0, y: 40 }}
            animate={{ opacity: 1, y: 0 }}
            exit={{ opacity: 0, y: 40 }}
            transition={{ duration: "0.2" }}
          >
            <AnimatedText />
            {children}
          </motion.div>
        </AnimatePresence>
      </div>
    </div>
  );
};

export default Main;
