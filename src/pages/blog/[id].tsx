import * as React from "react";
import { useRouter } from "next/router";

const Blog: React.FC = () => {
  const router = useRouter();

  const id = router.query.id;

  return <div>Blog {id}</div>;
};

export default Blog;
