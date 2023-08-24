import * as React from "react";
import Image from "next/image";
import NavbarButton from "./navbar-button";
import { Router } from "next/router";
import { AppContext } from "@/pages/_app";
import Link from "next/link";
import ToggleThemeButton from "./toggle-theme-button";

interface NavBarButtonGroupProps {
  hoverIndex: number | undefined;
  children: React.ReactNode;
  router: Router;
}

const NavBarButtonGroup: React.FC<NavBarButtonGroupProps> = ({
  children,
  hoverIndex,
  router,
}) => {
  const path = router.asPath;
  const positionStyles: React.CSSProperties = {};
  const blockStyles: React.CSSProperties = {
    backdropFilter: "blur(20px)",
  };
  const backgroundColor = "bg-pnk dark:bg-nordDark";

  if (hoverIndex === 1) {
    positionStyles.transform = "translateX(-120%)";
  } else if (hoverIndex === 2) {
    positionStyles.transform = "translateX(0%)";
  } else if (hoverIndex === 3) {
    positionStyles.transform = "translateX(120%)";
  }

  if (path === "/") {
    blockStyles.transform = "translateX(-100%)";
  } else if (path === "/works") {
    blockStyles.transform = "translateX(0%)";
  } else if (path === "/blog") {
    blockStyles.transform = "translateX(100%)";
  }

  return (
    <div className="hidden justify-center items-center relative md:flex">
      <div
        className={`w-24 dark:bg-gray-500/10 bg-dark/10 h-12 rounded-md absolute z-[-1] transition-[opacity, transform] ease-in-out duration-300 ${
          hoverIndex ? "opacity-100" : "opacity-0"
        }`}
        style={positionStyles}
      />
      <div
        className={` z-[-1] p-2 rounded-md absolute  ${backgroundColor} text-dark dark:text-light w-28 h-12 flex items-center justify-center text-lg ease-out duration-200 nav-button transition-[colors, transform]`}
        style={blockStyles}
      />
      {children}
    </div>
  );
};

interface NavBarProps {
  router: Router;
}

const NavBar: React.FC<NavBarProps> = ({ router }) => {
  const appContext = React.useContext(AppContext);
  const [hoverIndex, setHoverIndex] = React.useState<number | undefined>(0);

  const onNavHover = (index: number | undefined) => {
    setHoverIndex(index);
  };

  return (
    <div
      className="w-screen h-28 flex items-center justify-between text-black fixed z-10 pl-20 pr-28"
      style={{
        backdropFilter: "blur(10px)",
      }}
    >
      <Link href={"/"}>
        <Image
          src={
            !appContext!.state.isDark
              ? "/images/logo-no-background.png"
              : "/images/light/logo-no-background.png"
          }
          className="hover:scale-110 ease-in duration-100"
          alt={"Ranaco"}
          height={40}
          width={120}
        />
      </Link>
      <NavBarButtonGroup hoverIndex={hoverIndex} router={router}>
        <NavbarButton
          title="Home"
          path="/"
          currentPath={router.asPath}
          onHoverIndex={onNavHover}
          index={1}
        />
        <NavbarButton
          title="Works"
          path="/works"
          currentPath={router.asPath}
          onHoverIndex={onNavHover}
          index={2}
        />
        <NavbarButton
          title="Blog"
          path="/blog"
          currentPath={router.asPath}
          onHoverIndex={onNavHover}
          index={3}
        />
      </NavBarButtonGroup>
      <ToggleThemeButton />
    </div>
  );
};

export default NavBar;
