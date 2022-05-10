<template>
  <div>
    <router-link to = "/">&lt; Main page</router-link>
      <h2>{{ title }}
        <span v-if = "admin">
          <button class = "btn btn-outline-danger btn-sm" @click = "deletePage">Delete</button>
          <router-link :to = "'/editpage/' + this.$route.params.pageId" class = "btn btn-outline-primary btn-sm">Edit</router-link>
        </span>
      </h2>
      <p>{{ body }}</p>
      <h3>Comments</h3>
      <Comments />
  </div>
</template>

<script>
import axios from 'axios'
import Comments from './Comments'

export default {
  name: 'MainPage',
  data () {
    return {
      title: 'Loading',
      body: '',
      comments: [],
      admin: false
    }
  },
  mounted () {
    if (localStorage.csrf && localStorage.role === 'admin') this.admin = true
    axios.get('pages/' + this.$route.params.pageId)
      .then(response => {
        this.title = response.data.title
        this.body = response.data.body
      }).catch(error => {
        console.log(error)
        location.replace('#/404')
      })
  },
  components: {
    Comments
  },
  methods: {
    deletePage () {
      if (confirm('Do you want to delete this page forever?')) {
        axios.delete('admin/pages/' + this.$route.params.pageId, { headers: { 'Authorization': 'Basic ' + localStorage.csrf } })
          .then(response => {
            if (response.status === 200) {
              this.$router.push('/')
            }
          }).catch(error => {
            console.log(error)
          })
      }
    }
  }
}
</script>
