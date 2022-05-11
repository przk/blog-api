import axios from 'axios'

const state = {
  user: null
}

const getters = {
  isAuthenticated: state => state.user,
  stateUser: state => state.user
}

const actions = {
  async register ({dispatch}, form) {
    await axios.post('register', form)
    let UserForm = new FormData()
    UserForm.append('username', form.username)
    UserForm.append('password', form.password)
    await dispatch('LogIn', UserForm)
  },
  async logIn ({commit}, User) {
    await axios.post('login', User)
    await commit('setUser', User.get('username'))
  },
  async logOut ({commit}) {
    let user = null
    commit('logout', user)
  }
}

const mutations = {
  setUser (state, username) {
    state.user = username
  },
  logout (state) {
    state.user = null
  }
}

export default {
  state,
  getters,
  actions,
  mutations
}
