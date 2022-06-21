<template>
  <div>
    <h1 class="titleWall">Forum Groupomania</h1>
    <div id="container">
      <div class="allpost">
        <allPost />
      </div>
      <div class="newpost">
        <newPost />
      </div>
    </div>
  </div>
</template>

<script>
import allPost from "../components/allPost";
import newPost from "../components/newPost";
export default {
  name: "wall",
  components: {
    allPost,
    newPost,
  },
  data() {
    return {
      token: "",
      allPost: [],
    };
  },
};
</script>