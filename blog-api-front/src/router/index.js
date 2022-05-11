import Vue from 'vue'
import Router from 'vue-router'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'MainPage',
      component: () => import('@/components/MainPage')
    },
    {
      path: '/page/:pageId',
      name: 'Page',
      component: () => import('@/components/Page')
    },
    {
      path: '/newpage',
      name: 'newPage',
      component: () => import('@/components/NewPage')
    },
    {
      path: '/editpage/:pageId',
      name: 'editPage',
      component: () => import('@/components/EditPage')
    },
    {
      path: '/page/:pageId/comments/',
      name: 'Comments',
      component: () => import('@/components/Comments')
    },
    {
      path: '/signin',
      name: 'Signin',
      component: () => import('@/components/Signin'),
      beforeEnter: (to, from, next) => {
        if (localStorage.signedIn) {
          // this.$router.push('/')
          return false
        } else next()
      }
    },
    {
      path: '/signup',
      name: 'Signup',
      component: () => import('@/components/Signup')
    },
    {
      path: '/404',
      name: 'ErrNotFound',
      component: () => import('@/components/ErrNotFound')
    },
    {
      path: '/panel',
      name: 'AdminPanel',
      component: () => import('@/components/AdminPanel')
    },
    {
      path: '/panel/users',
      name: 'AdminPanelUsers',
      component: () => import('@/components/AdminPanelUsers')
    },
    {
      path: '/panel/pages',
      name: 'AdminPanelPages',
      component: () => import('@/components/AdminPanelPages')
    },
    {
      path: '/panel/pages/:pageId',
      name: 'AdminPanelPage',
      component: () => import('@/components/AdminPanelPage')
    },
    {
      path: '/panel/users/:userId',
      name: 'AdminPanelUser',
      component: () => import('@/components/AdminPanelUser')
    },
    {
      path: '/edituser',
      name: 'EditUser',
      component: () => import('@/components/EditUser')
    }
  ]
})
