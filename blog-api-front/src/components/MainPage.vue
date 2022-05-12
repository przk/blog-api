<template>
  <div id="main">
    <h1>Pages</h1>
    <div class="row list mx-0">
      <router-link :to="`/page/${page.id}`" v-for="page in pages" :key="page.id" class="list-row alternate">{{ page.title }}</router-link>
    </div>
    <router-link v-if="signedIn && admin" to="newpage" class="btn btn-warning">Add page +</router-link>
  </div>
</template>

<script>
export default {
  name: 'MainPage',
  data () {
    return {
      pages: [],
      signedIn: false,
      admin: false
    }
  },
  mounted () {
    this.signedIn = localStorage.signedIn
    this.admin = localStorage.role === 'admin'
    this.plain.get('pages')
      .then(response => (this.pages = response.data))
      .catch(error => console.log(error))
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
