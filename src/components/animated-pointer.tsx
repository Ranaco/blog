import * as React from "react";
import { AppContext } from "@/pages/_app";

const AnimatedCursor: React.FC = () => {
  const appContext = React.useContext(AppContext);

  const [position, setPosition] = React.useState({
    x: 0,
    y: 0,
  });

  const handleMouseMove = React.useCallback(
    (e: MouseEvent) => {
      setPosition((val) => ({
        x: e.clientX,
        y: e.clientY,
      }));
    },
    [position]
  );

  React.useEffect(() => {
    const mouseMove = (e: MouseEvent) => {
      requestAnimationFrame(() => handleMouseMove(e));
    };

    document.addEventListener("mousemove", mouseMove);

    return () => {
      document.removeEventListener("mousemove", mouseMove);
    };
  }, []);

  return (
    <React.Fragment>
      <div
        className={`fixed w-7 h-7 rounded-full z-50 bg-white mix-blend-difference pointer-events-none ease-out transition-transform duration-[150]`}
        style={{
          transform: `translate(${position.x}px, ${position.y}px) scale(${
            appContext?.state.pointerScale || 1
          })`,
        }}
      ></div>
      <div
        className={`fixed w-7 h-7 rounded-full z-50 bg-pnk/20 ease-out pointer-events-none transition-transform duration-500`}
        style={{
          transform: `translate(${position.x}px, ${position.y}px)`,
        }}
      ></div>
    </React.Fragment>
  );
};

export default AnimatedCursor;
