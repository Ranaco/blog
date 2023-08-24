import * as React from "react";

interface UseDragProps {
  maxDrag: number;
}

const useDrag = ({ maxDrag }: UseDragProps) => {
  console.log(maxDrag);
  const [dragX, setDragX] = React.useState(0);

  const onMouseMove = (e: React.MouseEvent) => {
    console.log(e.movementX);
  };

  const onMouseEnter = (e: React.MouseEvent) => {
    console.log(e.clientX);
  };

  const onMouseLeave = (e: React.MouseEvent) => {
    console.log(e.clientX);
  };

  return {
    dragX,
    onMouseEnter,
    onMouseMove,
    onMouseLeave,
  };
};

export default useDrag;
