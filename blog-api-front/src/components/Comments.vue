<template>
  <div>
    <div v-for="comment in comments" v-bind:key="comment.id">
      <b>{{ comment.name }}:</b> {{ comment.body }}
    </div>
    <form v-if="signedIn" class="form-group" v-on:submit="newComment">
      <h4>Add your comment</h4>
      <small>Your email address will be published</small>
      <input type="email" v-model="uname" placeholder="name" class="form-control" disabled="disabled" hidden="hidden" />
      <textarea v-model="comment" placeholder="comment" class="form-control" />
      <button type="submit" class="btn btn-primary">Submit</button>
    </form>
    <div v-else>
      <router-link to="/signin">Sign in</router-link> to add a comment
    </div>
  </div>
</template>

<script>
import axios from 'axios'
export default {
  data () {
    return {
      comments: '',
      uname: '',
      comment: '',
      signedIn: false
    }
  },
  mounted () {
    axios.get(`pages/${this.$route.params.pageId}/comments`)
      .then(response => {
        this.comments = response.data
      }).catch(error => {
        console.log(error)
      })
    this.signedIn = localStorage.signedIn
    this.uname = localStorage.email
  },
  methods: {
    newComment (obj) {
      obj.preventDefault()
      axios.post(`admin/pages/${this.$route.params.pageId}/comments`, null, { params: { name: this.uname, body: this.comment }, headers: { 'Authorization': 'Basic ' + localStorage.csrf } })
        .then(response => {
          if (response.data.name === this.uname) {
            window.location.reload()
          }
        }).catch(error => {
          console.log(error)
        })
    }
  }
}
</script>
