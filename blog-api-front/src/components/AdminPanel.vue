<template>
  <div>
    <router-link to="/">&lt; Main page</router-link>
    <h1>Admin panel</h1>
    <div class="container fluid row px-0 mx-0">
      <div class="col-12 px-0">
          <h2>Menu</h2>
          <div class="row list mx-0">
              <router-link to="panel/users" class="list-row alternate">Users</router-link>
              <router-link to="panel/pages" class="list-row alternate">Pages</router-link>
          </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'AdminPanel',
  data () {
    return {
    }
  }
}
</script>
