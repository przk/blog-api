<template>
  <div>
    <form class = "form-signup" @submit.prevent = "signup">
      <div class = "alert alert-danger" v-if = "error">{{ error }}</div>
      <div class = "form-group">
        <label for = "name">Username</label>
        <input v-model = "name" type = "text" class = "form-control" id = "name" placeholder = "Username" />
      </div>
      <div class = "form-group">
        <label for = "email">Email address</label>
        <input v-model = "email" type = "email" class = "form-control" id = "email" placeholder = "email@example.com" />
      </div>
      <div class = "form-group">
        <label for = "password">Password</label>
        <input v-model = "password" type = "password" class = "form-control" id = "password" placeholder = "Password" />
      </div>
      <div class = "form-group">
        <label for = "password_confirmation">Password confirmation</label>
        <input v-model = "password_confirmation" type = "password" class = "form-control" id = "password_confirmation" placeholder = "Password" />
      </div>
      <button type = "submit" class = "btn btn-primary mb-3">Sign up</button>
      <div>
        <router-link to = "/signin">Sign in</router-link>
      </div>
    </form>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  name: 'Signup',
  data () {
    return {
      name: '',
      email: '',
      password: '',
      password_confirmation: '',
      error: ''
    }
  },
  created () {
    this.checkSignedIn()
  },
  updated () {
    this.checkSignedIn()
  },
  mounted () {
    if (localStorage.csrf) this.$router.push('/')
  },
  methods: {
    signup () {
      axios.post('/users', { name: this.name, email: this.email, password: this.password, password_confirmation: this.password_confirmation })
        .then(response => {
          if (!response.data.name) {
            this.error = response.data
            return
          }
          this.error = ''
          this.$router.push('/signin')
        })
        .catch(error => {
          this.error = (error.message) || ''
          for (var err in error.response.data.errors) this.error += ' ' + error.response.data.errors[err]
        })
    },
    checkSignedIn () {
      if (localStorage.signedIn) {
        this.$router.replace('/')
      }
    }
  }
}
</script>

<style lang="css">
.form-signup {
  width: 70%;
  max-width: 500px;
  padding: 10% 15px;
  margin: 0 auto;
}
</style>
