<template>
  <div class="vue-tempalte">
    <form method="post" @submit.prevent="buttonNewPost">
      <h3>Nouveau post</h3>
      <div>
        <label for="title">Titre :</label><br />
        <input
          type="title"
          id="title"
          v-model="title"
          class="form-control form-control-lg"/>
      </div>
      <div>
        <label for="content">Description :</label><br />
        <input
          type="text"
          id="content"
          v-model="content"
          class="form-control form-control-lg"/>
      </div>
      <div>
        <!-- <label for="File" class="file">(Image facultative)</label> -->
        <input type="file" id="file" ref="file" @change="selectFile()" />
      </div>
      <button type="submit" class="btn btn-dark btn-lg btn-block"  @click.prevent="buttonNewPost">Envoyer</button>
    </form>
  </div>
</template>
//----------------------------------------------------------------------------------------------------------------------
<script>
import axios from "axios";
export default {
  name: "newPost",
  data() {
    return {
      userId: localStorage.getItem("userId"),
      token: "",
      title: "",
      content: "",
      file: null,
    };
  },
  methods: {
    selectFile() {
      this.file = this.$refs.file.files[0];
    },
    buttonNewPost() {
      const data = new FormData();
      //avec image
      if (this.file !== null) {
        data.append("userId", this.userId);
        data.append("title", this.title);
        data.append("content", this.content);
        data.append("image", this.file, this.file.name);
        //sans image
      } else {
        data.append("userId", this.userId);
        data.append("title", this.title);
        data.append("content", this.content);
      }
      axios
        .post("http://localhost:3000/api/post", data)
        .then(() => {
          alert("Votre message a bien été envoyé !");
          window.location.reload();
        })
        .catch(console.error());
    },
  },
};
</script>
