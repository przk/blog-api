<template>
  <div>
    <h1>User profile</h1>
    <form @submit="submitForm">
      <label for="name">Name</label>
      <input type="text" id="name" v-model="uname" class="form-control" />
      <label for="email">Email</label>
      <input type="email" id="email" v-model="email" class="form-control" />
      <label for="role">Role</label>
      <input type="text" id="role" v-model="role" class="form-control" disabled="disabled" />
      <label for="created">Created at</label>
      <input type="text" id="created" v-model="createdAt" class="form-control" disabled="disabled" />
      <button type="submit" class="btn btn-primary">Submit</button>
      <router-link to="/" class="btn btn-secondary">Cancel</router-link>
    </form>
  </div>
</template>

<script>
import axios from 'axios'

export default{
  name: 'EditUser',
  data () {
    return {
      uname: '',
      email: '',
      id: '',
      createdAt: '',
      role: ''
    }
  },
  mounted () {
    axios.get('/admin/user', { headers: { 'Authorization': 'Basic ' + localStorage.csrf } })
      .then(response => {
        this.id = response.data.id
        this.uname = response.data.name
        this.email = response.data.email
        this.createdAt = response.data.created_at
        this.role = response.data.role
      })
      .catch(error => {
        console.log(error)
      })
  },
  methods: {
    submitForm (obj) {
      obj.preventDefault()
      axios.patch(`/admin/users/${this.id}`, null, { params: { name: this.uname, email: this.email }, headers: { 'Authorization': 'Basic ' + localStorage.csrf } })
        .then(() => {
          this.$router.go(-1)
        })
        .catch(error => {
          console.log(error)
          this.error = error.message
        })
    }
  }
}
</script>
