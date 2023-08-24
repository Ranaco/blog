import * as React from "react";
import { AppContext } from "@/pages/_app";

const AnimatedText: React.FC = () => {
  const appContext = React.useContext(AppContext);
  const [text, setText] = React.useState("");
  const [index, setIndex] = React.useState<number>(0);
  const ref = React.useRef<string>(appContext?.state.animatedText!);

  React.useEffect(() => {
    const animText = appContext?.state.animatedText!;
    let timeout: NodeJS.Timeout;

    // Reset text and index when animatedText changes
    if (ref.current === animText) {
      if (animText.length === 0 && index !== 0) {
        timeout = setTimeout(() => {
          setText((val) => val.slice(0, -1));
          setIndex((val) => val - 1);
        }, 30);
      }
      ref.current = animText; // Update the ref with the new value
      return;
    }

    // If text needs to be added
    if (index < animText.length) {
      timeout = setTimeout(() => {
        setText((val) => val + animText[index]);
        setIndex((val) => val + 1);
      }, 50);
    }

    // If text needs to be removed
    if (animText.length === 0 && index !== 0) {
      timeout = setTimeout(() => {
        setText((val) => val.slice(0, -1));
        setIndex((val) => val - 1);
      }, 30);
    }

    return () => clearTimeout(timeout);
  }, [appContext?.state.animatedText, index, text]);

  return (
    <div className="flex-[0.5] h-full flex justify-center items-center">
      <span className="rotate-[-90deg] text-6xl">{text}</span>
    </div>
  );
};

export default React.memo(AnimatedText);
