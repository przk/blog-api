<template>
  <div>
    <router-link :to="'/page/' + this.$route.params.pageId">&lt; Page</router-link>
    <form @submit="editPage">
      <div class="form-group">
        <label for="title">Title</label>
        <input type="text" v-model="pgtitle" id="title" class="form-control" />
      </div>
      <div class="form-group">
        <label for="body">Content</label>
        <textarea v-model="pgbody" id="body" class="form-control" />
      </div>
      <button type="submit" class="btn btn-primary">Submit</button>
      <router-link :to="`/page/${this.$route.params.pageId}`" class="btn btn-secondary">Cancel</router-link>
    </form>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  name: 'EditPage',
  data () {
    return {
      pgtitle: '',
      pgbody: ''
    }
  },
  mounted () {
    if (!localStorage.csrf) this.$router.push('/signin')
    else if (localStorage.role !== 'admin') this.$router.go(-1)
    axios.get(`pages/${this.$route.params.pageId}`)
      .then(response => {
        this.pgtitle = response.data.title
        this.pgbody = response.data.body
        console.log(this.pgtitle, this.pgbody)
      }).catch(error => {
        console.log(error)
      })
  },
  methods: {
    editPage (obj) {
      obj.preventDefault()
      console.log(obj)
      axios.patch(`admin/pages/${this.$route.params.pageId}`, null, { params: { title: this.pgtitle, body: this.pgbody }, headers: { 'Authorization': 'Basic ' + localStorage.csrf } })
        .then(() => {
          this.$router.push(`/page/${this.$route.params.pageId}`)
        }).catch(error => {
          console.log(error)
        })
    }
  }
}
</script>
