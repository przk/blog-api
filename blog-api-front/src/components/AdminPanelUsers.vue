<template>
  <div>
    <router-link to = "/panel">&lt; Admin panel</router-link>
    <h1>Users</h1>
    <p>Click a user to manage their email and admin privileges.</p>
      <div class="row list mx-0">
        <router-link :to = "'/panel/users/' + user.id" v-bind:class = "{'list-row alternate fw-bolder': user.role === 'admin', 'list-row alternate': user.role !== 'admin'}" v-for = "user in users" v-bind:key = "user" >{{user.email}}</router-link>
      </div>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  name: 'AdminPanelUsers',
  data () {
    return {
      users: []
    }
  },
  mounted () {
    if (!localStorage.signedIn) {
      this.$router.push('/signin')
    } else if (localStorage.role !== 'admin') {
      this.$router.go(-1)
    }
    axios.get('/users', { headers: { 'Authorization': 'Basic ' + localStorage.csrf } })
      .then(response => {
        this.users = response.data
      })
      .catch(error => {
        console.log(error)
      })
  }
}
</script>
