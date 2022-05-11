<template>
  <div>
    <router-link to="/">&lt; Main page</router-link>
    <div class="alert alert-danger" v-if="error">{{ error }}</div>
    <form @submit="newPage">
      <div class="form-group">
        <label for="title">Title</label>
        <input type="text" v-model="pgtitle" id="title" class="form-control" />
      </div>
      <div class="form-group">
        <label for="body">Content</label>
        <textarea v-model="pgbody" id="body" class="form-control" />
      </div>
      <button type="submit" class="btn btn-primary">Submit</button>
      <router-link to="/" class="btn btn-secondary" >Cancel</router-link>
    </form>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  name: 'NewPage',
  data () {
    return {
      pgtitle: '',
      pgbody: '',
      error: ''
    }
  },
  mounted () {
    if (!localStorage.csrf) this.$router.push('/signin')
    else if (localStorage.role !== 'admin') this.$router.go(-1)
  },
  methods: {
    newPage (obj) {
      obj.preventDefault()
      axios.post('admin/pages/', null, { params: { title: this.pgtitle, body: this.pgbody }, headers: { 'Authorization': 'Basic ' + localStorage.csrf } })
        .then(response => {
          if (response.status === 200) {
            this.$router.push('page/' + response.data.id)
          }
        }).catch(error => {
          console.log(error)
          this.error = error.message
        })
    }
  }
}
</script>
