import * as React from "react";
import "@/styles/globals.css";
import type { AppProps } from "next/app";
import Layout from "@/components/layouts/main";
import { Bebas_Neue } from "next/font/google";

export const bebas = Bebas_Neue({
  weight: ["400"],
  subsets: ["latin"],
});

export type AppContextType = {
  isDark: boolean;
  menuIsOpen: boolean;
  toggleTheme(value: boolean): void;
  mousePos: { x: number; y: number };
  pointerScale: number;
  animatedText: string;
};

export type AppContextValue = {
  state: AppContextType;
  setState: React.Dispatch<React.SetStateAction<AppContextType>>;
};

export const AppContext = React.createContext<AppContextValue | undefined>(
  undefined
);

export default function App({ Component, pageProps, router }: AppProps) {
  const toggleTheme = (value: boolean) => {
    if (value) {
      localStorage.setItem("light", "false");
      document.documentElement.classList.toggle("dark");
      document.documentElement.classList.toggle("light");
      setState((val) => ({ ...val, isDark: true }));
    } else {
      localStorage.setItem("light", "true");
      document.documentElement.classList.toggle("dark");
      document.documentElement.classList.toggle("light");
      setState((val) => ({ ...val, isDark: false }));
    }
  };
  const [state, setState] = React.useState<AppContextType>({
    isDark: false,
    menuIsOpen: false,
    toggleTheme,
    mousePos: { x: 0, y: 0 },
    pointerScale: 1,
    animatedText: "",
  });

  React.useEffect(() => {
    const handleStorage = (e?: StorageEvent) => {
      if (localStorage.getItem("light") === "true") {
        document.documentElement.classList.add("light");
        setState((val) => ({ ...val, isDark: false }));
      } else {
        document.documentElement.classList.add("dark");
        setState((val) => ({ ...val, isDark: true }));
      }
    };

    handleStorage();

    window.addEventListener("storage", handleStorage);

    return () => window.removeEventListener("storage", handleStorage);
  }, []);

  return (
    <AppContext.Provider value={{ state, setState }}>
      <Layout router={router}>
        <Component {...pageProps} key={router.route} />
      </Layout>
    </AppContext.Provider>
  );
}
