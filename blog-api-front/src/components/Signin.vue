<template>
  <div class="signin">
    <form class = "form-signin" @submit.prevent = "signin">
      <div class = "alert alert-danger" v-if = "error">{{ error }}</div>
      <div class = "form-group">
        <label for = "email">Email address</label>
        <input v-model = "email" type = "email" class = "form-control" id = "email" placeholder = "email@example.com" />
      </div>
      <div class = "form-group">
        <label for = "password">Password</label>
        <input v-model = "password" type = "password" class = "form-control" id = "password" placeholder = "Password" />
      </div>
      <button type = "submit" class = "btn btn-primary mb-3">Sign in</button>
      <div>
        <router-link to = "signup">Sign up</router-link>
      </div>
    </form>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  name: 'Signin',
  data () {
    return {
      email: '',
      password: '',
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
    signin () {
      // this.$http.plain.post('/signin', {email: this.email, password: this.password})
      axios.post('/auth/login', {email: this.email, password: this.password})
        .then(response => {
          if (!response.data.token) {
            return
          }
          localStorage.setItem('csrf', response.data.token) // .csrf
          localStorage.signedIn = true
          localStorage.email = this.email
          localStorage.role = response.data.role
          this.error = ''
          window.location.reload()
        })
        .catch(error => {
          this.error = 'Login failed'
          console.log(error)
          delete localStorage.csrf
          delete localStorage.signedIn
          delete localStorage.email
        })
    },
    checkSignedIn () {
      if (localStorage.signedIn) {
        this.$router.push('/')
      }
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.form-signin {
  width: 70%;
  max-width: 500px;
  padding: 10% 15px;
  margin: 0 auto;
}
</style>
