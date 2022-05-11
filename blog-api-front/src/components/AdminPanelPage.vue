<template>
  <div>
    <router-link to="/panel/pages">&lt; Admin panel/Pages</router-link>
    <h1>Page comments</h1>
    <div class="row list mx-0">
      <span v-for="comment in comments" :key="comment" class="list-row alternate">
        <button class="btn btn-danger btn-sm" @click="deleteComment(comment.id)">Delete</button>
        <b>{{comment.name}}:</b> {{comment.body}}
      </span>
      <span v-if="!comments[0]">No comments</span>
    </div>
  </div>
</template>

<script>
import axios from 'axios'

export default{
  name: 'AdminPanelPage',
  data () {
    return {
      comments: []
    }
  },
  mounted () {
    if (!localStorage.csrf) {
      this.$router.push('/signin')
    } else if (localStorage.role !== 'admin') {
      this.$router.go(-1)
    }
    axios.get('/pages/' + this.$route.params.pageId + '/comments')
      .then(response => {
        this.comments = response.data
      })
      .catch(error => {
        console.log(error)
      })
  },
  methods: {
    deleteComment (commentId) {
      if (confirm('Do you want to remove this comment forever?')) {
        axios.delete(`admin/pages/${this.$route.params.pageId}/comments/${commentId}`, { headers: { 'Authorization': 'Basic ' + localStorage.csrf } })
          .then(() => {
            this.$router.go()
          }).catch(error => {
            console.log(error)
          })
      }
    }
  }
}
</script>
