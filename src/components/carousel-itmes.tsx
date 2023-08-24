import * as React from "react";

interface CarouselItemProps {
  title: string;
  image: string;
}

const CarouselItem: React.FC<CarouselItemProps> = ({ title, image }) => {
  return (
    <div
      className={`h-[100%] hover:w-[100%] w-[25%] transition-all duration-300 relative`}
    >
      <img
        src={image}
        className={`h-[100%] w-[100%] transition-all duration-300 object-center object-cover absolute`}
        style={{}}
      />
    </div>
  );
};

export default CarouselItem;
