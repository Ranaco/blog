import type { Config } from "tailwindcss";

const config: Config = {
  darkMode: "class",
  content: [
    "./src/pages/**/*.{js,ts,jsx,tsx,mdx}",
    "./src/components/**/*.{js,ts,jsx,tsx,mdx}",
    "./src/app/**/*.{js,ts,jsx,tsx,mdx}",
  ],

  theme: {
    extend: {
      keyframes: {
        enter: {
          "0%, 100%": {
            transform: "translateY(40px)",
          },
        },
        exit: {
          "0%, 100%": {
            transform: "translateY(-40px)",
          },
        },
      },
      animation: {
        enter: "enter 0.5s ease-in-out",
        exit: "exit 0.5 ease-in-out",
      },
      backgroundColor: {
        dark: "#202023",
        light: "#f0e7db",
        pnk: "#ff63c3",
        blu: "#3d7aed",
        nordDark: "#353436",
      },
      textColor: {
        dark: "#202023",
        light: "#f0e7db",
        pnk: "#ff63c3",
        blu: "#3d7aed",
      },
      borderColor: {
        pnk: "#ff63c3",
        blu: "#3d7aed",
      },
      boxShadow: {
        dark: "#252529",
      },
      backgroundImage: {
        "gradient-radial": "radial-gradient(var(--tw-gradient-stops))",
        "gradient-conic":
          "conic-gradient(from 180deg at 50% 50%, var(--tw-gradient-stops))",
      },
    },
  },
  plugins: [],
};
export default config;
