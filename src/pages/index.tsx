import * as React from "react";
import HomeTile from "@/components/home-tile";
import CarouselItem from "@/components/carousel-itmes";

const Home = () => {
  const demoCarouselData = ["Rana", "Satyam", "Raj", "Gmail.com"];

  return (
    <div className="w-full h-full md:w-[70%] flex flex-col gap-3 lg:flex-row">
      <div className="flex-1 h-full justify-start items-center gap-3 flex-col inline-flex">
        <HomeTile
          span={
            "text-center pl-5 pr-5 text-[2em] tracking-wide flex-[0.7] w-auto"
          }
          textToAnimate="About"
        >
          <strong>
            Tech Aficionado | Multilingual Programmer |<br /> Start-up Maven |
            Diagnosed with Code Syndrome at a tender age |<br /> Indian at heart
            🇮🇳 | Freelancer by profession <br />| Fuelled by Motivation & Hard
            Work
          </strong>
        </HomeTile>
        <HomeTile
          span={"flex gap-3 flex-1 w-full"}
          textToAnimate="Works | Projects"
        >
          {demoCarouselData.map((e, index) => {
            return (
              <CarouselItem
                key={index}
                title={e}
                image="https://images.unsplash.com/photo-1671373553893-61d902c64fff?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80"
              />
            );
          })}
        </HomeTile>
      </div>
      <div className="flex-1 h-full flex flex-col items-center justify-start gap-3">
        <div className="flex justify-center aspect-square flex-1 w-full">
          <HomeTile
            textToAnimate="Profile | Me"
            span={`relative overflow-hidden rounded-full h-full w-full`}
          >
            <img
              className="absolute right-10 scale-[1.2] hover:scale-[1] hover:right-0 transition-all duration-500"
              src="/images/profile.jpg"
              alt={"Profile"}
              style={{
                objectPosition: "left",
                objectFit: "cover",
              }}
            />
          </HomeTile>
        </div>
        <HomeTile
          span={"min-h-[250px] flex-[0.445] w-full"}
          textToAnimate="Misc"
        >
          Misc
        </HomeTile>
      </div>
    </div>
  );
};
export default Home;
