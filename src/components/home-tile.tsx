import * as React from "react";
import { AppContext } from "@/pages/_app";

interface HomeTileProps {
  children: React.ReactNode;
  textToAnimate?: string;
  span: string;
}

const HomeTile: React.FC<HomeTileProps> = ({
  children,
  span,
  textToAnimate,
}) => {
  const appContext = React.useContext(AppContext);
  const animateText = () =>
    textToAnimate
      ? appContext?.setState((val) => ({ ...val, animatedText: textToAnimate }))
      : undefined;

  const animateBack = () =>
    textToAnimate
      ? appContext?.setState((val) => ({ ...val, animatedText: "" }))
      : undefined;

  return (
    <div
      onMouseEnter={() => {
        appContext!.setState((val) => ({ ...val, pointerScale: 3 }));
        animateText();
      }}
      onMouseLeave={() => {
        appContext!.setState((val) => ({ ...val, pointerScale: 1 }));
        animateBack();
      }}
      className={`dark:bg-light/5  bg-dark/5 ${span} flex justify-center items-center hover:shadow-dark hover:shadow-lg transition-all duration-500 hover:rounded-xl`}
    >
      {children}
    </div>
  );
};

export default HomeTile;
