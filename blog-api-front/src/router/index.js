import Vue from 'vue'
import Router from 'vue-router'

Vue.use(Router)

function checkIfAdminOrGoBack (to, from, next) {
  if (!localStorage.csrf) next('/signin')
  else if (localStorage.role !== 'admin') next(from.path)
  else next()
}

export default new Router(
  {
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
        component: () => import('@/components/AdminPanel'),
        beforeEnter: checkIfAdminOrGoBack
      },
      {
        path: '/panel/users',
        name: 'AdminPanelUsers',
        component: () => import('@/components/AdminPanelUsers'),
        beforeEnter: checkIfAdminOrGoBack
      },
      {
        path: '/panel/pages',
        name: 'AdminPanelPages',
        component: () => import('@/components/AdminPanelPages'),
        beforeEnter: checkIfAdminOrGoBack
      },
      {
        path: '/panel/pages/:pageId',
        name: 'AdminPanelPage',
        component: () => import('@/components/AdminPanelPage'),
        beforeEnter: checkIfAdminOrGoBack
      },
      {
        path: '/panel/users/:userId',
        name: 'AdminPanelUser',
        component: () => import('@/components/AdminPanelUser'),
        beforeEnter: checkIfAdminOrGoBack
      },
      {
        path: '/edituser',
        name: 'EditUser',
        component: () => import('@/components/EditUser')
      }
    ]
  }
)
