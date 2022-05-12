<template>
  <div>
    <router-link to="/panel/users">&lt; Admin panel/Users</router-link>
    <h1>Edit user</h1>
    <form v-on:submit="submitUser">
      <label for="name">Name</label>
      <input type="text" class="form-control" v-model="uname" id="name" />
      <label for="email">Email</label>
      <input type="email" class="form-control" v-model="email" id="email" />
      <label for="admin">Administrator</label>
      <div class="form-check">
        <input type="radio" class="form-check-input" name="flexRadioDefault" id="member" value="member" v-model="role" />
        <label for="member">Member</label>
        <br />
        <input type="radio" class="form-check-input" name="flexRadioDefault" id="admin" value="admin" v-model="role" />
        <label for="admin">Admin</label>
      </div>
      <button type="submit" class="btn btn-primary">Submit</button>
      <router-link to="/panel/users" class="btn btn-secondary" >Cancel</router-link>
    </form>
  </div>
</template>

<script>
export default {
  name: 'AdminPanelUser',
  data () {
    return {
      uname: '',
      email: '',
      role: ''
    }
  },
  mounted () {
    this.secured.get(`/admin/users/${this.$route.params.userId}`)
      .then(response => {
        this.uname = response.data.name
        this.email = response.data.email
        this.role = response.data.role
      })
      .catch(error => {
        console.log(error)
      })
  },
  methods: {
    submitUser (obj) {
      obj.preventDefault()
      this.secured.patch(`/admin/patchuser/${this.$route.params.userId}`, null, { params: { name: this.uname, email: this.email, role: this.role } })
        .then(() => {
          this.$router.go()
        }).catch(error => {
          console.log(error)
          this.error = error.message
        })
    }
  }
}
</script>
