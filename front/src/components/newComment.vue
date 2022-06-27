<template>
  <div>
    <form method="post" @submit.prevent="buttonNewComment">
      <div>
        <label for="comment"></label>
        <hr />
        <input
          type="text"
          id="comment"
          class="form-control form-control-lg"
          v-model="comment"
        />
      </div>
      <button type="submit" class="btn btn-success btn-lg btn-block">Envoyer</button>
    </form>
    <div class="error" v-if="error">
      {{ error }}
    </div>
  </div>
</template>

<script>
import axios from "axios";
export default {
  name: "NewComment",
  props: {
    id: { type: Number },
  },
  data() {
    return {
      comment: "",
      error: "",
    };
  },
  methods: {
    async buttonNewComment() {
      this.error = "";
      try {
        await axios.post("/api/post/" + this.id + "/comment/", {
          comment: this.comment,
        });
        this.$emit("refresh");
        this.comment = "";
        this.error = "Votre commentaire a bien été envoyé !";
      } catch (error) {
        console.log(error);
      }
    },
  },
};
</script>
