<template>
  <div>
    <router-link to = "/panel">&lt; Admin panel</router-link>
    <h1>Pages</h1>
    <router-link to = "/newpage" class = "btn btn-warning">Add new +</router-link>
    <div class="row list mx-0">
      <span v-for = "page in pages" v-bind:key = "page" class = "list-row alternate">
        <router-link :to = "'/editpage/' + page.id" class = "btn btn-secondary btn-sm">Edit</router-link>
        <router-link :to = "'/panel/pages/' + page.id" class = "btn btn-primary btn-sm">Comments</router-link>
        <button class = "btn btn-danger btn-sm" @click = "deletePage(page.id)">Delete</button>
        <router-link :to = "'/page/' + page.id">{{page.title}}</router-link>
      </span>
    </div>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  name: 'AdminPanelPages',
  data () {
    return {
      pages: []
    }
  },
  mounted () {
    if (!localStorage.signedIn) {
      this.$router.push('/signin')
    } else if (localStorage.role !== 'admin') {
      this.$router.go(-1)
    }
    axios.get('/pages')
      .then(response => {
        this.pages = response.data
      })
      .catch(error => {
        console.log(error)
      })
  },
  methods: {
    deletePage (pageId) {
      if (confirm('Do you want to delete this page forever?')) {
        axios.delete('admin/pages/' + pageId, { headers: { 'Authorization': 'Basic ' + localStorage.csrf } })
          .then(response => {
            if (response.status === 200) {
              this.$router.go()
            }
          }).catch(error => {
            console.log(error)
          })
      }
    }
  }
}
</script>
