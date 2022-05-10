<template>
  <div id="app">
    <div class="navbar fixed-top navbar-expand navbar-dark bg-primary px-3 py-2" role="navigation">
      <router-link to = "/" class = "navbar-brand">Blog</router-link>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse justify-content-end" id="navbarMain">
        <div v-if = "signedIn">
          <div class="d-none d-sm-inline-block text-light mx-3">{{ email }}</div>
          <router-link to = "/edituser" class = "btn btn-outline-light mx-1">Profile</router-link>
          <router-link to = "/panel" v-if = "admin" class = "btn btn-light mx-1">Panel</router-link>
          <a href = "javascript:;" class = "btn btn-outline-danger mx-1" @click = "logout">Log out</a>
        </div>
        <div v-else>
          <router-link to = "/signup" class = "btn btn-outline-light mx-1">Sign up</router-link>
          <router-link to = "/signin" class = "btn btn-light mx-1">Log in</router-link>
        </div>
      </div>
    </div>

    <div class="container container-fluid pt-5">
      <div v-if = "notice">
        <p class="alert alert-success">{{ notice }}</p>
      </div>
      <div v-if = "alert">
        <p class="alert alert-danger">{{ alert }}</p>
      </div>
      <router-view/>
    </div>
  </div>
</template>

<script>
export default {
  name: 'App',
  data () {
    return {
      alert: '',
      notice: '',
      csrf: '',
      email: '',
      signedIn: false,
      admin: false
    }
  },
  mounted () {
    if (localStorage.signedIn) {
      this.signedIn = true
      this.csrf = localStorage.getItem('csrf')
      this.email = localStorage.email
      this.admin = (localStorage.role === 'admin')
    }
  },
  methods: {
    logout () {
      delete localStorage.csrf
      delete localStorage.signedIn
      delete localStorage.email
      this.email = ''
      this.csrf = ''
      window.location.reload()
    }
  }
}
</script>

<style>
@import './assets/application.css';

#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: left;
  color: #2c3e50;
  margin: 30px;
}
</style>
