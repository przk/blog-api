<template>
  <div>
    <router-link to="/panel">&lt; Admin panel</router-link>
    <h1>Users</h1>
    <p>Click a user to manage their email and admin privileges.</p>
      <div class="row list mx-0">
        <router-link :to="`/panel/users/${user.id}`" :class="{'list-row alternate fw-bolder': user.role === 'admin', 'list-row alternate': user.role !== 'admin'}" v-for="user in users" :key="user">{{user.email}}</router-link>
      </div>
  </div>
</template>

<script>
export default {
  name: 'AdminPanelUsers',
  data () {
    return {
      users: []
    }
  },
  mounted () {
    this.secured.get('/users')
      .then(response => {
        this.users = response.data
      })
      .catch(error => {
        console.log(error)
      })
  }
}
</script>
